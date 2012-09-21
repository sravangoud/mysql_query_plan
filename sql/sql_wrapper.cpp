/*
 * sql_wrapper.cpp
 *
 *  Created on: 10-Aug-2012
 *      Author: sravang
 */
#include <iostream>
#include <stdio.h>
#include <stdarg.h>
using namespace std;
#include "sql_select.h"
#include "sql_parse.h"
#include "config.h"
#include "sql_lex.h"
#include "sql_base.h"
#include "unireg.h"                             // SPECIAL_SAME_DB_NAME
#include "init.h"         // unireg_init
#include "keycaches.h"
#include "rpl_filter.h"
#include "unireg.h"
#include "sql_partition.h"     /* partition_info.h: LIST_PART_ENTRY */
#include "sql_show.h"
#include "tztime.h"
#include "sql_db.h"
#include "sql_wrapper.h"
#include "string"

struct Table_Info
{
	string table_name;
	string alias_name;
	List<string> Fields;
};

struct Field_Info
{
	//	char * field_name;
	//	char * table_name;
	string field_name;
	string table_name;
};

//List of tables created on-the-fly
List<Table_Info> gCreatedTableList;

const char * WorkingDir = "/home/sravang/Notes/Temp_New/";
const char * DB_Name = "sravan";
const char * Slash = "/";
const char * table_ext = ".frm";

//External functions -->

TABLE_LIST ** make_leaves_list(TABLE_LIST **list, TABLE_LIST *tables); //sql_base.cc


//External functions <--


//Function Declarations -->
void Initialize_SQL_Env(void);
void Create_THD(THD *& pthd );
void Parse_Query( THD * pthd, char * query );
void Create_Data( THD * pthd );
void Create_Data_HardCode( THD * pthd, char * query );
int Explain_Query( THD * pthd );
void Display_Result( void );
void Cleanup( void );
void PrintTableInfo(TABLE_LIST * itable );
void mysql_parse_local(THD *thd, char *rawbuf, uint length, Parser_state *parser_state);
void Create_Data_V1( THD * pthd, char * query );
void PrintSelectLexInfo( SELECT_LEX * iselect_lex );
void CreateTable( THD *thd, Table_Info * tb_info );
void Populate_Table_List( THD * ipthd, List<Table_Info> & Table_List );
void Populate_Field_Info( SELECT_LEX * iselect_lex, List<Field_Info> & oField_List );

void Merge_Table_Fields( List<Table_Info> & Table_List,List<Field_Info> & oField_List );

void Filter_Table_Info(List<Table_Info> & table_List, List<Table_Info> & table_List_filtered);
void Filter_Field_Info( List<Field_Info> &field_List,List<Field_Info> &field_List_filtered);
void Create_Data_V3( THD * ipthd );
void PrintHeaders();

void DeleteTables();
//Function Declarations <--

static char *get_relative_path(const char *path)
{
	if (test_if_hard_path(path) &&
			is_prefix(path,DEFAULT_MYSQL_HOME) &&
			strcmp(DEFAULT_MYSQL_HOME,FN_ROOTDIR))
	{
		path+=(uint) strlen(DEFAULT_MYSQL_HOME);
		while (*path == FN_LIBCHAR || *path == FN_LIBCHAR2)
			path++;
	}
	return (char*) path;
}

sql_wrapper::sql_wrapper() {
	// TODO Auto-generated constructor stub

}

sql_wrapper::~sql_wrapper() {
	// TODO Auto-generated destructor stub
}

void sql_wrapper::select_describe( char * query )
{
	DBUG_PRINT("Enter", ("select_describe") );
	cout<<"sql_wrapper::select_describe -->"<<endl;

	//Initialize the neccessary SQL Environment
	Initialize_SQL_Env();

	//Create the Thread Data Descriptor
	THD * pthd = NULL;
	Create_THD( pthd );

	//Parse the Query
	Parse_Query( pthd, query );

#if(0)
	//Create the temporary data(tables and fields)
	//Create_Data( pthd );
	//Create_Data_HardCode( pthd );
	//char * query_create = "create table t1 ( a varchar(256), b varchar(256) ) engine=foo;";
	//char * query_create = "create table t1 ( a int, b int );";
	//Create_Data_V1( pthd, query_create );
	Create_Data_V3( pthd );
#else

	//Create Data
	Create_Data_V3( pthd );

	PrintHeaders();

	//Run the execute command
	Explain_Query( pthd );

	//Display the result
	Display_Result();

	//Cleanup
	Cleanup();
#endif

	cout<<"sql_wrapper::select_describe <--"<<endl;
}

//Initializes MYSQL Environment
void Initialize_SQL_Env(void)
{
	my_init();

	//int nRes = my_setwd("/var/lib/mysql/",16);
	//int nRes = my_setwd("/home/sravang/Notes/Temp/",16);
	int nRes = my_setwd(WorkingDir,16);

	char * charset_name = MYSQL_DEFAULT_CHARSET_NAME;
	CHARSET_INFO *default_charset_info = &my_charset_latin1;
	default_charset_info= get_charset_by_csname(charset_name, MY_CS_PRIMARY, MYF(MY_WME));

	global_system_variables.time_zone= my_tz_SYSTEM;

	global_system_variables.collation_server=	 default_charset_info;
	global_system_variables.collation_database=	 default_charset_info;
	global_system_variables.collation_connection=  default_charset_info;
	global_system_variables.character_set_results= default_charset_info;
	global_system_variables.character_set_client=  default_charset_info;

	system_charset_info= &my_charset_utf8_general_ci;
	files_charset_info=&my_charset_utf8_general_ci;

	const char * temp_home = "/usr/";
	strncpy(mysql_home,temp_home,strlen(temp_home)+1);
	//my_realpath(mysql_home,mysql_home,MYF(0));
	convert_dirname(opt_plugin_dir, opt_plugin_dir_ptr ? opt_plugin_dir_ptr :
			get_relative_path(PLUGINDIR), NullS);
	(void) my_load_path(opt_plugin_dir, opt_plugin_dir, mysql_home);
	opt_plugin_dir_ptr= opt_plugin_dir;


	mdl_init();

	unireg_init(SPECIAL_ENGLISH);

	pthread_key_create(&THR_THD,NULL);
	pthread_key_create(&THR_MALLOC,NULL);

	randominit(&sql_rand,(ulong) server_start_time,(ulong) server_start_time/2);

	sys_var_init();

	process_key_caches(&ha_init_key_cache);

	int nArgCount = 3;
	//first argument is not considered in plugin intialization...
	//populate it with some junk
	//not sure about other arguments.
	const char * arg0 ="junk_it_is_not_used";//"/home/sravang/sql_custom_storage/mysql-5.5/sql/mysqld";
	const char * arg1="--myisam-recover=BACKUP";
	const char * arg2="----args-separator----";

	const char * ArgValues[3];

	ArgValues[0] = arg0;
	ArgValues[1] = arg1;
	ArgValues[2] = arg2;

	table_def_init();

	rpl_filter= new Rpl_filter;
	binlog_filter= new Rpl_filter;

	init_tmpdir(&mysql_tmpdir_list, "/tmp");

	plugin_init(&nArgCount, (char **)ArgValues,0);

	//acl_init(false);
	//grant_init();
}

