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
#include "sql_wrapper.h"
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

//External functions -->

TABLE_LIST ** make_leaves_list(TABLE_LIST **list, TABLE_LIST *tables); //sql_base.cc


//External functions <--


//Function Declarations -->
void Initialize_SQL_Env(void);
void Create_THD(THD *& pthd );
void Parse_Query( THD * pthd, char * query );
void Create_Data( THD * pthd );
void Create_Data_HardCode( THD * pthd );
int Explain_Query( THD * pthd );
void Display_Result( void );
void Cleanup( void );
void PrintTableInfo(TABLE_LIST * itable );
void mysql_parse_local(THD *thd, char *rawbuf, uint length, Parser_state *parser_state);
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
	cout<<"sql_wrapper::select_describe -->"<<endl;

	//Initialize the neccessary SQL Environment
	Initialize_SQL_Env();


	//Create the Thread Data Descriptor
	THD * pthd = NULL;
	Create_THD( pthd );


	//Parse the Query
	Parse_Query( pthd, query );

	//Create the temporary data(tables and fields)
	//Create_Data( pthd );
	//Create_Data_HardCode( pthd );

#if(1)
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
	int nRes = my_setwd("/var/lib/mysql/",16);

	char * charset_name = MYSQL_DEFAULT_CHARSET_NAME;
	CHARSET_INFO *default_charset_info = &my_charset_latin1;
	default_charset_info= get_charset_by_csname(charset_name,
			MY_CS_PRIMARY,
			MYF(MY_WME));

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


void Create_Data_HardCode( THD * pthd )
{

	THD * thd_create = NULL;
	Create_THD(thd_create);
	char * query_1 = "create table myt1234(id int, id2 int, name varchar(256)) engine=foo;";
	//char * query_1 = "create table myt1234(id int, id2 int, name varchar(256));";
	//char * query_1 = "create table myt12(id int);";
	bool bRes = alloc_query( thd_create, query_1, strlen(query_1));
	Parser_state pState_1;
	pState_1.init(thd_create, query_1, strlen(query_1) );
	mysql_parse(thd_create, thd_create->query(), thd_create->query_length(), &pState_1);

	//close_thread_tables(thd);

	//Create a .frm file for each table

	const char *path = "./sravan/myt1234.frm";
	const char *db = "sravan";
	const char *table_name = "myt1234";

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


	uint keys = 0;

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

}

void Create_Data( THD * ipthd )
{
	SELECT_LEX_UNIT *unit = &(ipthd->lex->unit);
	SELECT_LEX *first = unit->first_select();
	List<Item> &fields = first->item_list;

	TABLE_LIST *tables = ipthd->lex->query_tables;//Returned by the parser
	TABLE_LIST *leaves = NULL;

	make_leaves_list(&leaves, tables);

	TABLE_LIST *table_list = NULL;
	uint tablenr= 0;

	for (table_list= leaves;
			table_list;
			table_list= table_list->next_leaf, tablenr++)
	{
		PrintTableInfo(table_list);
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
  //mysql_reset_thd_for_next_command(thd);

  my_pthread_setspecific_ptr(THR_THD, thd);

  system_charset_info= &my_charset_utf8_general_ci;
  table_alias_charset = &my_charset_utf8_general_ci;

  char * db_name = "sravan";
  thd->set_db(db_name, strlen(db_name));
  bool err= parse_sql(thd, parser_state, NULL);
}