void Create_THD(THD *& pthd )
{
	pthd = new THD();

	//init_server_components();

	//THD thd_temp;
	//THD *thd= &thd_temp;

	pthd->thread_stack= (char*) &pthd;
	pthd->store_globals();

	//pthd = current_thd;

	pthd->init_for_queries();

	//my_pthread_setspecific_ptr(THR_THD, pthd);

	//pthd->update_charset();

	//JOIN Join;

	/* Set collactions that depends on the default collation */
	pthd->variables.collation_server=	 default_charset_info;
	pthd->variables.collation_database=	 default_charset_info;
	pthd->variables.collation_connection=  default_charset_info;
	pthd->variables.character_set_results= default_charset_info;
	pthd->variables.character_set_client=  default_charset_info;
	//pthd->variables.character_set_filesystem= get_charset_by_csname( NULL/*character_set_filesystem_name*/,
	//                              MY_CS_PRIMARY, MYF(MY_WME));

	pthd->lex->sql_command = SQLCOM_END;
}

void Parse_Query( THD * pthd, char * query )
{
	bool bRes = alloc_query( pthd, query, strlen(query));


	if( false == bRes )
	{
		initialize_information_schema_acl();

		pthd->security_ctx->host=(char*) "localhost";

		Parser_state pState;//pState = new Parser_state();
		pState.init(pthd, query, strlen(query) );

		//mysql_parse(pthd, query, strlen(query), &pState);
		mysql_parse_local(pthd, pthd->query(), pthd->query_length(), &pState);
	}
}


void Create_Data_HardCode( THD * pthd, char * query )
{
	THD * thd_create = NULL;
	Create_THD(thd_create);
	//char * query_1 = "create table myt123(id int primary key, id2 int, name varchar(256)) engine=foo;";
	//char * query_1 = "create table myt1234(id int, id2 int, name varchar(256));";
	//char * query_1 = "create table myt12(id int);";
	bool bRes = alloc_query( thd_create, query, strlen(query));
	Parser_state pState_1;
	pState_1.init(thd_create, query, strlen(query) );
	//mysql_parse(thd_create, thd_create->query(), thd_create->query_length(), &pState_1);
	mysql_parse_local(thd_create, thd_create->query(), thd_create->query_length(), &pState_1);

	//close_thread_tables(thd);

	//Create a .frm file for each table

	const char *path = "./sravan/myt123.frm";
	const char *db = "sravan";
	const char *table_name = "myt123";

	//Populate the HA_CREATE_INFO appropriately

	//Create a field list
	List<Create_field> create_fields;
	Create_field f1;
	memset(&f1, 0, sizeof(f1));
	f1.field_name = "id";
	f1.sql_type = MYSQL_TYPE_LONG;
	f1.length = 11;
	f1.char_length = 11;
	f1.pack_length = 4;
	f1.key_length = 4;
	f1.row = 4;
	f1.col = 4;
	f1.sc_length = 11;
	f1.pack_flag = 32795;
	f1.charset = default_charset_info;
	f1.comment.str = NULL;
	f1.comment.length = 0;

	Create_field f2;
	memset(&f2, 0, sizeof(f2));
	f2.field_name = "id2";
	f2.sql_type = MYSQL_TYPE_LONG;
	f2.length = 11;
	f2.char_length = 11;
	f2.pack_length = 4;
	f2.key_length = 4;
	f2.row = 4;
	f2.col = 4;
	f2.sc_length = 11;
	f2.pack_flag = 32795;
	f2.charset = default_charset_info;
	f2.comment.str = NULL;
	f2.comment.length = 0;
	f2.offset = 4;

	Create_field f3;
	memset(&f3, 0, sizeof(f3));
	f3.field_name = "name";
	f3.sql_type = MYSQL_TYPE_VARCHAR;
	f3.length = 256;
	f3.char_length = 256;
	f3.pack_length = 258;
	f3.key_length = 256;
	f3.row = 4;
	f3.col = 5;
	f3.sc_length = 74;
	f3.pack_flag = 32768;
	f3.charset = default_charset_info;
	f3.comment.str = NULL;
	f3.comment.length = 0;
	f3.offset = 8;

	create_fields.push_back(&f1);
	create_fields.push_back(&f2);
	create_fields.push_back(&f3);


	uint keys = 1;

	//What is key_info???
	//
	KEY *key_info;

	//Get the handler...
	handler *file = NULL;
	file = get_new_handler( (TABLE_SHARE*) 0, thd_create->mem_root, thd_create->lex->create_info.db_type);

	HA_CREATE_INFO create_info = thd_create->lex->create_info;
	//Populate_HA_CREATE_INFO(create_info, file);


	thd_create->work_part_info = NULL;

	/*
partition_info * part_info = NULL;
thd_create->work_part_info = part_info= new partition_info();
if (part_info)
{
	file->set_auto_partitions(part_info);
	part_info->default_engine_type= create_info.db_type;
	part_info->is_auto_partitioned= TRUE;
}
	 */
	//Can we populate HA_CREATE_INFO and handler????

	//Create the .frm file corresponding to the table
	mysql_create_frm( thd_create,/*Context*/
			path,/*Path of the .frm file*/
			db,/*DBName*/
			table_name,
			&create_info,/*Table meta data info*/
			create_fields,/**/
			keys,/**/
			key_info,/**/
			file/**/);

	my_pthread_setspecific_ptr(THR_THD, pthd);
}


int Explain_Query( THD * thd )
{
#if(0)
	int res= FALSE;
	int  up_result= 0;
	LEX  *lex= thd->lex;
	/* first SELECT_LEX (have special meaning for many of non-SELECTcommands) */
	SELECT_LEX *select_lex= &lex->select_lex;
	/* first table of first SELECT_LEX */
	TABLE_LIST *first_table= select_lex->table_list.first;
	/* list of all tables in query */
	TABLE_LIST *all_tables;
	/* most outer SELECT_LEX_UNIT of query */
	SELECT_LEX_UNIT *unit= &lex->unit;
#ifdef HAVE_REPLICATION
	/* have table map for update for multi-update statement (BUG#37051) */
	bool have_table_map_for_update= FALSE;
#endif
	DBUG_ENTER("mysql_execute_command");
#ifdef WITH_PARTITION_STORAGE_ENGINE
	thd->work_part_info= 0;
#endif

	DBUG_ASSERT(thd->transaction.stmt.is_empty() || thd->in_sub_stmt);
	/*
	    In many cases first table of main SELECT_LEX have special meaning =>
	    check that it is first table in global list and relink it first in
	    queries_tables list if it is necessary (we need such relinking only
	    for queries with subqueries in select list, in this case tables of
	    subqueries will go to global list first)

	    all_tables will differ from first_table only if most upper SELECT_LEX
	    do not contain tables.

	    Because of above in place where should be at least one table in most
	    outer SELECT_LEX we have following check:
	    DBUG_ASSERT(first_table == all_tables);
	    DBUG_ASSERT(first_table == all_tables && first_table != 0);
	 */
	lex->first_lists_tables_same();
	/* should be assigned after making first tables same */
	all_tables= lex->query_tables;
	/* set context for commands which do not use setup_tables */
	select_lex->
	context.resolve_in_table_list_only(select_lex->
			table_list.first);

	/*
	    Reset warning count for each query that uses tables
	    A better approach would be to reset this for any commands
	    that is not a SHOW command or a select that only access local
	    variables, but for now this is probably good enough.
	 */
	if ((sql_command_flags[lex->sql_command] & CF_DIAGNOSTIC_STMT) != 0)
		thd->warning_info->set_read_only(TRUE);
	else
	{
		thd->warning_info->set_read_only(FALSE);
		if (all_tables)
			thd->warning_info->opt_clear_warning_info(thd->query_id);
	}

#ifdef HAVE_REPLICATION
	if (unlikely(thd->slave_thread))
	{
		if (lex->sql_command == SQLCOM_DROP_TRIGGER)
		{
			/*
	        When dropping a trigger, we need to load its table name
	        before checking slave filter rules.
			 */
			add_table_for_trigger(thd, thd->lex->spname, 1, &all_tables);

			if (!all_tables)
			{
				/*
	          If table name cannot be loaded,
	          it means the trigger does not exists possibly because
	          CREATE TRIGGER was previously skipped for this trigger
	          according to slave filtering rules.
	          Returning success without producing any errors in this case.
				 */
				DBUG_RETURN(0);
			}

			// force searching in slave.cc:tables_ok()
			all_tables->updating= 1;
		}

		/*
	      For fix of BUG#37051, the master stores the table map for update
	      in the Query_log_event, and the value is assigned to
	      thd->variables.table_map_for_update before executing the update
	      query.

	      If thd->variables.table_map_for_update is set, then we are
	      replicating from a new master, we can use this value to apply
	      filter rules without opening all the tables. However If
	      thd->variables.table_map_for_update is not set, then we are
	      replicating from an old master, so we just skip this and
	      continue with the old method. And of course, the bug would still
	      exist for old masters.
		 */
		if (lex->sql_command == SQLCOM_UPDATE_MULTI &&
				thd->table_map_for_update)
		{
			have_table_map_for_update= TRUE;
			table_map table_map_for_update= thd->table_map_for_update;
			uint nr= 0;
			TABLE_LIST *table;
			for (table=all_tables; table; table=table->next_global, nr++)
			{
				if (table_map_for_update & ((table_map)1 << nr))
					table->updating= TRUE;
				else
					table->updating= FALSE;
			}

			//	      if (all_tables_not_ok(thd, all_tables))
			//	      {
			//	        /* we warn the slave SQL thread */
			//	        my_message(ER_SLAVE_IGNORED_TABLE, ER(ER_SLAVE_IGNORED_TABLE), MYF(0));
			//	        if (thd->one_shot_set)
			//	          reset_one_shot_variables(thd);
			//	        DBUG_RETURN(0);
			//	      }

			for (table=all_tables; table; table=table->next_global)
				table->updating= TRUE;
		}

		/*
	      Check if statment should be skipped because of slave filtering
	      rules

	      Exceptions are:
	      - UPDATE MULTI: For this statement, we want to check the filtering
	        rules later in the code
	      - SET: we always execute it (Not that many SET commands exists in
	        the binary log anyway -- only 4.1 masters write SET statements,
		in 5.0 there are no SET statements in the binary log)
	      - DROP TEMPORARY TABLE IF EXISTS: we always execute it (otherwise we
	        have stale files on slave caused by exclusion of one tmp table).
		 */
		if (!(lex->sql_command == SQLCOM_UPDATE_MULTI) &&
				!(lex->sql_command == SQLCOM_SET_OPTION) &&
				!(lex->sql_command == SQLCOM_DROP_TABLE &&
						lex->drop_temporary && lex->drop_if_exists) //&&
		/*all_tables_not_ok(thd, all_tables)*/)
		{
			/* we warn the slave SQL thread */
			my_message(ER_SLAVE_IGNORED_TABLE, ER(ER_SLAVE_IGNORED_TABLE), MYF(0));
			if (thd->one_shot_set)
			{
				/*
	          It's ok to check thd->one_shot_set here:

	          The charsets in a MySQL 5.0 slave can change by both a binlogged
	          SET ONE_SHOT statement and the event-internal charset setting,
	          and these two ways to change charsets do not seems to work
	          together.

	          At least there seems to be problems in the rli cache for
	          charsets if we are using ONE_SHOT.  Note that this is normally no
	          problem because either the >= 5.0 slave reads a 4.1 binlog (with
	          ONE_SHOT) *or* or 5.0 binlog (without ONE_SHOT) but never both."
				 */
				//reset_one_shot_variables(thd);
			}
			DBUG_RETURN(0);
		}
	}
	else
	{
#endif /* HAVE_REPLICATION */
		/*
	      When option readonly is set deny operations which change non-temporary
	      tables. Except for the replication thread and the 'super' users.
		 */
		//	    if (deny_updates_if_read_only_option(thd, all_tables))
		//	    {
		//	      my_error(ER_OPTION_PREVENTS_STATEMENT, MYF(0), "--read-only");
		//	      DBUG_RETURN(-1);
		//	    }
#ifdef HAVE_REPLICATION
	} /* endif unlikely slave */
#endif

	status_var_increment(thd->status_var.com_stat[lex->sql_command]);

	DBUG_ASSERT(thd->transaction.stmt.modified_non_trans_table == FALSE);

	/*
	    End a active transaction so that this command will have it's
	    own transaction and will also sync the binary log. If a DDL is
	    not run in it's own transaction it may simply never appear on
	    the slave in case the outside transaction rolls back.
	 */
	//	  if (stmt_causes_implicit_commit(thd, CF_IMPLICT_COMMIT_BEGIN))
	//	  {
	//	    /*
	//	      Note that this should never happen inside of stored functions
	//	      or triggers as all such statements prohibited there.
	//	    */
	//	    DBUG_ASSERT(! thd->in_sub_stmt);
	//	    /* Commit or rollback the statement transaction. */
	//	    thd->is_error() ? trans_rollback_stmt(thd) : trans_commit_stmt(thd);
	//	    /* Commit the normal transaction if one is active. */
	//	    if (trans_commit_implicit(thd))
	//	      goto error;
	//	    /* Release metadata locks acquired in this transaction. */
	//	    thd->mdl_context.release_transactional_locks();
	//	  }

#ifndef DBUG_OFF
	//if (lex->sql_command != SQLCOM_SET_OPTION)
	//DEBUG_SYNC(thd,"before_execute_sql_command");
#endif
#endif
	execute_sqlcom_select(thd, thd->lex->query_tables);

	return 0;
}

//Yet to implement
void Display_Result(void)
{

}

//Yet to implement
void Cleanup( void )
{
	DeleteTables();
}

void func(List<int> & iList)
{
	int ii = 5;
	int jj = 6;
	iList.push_back(new int(5));
	iList.push_back(new int(6));
}

void Create_Data( THD * ipthd )
{
	//	SELECT_LEX_UNIT *unit = &(ipthd->lex->unit);
	//	SELECT_LEX *first = unit->first_select();
	//	List<Item> &fields = first->item_list;
	//
	//	Item_ident * field = NULL;
	//	List_iterator<Item> it(fields);
	//	while( (field = (Item_ident *)it++) )
	//	{
	//		const char * field_name = field->field_name;
	//		const char * table_name = field->table_name;
	//		cout<<"Field Name : "<< field_name<<endl;
	//		cout<<"Table Name : "<< table_name<<endl;
	//	}


	//	SELECT_LEX_UNIT *tmp_unit = NULL;//&(ipthd->lex->unit);
	//	SELECT_LEX *sl;

	SELECT_LEX * select_lex = &(ipthd->lex->select_lex);
	PrintSelectLexInfo(select_lex);

	//	for (tmp_unit= select_lex->first_inner_unit();
	//			tmp_unit;
	//			tmp_unit= tmp_unit->next_unit())
	//	{
	//		for (sl= tmp_unit->first_select(); sl; sl= sl->next_select())
	//		{
	//			List<Item> &fields = sl->item_list;
	//
	//			Item_ident * field = NULL;
	//			List_iterator<Item> it(fields);
	//			while( (field = (Item_ident *)it++) )
	//			{
	//				const char * field_name = field->field_name;
	//				const char * table_name = field->table_name;
	//				if(field_name)
	//				cout<<"Field Name : "<< field_name<<endl;
	//				if(table_name)
	//				cout<<"Table Name : "<< table_name<<endl;
	//			}
	//		}
	//	}


	//	SELECT_LEX_UNIT *unit = &(ipthd->lex->unit);
	//	SELECT_LEX *first = unit->first_select();
	//	List<Item> &fields = first->item_list;

	//	Item * field = NULL;
	//	List_iterator<Item> it(fields);
	//	while( field = it++ )
	//	{
	//		char * name = field->name;
	//		cout<<"Field Name : "<< name <<field->orig_name<<endl;
	//	}

	TABLE_LIST *tables = ipthd->lex->query_tables;//Returned by the parser
	TABLE_LIST *leaves = NULL;

	make_leaves_list(&leaves, tables);

	TABLE_LIST *table_list = NULL;
	uint tablenr= 0;

	for (; tables; tables=tables->next_global)
	{
		PrintTableInfo(tables);
	}

	for (table_list= leaves;
			table_list;
			table_list= table_list->next_leaf, tablenr++)
	{
		PrintTableInfo(table_list);
	}

	List<Table_Info> Table_List;

	Table_Info * tb_info = NULL;
	List_iterator<Table_Info> it(Table_List);
	while( tb_info = it++ )
	{
		CreateTable( ipthd, tb_info );
	}

}

void Create_Data_V3( THD * ipthd )
{
	SELECT_LEX * select_lex = &(ipthd->lex->select_lex);
	List<Field_Info> field_List;
	Populate_Field_Info( select_lex, field_List );

	List<Table_Info> Table_List;
	Populate_Table_List( ipthd, Table_List );

	List<Field_Info> field_List_filtered;
	Filter_Field_Info(field_List,field_List_filtered);

	List<Table_Info> Table_List_filtered;
	Filter_Table_Info(Table_List,Table_List_filtered);

	Merge_Table_Fields( Table_List_filtered, field_List_filtered );

	gCreatedTableList = Table_List_filtered;

	Table_Info * tb_info = NULL;
	List_iterator<Table_Info> it(Table_List_filtered);
	while( tb_info = it++ )
	{
		CreateTable( ipthd, tb_info );
	}
}

void Populate_Table_List( THD * ipthd, List<Table_Info> & oTable_List )
{
	TABLE_LIST *tables = ipthd->lex->query_tables;//Returned by the parser
	for (; tables; tables=tables->next_global)
	{
		if(tables)
		{
			Table_Info * tb_info = new Table_Info();
			tb_info->table_name = tables->table_name;
			tb_info->alias_name = tables->alias;
			oTable_List.push_back(tb_info);
		}
	}
}


void Merge_Table_Fields( List<Table_Info> & Table_List,List<Field_Info> & oField_List )
{
	Field_Info * pfield_info = NULL;
	List_iterator<Field_Info> itr_field(oField_List);
	while( pfield_info = itr_field++ )
	{
		string tb_name = pfield_info->table_name;
		Table_Info * ptable_info = NULL;
		List_iterator<Table_Info> itr_table(Table_List);
		while( ptable_info = itr_table++ )
		{
			if(ptable_info->alias_name == tb_name || ptable_info->table_name == tb_name)
			{
				ptable_info->Fields.push_back(&(pfield_info->field_name));
			}
		}
	}
}

//To Do : Use map for lookup
//Not able to use STL Map...for time being use list for lookup...

void Filter_Table_Info(List<Table_Info> & table_List, List<Table_Info> & table_List_filtered)
{
	Table_Info * pTable_Info = NULL;
	List_iterator<Table_Info> itr_table(table_List);
	while( pTable_Info = itr_table++ )
	{
		string derived_table_name = "*";
		if( derived_table_name == pTable_Info->table_name)
			continue;

		bool bAddToOutput = true;
		Table_Info * pTable_Info_filtered = NULL;
		List_iterator<Table_Info> itr_table_filtered(table_List_filtered);
		while( pTable_Info_filtered = itr_table_filtered++ )
		{
			if( (0 == strcasecmp(pTable_Info_filtered->alias_name.c_str(), pTable_Info->alias_name.c_str() ) )
					|| (0 == strcasecmp(pTable_Info_filtered->table_name.c_str(),pTable_Info->table_name.c_str())) )
			{
				bAddToOutput = false;
				break;
			}
		}

		if( true == bAddToOutput )
		{
			table_List_filtered.push_back(pTable_Info);
		}
	}
}

//To Do : Use map for lookup
//Not able to use STL Map...for time being use list for lookup...
void Filter_Field_Info( List<Field_Info> &field_List,List<Field_Info> &field_List_filtered)
{
	Field_Info * pfield_info = NULL;
	List_iterator<Field_Info> itr_field(field_List);
	while( pfield_info = itr_field++ )
	{
		bool bAddToOutput = true;
		Field_Info * pfield_info_filtered = NULL;
		List_iterator<Field_Info> itr_field_filtered(field_List_filtered);
		while( pfield_info_filtered = itr_field_filtered++ )
		{
			if( (0 == strcasecmp(pfield_info_filtered->field_name.c_str(), pfield_info->field_name.c_str()) )
					&& (0 ==strcasecmp(pfield_info_filtered->table_name.c_str(),pfield_info->table_name.c_str())) )
			{
				bAddToOutput = false;
				break;
			}
		}

		if( true == bAddToOutput )
		{
			field_List_filtered.push_back(pfield_info);
		}
	}
}

void CreateTable(  THD *thd, Table_Info * tb_info)
{
	char query[1000];
	sprintf(query, "create table %s ( ", tb_info->table_name.c_str());

	List<string> &field_List = tb_info->Fields;

	string * field = NULL;
	List_iterator<string> it(field_List);
	bool bComma = false;
	while( (field = it++) )
	{
		if(bComma)
			strcat( query, ", " );
		else
			bComma = true;
		strcat( query, field->c_str() );
		strcat( query, " varchar(256)" );
	}

	strcat( query, " ) engine=foo;" );

	cout<<"Print Query --> "<<endl;
	cout<<query<<endl;
	cout<<"Print Query <-- "<<endl;

	Create_Data_V1( thd, query );
}

void DeleteTables()
{
	Table_Info * pTable_Info = NULL;
	List_iterator<Table_Info> itr_table(gCreatedTableList);
	while( pTable_Info = itr_table++ )
	{
		string Table_Path = string(".") + string(Slash) + string(DB_Name) + string(Slash) + string(pTable_Info->table_name) + string(table_ext);
		cout << "Table to delete : "<<Table_Path.c_str() <<endl;
		remove(Table_Path.c_str());
	}
}

void Populate_Field_Info( SELECT_LEX * iselect_lex, List<Field_Info> & oField_List )
{
	if( NULL == iselect_lex )
		return;

	cout<<"Enter Populate_Field_Info : "<<endl;

	List<Item> &fields = iselect_lex->item_list;

	Item_ident * field = NULL;
	List_iterator<Item> it(fields);
	while( (field = (Item_ident *)it++) )
	{
		const char * field_name = field->field_name;
		const char * table_name = field->table_name;
		if(field_name)
			cout<<"Field Name : "<< field_name<<endl;
		if(table_name)
			cout<<"Table Name : "<< table_name<<endl;
		if( field_name && table_name )
		{
			Field_Info * f = new Field_Info();
			f->field_name = field_name;
			f->table_name = table_name;
			oField_List.push_back(f);
		}
	}

	//Handle where condition
	Item * pItem_Where = iselect_lex->where;
	if(pItem_Where)
	{
		Item * pItem = pItem_Where->next;

		while(pItem )
		{
			Item::Type order_item_type = pItem->type();
			if( (order_item_type == Item::FIELD_ITEM) || (order_item_type == Item::REF_ITEM) )
			{
				Item_ident * field_Ident = NULL;
				field_Ident = (Item_ident *)(pItem);

				if(field_Ident)
				{
					const char * field_name = field_Ident->field_name;
					const char * table_name = field_Ident->table_name;
					if(field_name)
						cout<<"Field Name : "<< field_name<<endl;
					if(table_name)
						cout<<"Table Name : "<< table_name<<endl;
					if( field_name && table_name )
					{
						Field_Info * f = new Field_Info();
						f->field_name = field_name;
						f->table_name = table_name;
						oField_List.push_back(f);
					}
				}//if(field_Ident)
			}//if( (order_item_type == Item::FIELD_ITEM) || (order_item_type == Item::REF_ITEM) )

			pItem = pItem->next;
		}
	}


	SELECT_LEX_UNIT *tmp_unit = iselect_lex->first_inner_unit();
	SELECT_LEX *sl;

	for (;tmp_unit; tmp_unit= tmp_unit->next_unit())
	{
		for (sl= tmp_unit->first_select(); sl; sl= sl->next_select())
		{
			Populate_Field_Info(sl, oField_List);
		}
	}
}

void PrintSelectLexInfo( SELECT_LEX * iselect_lex )
{
	if( NULL == iselect_lex )
		return;

	cout<<"Enter PrintSelectLexInfo : "<<endl;

	List<Item> &fields = iselect_lex->item_list;

	Item_ident * field = NULL;
	List_iterator<Item> it(fields);
	while( (field = (Item_ident *)it++) )
	{
		const char * field_name = field->field_name;
		const char * table_name = field->table_name;
		if(field_name)
			cout<<"Field Name : "<< field_name<<endl;
		if(table_name)
			cout<<"Table Name : "<< table_name<<endl;
	}

	SELECT_LEX_UNIT *tmp_unit = iselect_lex->first_inner_unit();
	SELECT_LEX *sl;

	for (;tmp_unit; tmp_unit= tmp_unit->next_unit())
	{
		for (sl= tmp_unit->first_select(); sl; sl= sl->next_select())
		{
			PrintSelectLexInfo(sl);
		}
	}
}

void PrintTableInfo(TABLE_LIST * itable_list )
{
	DBUG_ASSERT(itable_list);
	cout<<"Table Name : "<< itable_list->table_name<<endl;
	cout<<"Table Alias Name : "<< itable_list->alias<<endl;
}

//Hacked the necessary information from sql_parse.cc/mysql_parse()
void mysql_parse_local(THD *thd, char *rawbuf, uint length,
		Parser_state *parser_state)
{
	THD *thd_temp= current_thd;

	lex_start(thd);
	mysql_reset_thd_for_next_command(thd);

	my_pthread_setspecific_ptr(THR_THD, thd);

	system_charset_info= &my_charset_utf8_general_ci;
	table_alias_charset = &my_charset_utf8_general_ci;

	char * db_name = "sravan";
	thd->set_db(db_name, strlen(db_name));
	bool err= parse_sql(thd, parser_state, NULL);
}


void Create_Data_V1( THD * pthd, char * query )
{

	THD * thd_create = NULL;
	Create_THD(thd_create);
	ha_init();
	my_dboptions_cache_init();
	//char * query_1 = "create table myt123(id int , id2 int, name varchar(256), index id_1(id), index id_2(id)) engine=FOO;";
	//char * query_1 = "create table myt123(id int , id2 int, name varchar(256)) engine=FOO;";
	//char * query_1 = "create table myt1234(id int, id2 int, name varchar(256));";
	//char * query_1 = "create table myt12(id int);";
	bool bRes = alloc_query( thd_create, query, strlen(query));
	Parser_state pState_1;
	pState_1.init(thd_create, query, strlen(query) );
	//mysql_parse(thd_create, thd_create->query(), thd_create->query_length(), &pState_1);
	mysql_parse_local(thd_create, thd_create->query(), thd_create->query_length(), &pState_1);

	mysql_execute_command(thd_create);

	//close_thread_tables(thd);

	//Create a .frm file for each table

#if(0)
	int res= FALSE;
	int  up_result= 0;
	LEX  *lex= thd->lex;
	/* first SELECT_LEX (have special meaning for many of non-SELECTcommands) */
	SELECT_LEX *select_lex= &lex->select_lex;
	/* first table of first SELECT_LEX */
	TABLE_LIST *first_table= select_lex->table_list.first;
	/* list of all tables in query */
	TABLE_LIST *all_tables;
	/* most outer SELECT_LEX_UNIT of query */
	SELECT_LEX_UNIT *unit= &lex->unit;
#ifdef HAVE_REPLICATION
	/* have table map for update for multi-update statement (BUG#37051) */
	bool have_table_map_for_update= FALSE;
#endif
	DBUG_ENTER("mysql_execute_command");
#ifdef WITH_PARTITION_STORAGE_ENGINE
	thd->work_part_info= 0;
#endif

	DBUG_ASSERT(thd->transaction.stmt.is_empty() || thd->in_sub_stmt);
	/*
	    In many cases first table of main SELECT_LEX have special meaning =>
	    check that it is first table in global list and relink it first in
	    queries_tables list if it is necessary (we need such relinking only
	    for queries with subqueries in select list, in this case tables of
	    subqueries will go to global list first)

	    all_tables will differ from first_table only if most upper SELECT_LEX
	    do not contain tables.

	    Because of above in place where should be at least one table in most
	    outer SELECT_LEX we have following check:
	    DBUG_ASSERT(first_table == all_tables);
	    DBUG_ASSERT(first_table == all_tables && first_table != 0);
	 */
	lex->first_lists_tables_same();
	/* should be assigned after making first tables same */
	all_tables= lex->query_tables;
	/* set context for commands which do not use setup_tables */
	select_lex->
	context.resolve_in_table_list_only(select_lex->
			table_list.first);

	/*
	    Reset warning count for each query that uses tables
	    A better approach would be to reset this for any commands
	    that is not a SHOW command or a select that only access local
	    variables, but for now this is probably good enough.
	 */
	if ((sql_command_flags[lex->sql_command] & CF_DIAGNOSTIC_STMT) != 0)
		thd->warning_info->set_read_only(TRUE);
	else
	{
		thd->warning_info->set_read_only(FALSE);
		if (all_tables)
			thd->warning_info->opt_clear_warning_info(thd->query_id);
	}

#ifdef HAVE_REPLICATION
	if (unlikely(thd->slave_thread))
	{
		if (lex->sql_command == SQLCOM_DROP_TRIGGER)
		{
			/*
	        When dropping a trigger, we need to load its table name
	        before checking slave filter rules.
			 */
			add_table_for_trigger(thd, thd->lex->spname, 1, &all_tables);

			if (!all_tables)
			{
				/*
	          If table name cannot be loaded,
	          it means the trigger does not exists possibly because
	          CREATE TRIGGER was previously skipped for this trigger
	          according to slave filtering rules.
	          Returning success without producing any errors in this case.
				 */
				DBUG_RETURN(0);
			}

			// force searching in slave.cc:tables_ok()
			all_tables->updating= 1;
		}

		/*
	      For fix of BUG#37051, the master stores the table map for update
	      in the Query_log_event, and the value is assigned to
	      thd->variables.table_map_for_update before executing the update
	      query.

	      If thd->variables.table_map_for_update is set, then we are
	      replicating from a new master, we can use this value to apply
	      filter rules without opening all the tables. However If
	      thd->variables.table_map_for_update is not set, then we are
	      replicating from an old master, so we just skip this and
	      continue with the old method. And of course, the bug would still
	      exist for old masters.
		 */
		if (lex->sql_command == SQLCOM_UPDATE_MULTI &&
				thd->table_map_for_update)
		{
			have_table_map_for_update= TRUE;
			table_map table_map_for_update= thd->table_map_for_update;
			uint nr= 0;
			TABLE_LIST *table;
			for (table=all_tables; table; table=table->next_global, nr++)
			{
				if (table_map_for_update & ((table_map)1 << nr))
					table->updating= TRUE;
				else
					table->updating= FALSE;
			}

			//	      if (all_tables_not_ok(thd, all_tables))
			//	      {
			//	        /* we warn the slave SQL thread */
			//	        my_message(ER_SLAVE_IGNORED_TABLE, ER(ER_SLAVE_IGNORED_TABLE), MYF(0));
			//	        if (thd->one_shot_set)
			//	          reset_one_shot_variables(thd);
			//	        DBUG_RETURN(0);
			//	      }

			for (table=all_tables; table; table=table->next_global)
				table->updating= TRUE;
		}

		/*
	      Check if statment should be skipped because of slave filtering
	      rules

	      Exceptions are:
	      - UPDATE MULTI: For this statement, we want to check the filtering
	        rules later in the code
	      - SET: we always execute it (Not that many SET commands exists in
	        the binary log anyway -- only 4.1 masters write SET statements,
		in 5.0 there are no SET statements in the binary log)
	      - DROP TEMPORARY TABLE IF EXISTS: we always execute it (otherwise we
	        have stale files on slave caused by exclusion of one tmp table).
		 */
		if (!(lex->sql_command == SQLCOM_UPDATE_MULTI) &&
				!(lex->sql_command == SQLCOM_SET_OPTION) &&
				!(lex->sql_command == SQLCOM_DROP_TABLE &&
						lex->drop_temporary && lex->drop_if_exists) //&&
		/*all_tables_not_ok(thd, all_tables)*/)
		{
			/* we warn the slave SQL thread */
			my_message(ER_SLAVE_IGNORED_TABLE, ER(ER_SLAVE_IGNORED_TABLE), MYF(0));
			if (thd->one_shot_set)
			{
				/*
	          It's ok to check thd->one_shot_set here:

	          The charsets in a MySQL 5.0 slave can change by both a binlogged
	          SET ONE_SHOT statement and the event-internal charset setting,
	          and these two ways to change charsets do not seems to work
	          together.

	          At least there seems to be problems in the rli cache for
	          charsets if we are using ONE_SHOT.  Note that this is normally no
	          problem because either the >= 5.0 slave reads a 4.1 binlog (with
	          ONE_SHOT) *or* or 5.0 binlog (without ONE_SHOT) but never both."
				 */
				//reset_one_shot_variables(thd);
			}
			DBUG_RETURN(0);
		}
	}
	else
	{
#endif /* HAVE_REPLICATION */
		/*
	      When option readonly is set deny operations which change non-temporary
	      tables. Except for the replication thread and the 'super' users.
		 */
		//	    if (deny_updates_if_read_only_option(thd, all_tables))
		//	    {
		//	      my_error(ER_OPTION_PREVENTS_STATEMENT, MYF(0), "--read-only");
		//	      DBUG_RETURN(-1);
		//	    }
#ifdef HAVE_REPLICATION
	} /* endif unlikely slave */
#endif

	status_var_increment(thd->status_var.com_stat[lex->sql_command]);

	DBUG_ASSERT(thd->transaction.stmt.modified_non_trans_table == FALSE);

	/*
	    End a active transaction so that this command will have it's
	    own transaction and will also sync the binary log. If a DDL is
	    not run in it's own transaction it may simply never appear on
	    the slave in case the outside transaction rolls back.
	 */
	//	  if (stmt_causes_implicit_commit(thd, CF_IMPLICT_COMMIT_BEGIN))
	//	  {
	//	    /*
	//	      Note that this should never happen inside of stored functions
	//	      or triggers as all such statements prohibited there.
	//	    */
	//	    DBUG_ASSERT(! thd->in_sub_stmt);
	//	    /* Commit or rollback the statement transaction. */
	//	    thd->is_error() ? trans_rollback_stmt(thd) : trans_commit_stmt(thd);
	//	    /* Commit the normal transaction if one is active. */
	//	    if (trans_commit_implicit(thd))
	//	      goto error;
	//	    /* Release metadata locks acquired in this transaction. */
	//	    thd->mdl_context.release_transactional_locks();
	//	  }

#ifndef DBUG_OFF
	//if (lex->sql_command != SQLCOM_SET_OPTION)
	//DEBUG_SYNC(thd,"before_execute_sql_command");
#endif


	DBUG_ASSERT(first_table == all_tables && first_table != 0);
	bool link_to_local;
	TABLE_LIST *create_table= first_table;
	TABLE_LIST *select_tables= lex->create_last_non_select_table->next_global;

	/*
	        Code below (especially in mysql_create_table() and select_create
	        methods) may modify HA_CREATE_INFO structure in LEX, so we have to
	        use a copy of this structure to make execution prepared statement-
	        safe. A shallow copy is enough as this code won't modify any memory
	        referenced from this structure.
	 */
	HA_CREATE_INFO create_info(lex->create_info);
	/*
	        We need to copy alter_info for the same reasons of re-execution
	        safety, only in case of Alter_info we have to do (almost) a deep
	        copy.
	 */
	Alter_info alter_info(lex->alter_info, thd->mem_root);

	if (thd->is_fatal_error)
	{
		/* If out of memory when creating a copy of alter_info. */
		res= 1;
		goto end_with_restore_list;
	}

	if ((res= create_table_precheck(thd, select_tables, create_table)))
		goto end_with_restore_list;

	/* Might have been updated in create_table_precheck */
	create_info.alias= create_table->alias;

#ifdef HAVE_READLINK
	/* Fix names if symlinked tables */
	if (append_file_to_dir(thd, &create_info.data_file_name,
			create_table->table_name) ||
			append_file_to_dir(thd, &create_info.index_file_name,
					create_table->table_name))
		goto end_with_restore_list;
#endif
	/*
	        If no engine type was given, work out the default now
	        rather than at parse-time.
	 */
	if (!(create_info.used_fields & HA_CREATE_USED_ENGINE))
		create_info.db_type= ha_default_handlerton(thd);
	/*
	        If we are using SET CHARSET without DEFAULT, add an implicit
	        DEFAULT to not confuse old users. (This may change).
	 */
	if ((create_info.used_fields &
			(HA_CREATE_USED_DEFAULT_CHARSET | HA_CREATE_USED_CHARSET)) ==
					HA_CREATE_USED_CHARSET)
	{
		create_info.used_fields&= ~HA_CREATE_USED_CHARSET;
		create_info.used_fields|= HA_CREATE_USED_DEFAULT_CHARSET;
		create_info.default_table_charset= create_info.table_charset;
		create_info.table_charset= 0;
	}

#ifdef WITH_PARTITION_STORAGE_ENGINE
	{
		partition_info *part_info= thd->lex->part_info;
		if (part_info && !(part_info= thd->lex->part_info->get_clone()))
		{
			res= -1;
			goto end_with_restore_list;
		}
		thd->work_part_info= part_info;
	}
#endif

	/* Close any open handlers for the table. */
	mysql_ha_rm_tables(thd, create_table);

	if (select_lex->item_list.elements)		// With select
	{
		select_result *result;

		/*
	          CREATE TABLE...IGNORE/REPLACE SELECT... can be unsafe, unless
	          ORDER BY PRIMARY KEY clause is used in SELECT statement. We therefore
	          use row based logging if mixed or row based logging is available.
	          TODO: Check if the order of the output of the select statement is
	          deterministic. Waiting for BUG#42415
		 */
		if(lex->ignore)
			lex->set_stmt_unsafe(LEX::BINLOG_STMT_UNSAFE_CREATE_IGNORE_SELECT);

		if(lex->duplicates == DUP_REPLACE)
			lex->set_stmt_unsafe(LEX::BINLOG_STMT_UNSAFE_CREATE_REPLACE_SELECT);

		/*
	          If:
	          a) we inside an SP and there was NAME_CONST substitution,
	          b) binlogging is on (STMT mode),
	          c) we log the SP as separate statements
	          raise a warning, as it may cause problems
	          (see 'NAME_CONST issues' in 'Binary Logging of Stored Programs')
		 */
		if (thd->query_name_consts &&
				mysql_bin_log.is_open() &&
				thd->variables.binlog_format == BINLOG_FORMAT_STMT &&
				!mysql_bin_log.is_query_in_union(thd, thd->query_id))
		{
			List_iterator_fast<Item> it(select_lex->item_list);
			Item *item;
			uint splocal_refs= 0;
			/* Count SP local vars in the top-level SELECT list */
			while ((item= it++))
			{
				if (item->is_splocal())
					splocal_refs++;
			}
			/*
	            If it differs from number of NAME_CONST substitution applied,
	            we may have a SOME_FUNC(NAME_CONST()) in the SELECT list,
	            that may cause a problem with binary log (see BUG#35383),
	            raise a warning.
			 */
			if (splocal_refs != thd->query_name_consts)
				push_warning(thd,
						MYSQL_ERROR::WARN_LEVEL_WARN,
						ER_UNKNOWN_ERROR,
						"Invoked routine ran a statement that may cause problems with "
						"binary log, see 'NAME_CONST issues' in 'Binary Logging of Stored Programs' "
						"section of the manual.");
		}

		select_lex->options|= SELECT_NO_UNLOCK;
		unit->set_limit(select_lex);

		/*
	          Disable non-empty MERGE tables with CREATE...SELECT. Too
	          complicated. See Bug #26379. Empty MERGE tables are read-only
	          and don't allow CREATE...SELECT anyway.
		 */
		if (create_info.used_fields & HA_CREATE_USED_UNION)
		{
			my_error(ER_WRONG_OBJECT, MYF(0), create_table->db,
					create_table->table_name, "BASE TABLE");
			res= 1;
			goto end_with_restore_list;
		}

		if (!(res= open_and_lock_tables(thd, lex->query_tables, TRUE, 0)))
		{
			/* The table already exists */
			if (create_table->table)
			{
				if (create_info.options & HA_LEX_CREATE_IF_NOT_EXISTS)
				{
					push_warning_printf(thd, MYSQL_ERROR::WARN_LEVEL_NOTE,
							ER_TABLE_EXISTS_ERROR,
							ER(ER_TABLE_EXISTS_ERROR),
							create_info.alias);
					my_ok(thd);
				}
				else
				{
					my_error(ER_TABLE_EXISTS_ERROR, MYF(0), create_info.alias);
					res= 1;
				}
				goto end_with_restore_list;
			}

			/*
	            Remove target table from main select and name resolution
	            context. This can't be done earlier as it will break view merging in
	            statements like "CREATE TABLE IF NOT EXISTS existing_view SELECT".
			 */
			lex->unlink_first_table(&link_to_local);

			/* So that CREATE TEMPORARY TABLE gets to binlog at commit/rollback */
			if (create_info.options & HA_LEX_CREATE_TMP_TABLE)
				thd->variables.option_bits|= OPTION_KEEP_LOG;

			/*
	            select_create is currently not re-execution friendly and
	            needs to be created for every execution of a PS/SP.
			 */
			if ((result= new select_create(create_table,
					&create_info,
					&alter_info,
					select_lex->item_list,
					lex->duplicates,
					lex->ignore,
					select_tables)))
			{
				/*
	              CREATE from SELECT give its SELECT_LEX for SELECT,
	              and item_list belong to SELECT
				 */
				res= handle_select(thd, lex, result, 0);
				delete result;
			}

			lex->link_first_table_back(create_table, link_to_local);
		}
	}
	else
	{
		/* So that CREATE TEMPORARY TABLE gets to binlog at commit/rollback */
		if (create_info.options & HA_LEX_CREATE_TMP_TABLE)
			thd->variables.option_bits|= OPTION_KEEP_LOG;
		/* regular create */
		if (create_info.options & HA_LEX_CREATE_TABLE_LIKE)
		{
			/* CREATE TABLE ... LIKE ... */
			res= mysql_create_like_table(thd, create_table, select_tables,
					&create_info);
		}
		else
		{
			/* Regular CREATE TABLE */
			res= mysql_create_table(thd, create_table,
					&create_info, &alter_info);
		}
		if (!res)
			my_ok(thd);
	}

#endif
	my_pthread_setspecific_ptr(THR_THD, pthd);
}

void PrintHeaders()
{
	cout<<"id"<<" | ";
	cout<<"select_type"<<" | ";
	cout<<"table"<<" | ";
	cout<<"type"<<" | ";
	cout<<"possible_keys"<<" | ";
	cout<<"key"<<" | ";
	cout<<"key_len"<<" | ";
	cout<<"ref"<<" | ";
	cout<<"rows"<<" | ";
	cout<<"Extra"<<" | ";
	cout<<endl;
}
