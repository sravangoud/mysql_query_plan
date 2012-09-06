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

void Populate_HA_CREATE_INFO( HA_CREATE_INFO & icreate_info, handler *file );
void GetHandler( THD * thd, handler ** iophandler );

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

void tee_fprintf(FILE *file, const char *fmt, ...)
{
	va_list args;

	va_start(args, fmt);
	(void) vfprintf(file, fmt, args);
	va_end(args);

	if (false/*opt_outfile*/)
	{
		va_start(args, fmt);
		(void) vfprintf(/*OUTFILE*/file, fmt, args);
		va_end(args);
	}
}


int Create_explain_fields(List<Item> & field_list)
{
	//List<Item> field_list;
	Item *item;
	CHARSET_INFO *cs= system_charset_info;
	field_list.push_back(new Item_return_int("id",3, MYSQL_TYPE_LONGLONG));
	field_list.push_back(new Item_empty_string("select_type", 19, cs));
	field_list.push_back(item= new Item_empty_string("table", NAME_CHAR_LEN, cs));
	item->maybe_null= 1;
	//  if (lex->describe & DESCRIBE_PARTITIONS)
	//  {
	//    /* Maximum length of string that make_used_partitions_str() can produce */
	//    item= new Item_empty_string("partitions", MAX_PARTITIONS * (1 + FN_LEN),
	//                                cs);
	//    field_list.push_back(item);
	//    item->maybe_null= 1;
	//  }
	field_list.push_back(item= new Item_empty_string("type", 10, cs));
	item->maybe_null= 1;
	field_list.push_back(item=new Item_empty_string("possible_keys",
			NAME_CHAR_LEN*MAX_KEY, cs));
	item->maybe_null=1;
	field_list.push_back(item=new Item_empty_string("key", NAME_CHAR_LEN, cs));
	item->maybe_null=1;
	field_list.push_back(item=new Item_empty_string("key_len",
			NAME_CHAR_LEN*MAX_KEY));
	item->maybe_null=1;
	field_list.push_back(item=new Item_empty_string("ref",
			NAME_CHAR_LEN*MAX_REF_PARTS,
			cs));
	item->maybe_null=1;
	field_list.push_back(item= new Item_return_int("rows", 10,
			MYSQL_TYPE_LONGLONG));
	//  if (lex->describe & DESCRIBE_EXTENDED)
	//  {
	//    field_list.push_back(item= new Item_float("filtered", 0.1234, 2, 4));
	//    item->maybe_null=1;
	//  }
	item->maybe_null= 1;
	field_list.push_back(new Item_empty_string("Extra", 255, cs));
	return 0;
}

sql_wrapper::sql_wrapper() {
	// TODO Auto-generated constructor stub

}

sql_wrapper::~sql_wrapper() {
	// TODO Auto-generated destructor stub
}


void sql_wrapper::select_describe( char * query )
{
	cout<<"Enter sql_wrapper::select_describe"<<endl;

	//Create a dummy Thread Descriptor

	char * charset_name = MYSQL_DEFAULT_CHARSET_NAME;
	CHARSET_INFO *default_charset_info = &my_charset_latin1;
	default_charset_info= get_charset_by_csname(charset_name,
			MY_CS_PRIMARY,
			MYF(MY_WME));

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
	const char * arg0 ="/home/sravang/sql_custom_storage/mysql-5.5/sql/mysqld";
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



	THD * pthd = new THD();

	//init_server_components();

	THD thd_temp;
	THD *thd= &thd_temp;

	pthd->thread_stack= (char*) &pthd;
	pthd->store_globals();

	//pthd = current_thd;

	pthd->init_for_queries();

	//my_pthread_setspecific_ptr(THR_THD, pthd);

	THD *thd_1 = current_thd;

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

	THD *thd_2 = current_thd;

	//lex_start(pthd);

	THD *thd_3 = current_thd;

	bool bRes = alloc_query( pthd, query, strlen(query));

	TABLE_LIST *all_tables;
	if( false == bRes )
	{
		THD *thd_4 = current_thd;

		Parser_state pState;//pState = new Parser_state();
		pState.init(pthd, query, strlen(query) );

		SELECT_LEX *sel= pthd->lex->current_select;

		THD *thd_temp= current_thd;

		//mysql_parse(pthd, query, strlen(query), &pState);
		mysql_parse(pthd, pthd->query(), pthd->query_length(), &pState);

		all_tables= pthd->lex->query_tables;

#if(1)
		char * query_1 = "create table myt12(id int) engine=foo;";
		bool bRes = alloc_query( pthd, query_1, strlen(query_1));
		Parser_state pState_1;
		pState_1.init(pthd, query_1, strlen(query_1) );
		mysql_parse(pthd, pthd->query(), pthd->query_length(), &pState_1);

#endif
		//close_thread_tables(thd);

//Create a .frm file for each table
		const char *path = "/var/lib/mysql/sravan/myt12.frm";
		const char *db = "sravan";
		const char *table_name = "myt12";

		//Populate the HA_CREATE_INFO appropriately

		//Create a field list
		List<Create_field> create_fields;
		Create_field f1;
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

		create_fields.push_back(&f1);

		uint keys = 0;

		//What is key_info???
		//
		KEY *key_info;

		//Get the handler...
		handler *file = NULL;
		GetHandler(thd, &file);

		HA_CREATE_INFO create_info;
		Populate_HA_CREATE_INFO(create_info, file);


		pthd->work_part_info = NULL;

		/*
		partition_info * part_info = NULL;
		pthd->work_part_info = part_info= new partition_info();
		if (part_info)
		{
			file->set_auto_partitions(part_info);
			part_info->default_engine_type= create_info.db_type;
			part_info->is_auto_partitioned= TRUE;
		}
		*/
		//Can we populate HA_CREATE_INFO and handler????

		//Create the .frm file corresponding to the table
		mysql_create_frm( pthd,/*Context*/
						  path,/*Path of the .frm file*/
						  db,/*DBName*/
						  table_name,
						  &create_info,/*Table meta data info*/
						  create_fields,/**/
						  keys,/**/
						  key_info,/**/
						  file/**/);

		execute_sqlcom_select(pthd, all_tables);

	}
	else
	{
		cout<<"alloc_query failed....."<<endl;
	}
	//Create the join


	//Plan-2

	//	List<Item> field_list;
	//	Create_explain_fields(field_list);

	//delete pthd;

	//tee_fprintf(stdout, "Hello Word \n");

	cout<<"select_describe succeeded"<<endl;

}

//void sql_wrapper::select_describe( char * query )
//{
//	cout<<"sql_wrapper::select_describe"<<endl;
//
//	//Create a dummy Thread Descriptor
//	//pthread_key_create(&THR_MALLOC,NULL);
//
//	randominit(&sql_rand,(ulong) server_start_time,(ulong) server_start_time/2);
//
//	THD * pthd = new THD();
//
//	//init_server_components();
//
//	THD thd_temp;
//	THD *thd= &thd_temp;
//
//	pthd->thread_stack= (char*) &pthd;
//	pthd->store_globals();
//
//	//pthd = current_thd;
//
//	pthd->init_for_queries();
//
//	//my_pthread_setspecific_ptr(THR_THD, pthd);
//
//	THD *thd_1 = current_thd;
//
//	//pthd->update_charset();
//
//
//	//JOIN Join;
//
//	char * charset_name = MYSQL_DEFAULT_CHARSET_NAME;
//	CHARSET_INFO *default_charset_info = &my_charset_latin1;
//	  default_charset_info= get_charset_by_csname(charset_name,
//						           MY_CS_PRIMARY,
//							   MYF(MY_WME));
//
//	/* Set collactions that depends on the default collation */
//	pthd->variables.collation_server=	 default_charset_info;
//	pthd->variables.collation_database=	 default_charset_info;
//	pthd->variables.collation_connection=  default_charset_info;
//	pthd->variables.character_set_results= default_charset_info;
//	pthd->variables.character_set_client=  default_charset_info;
//	//pthd->variables.character_set_filesystem= get_charset_by_csname( NULL/*character_set_filesystem_name*/,
//	//                              MY_CS_PRIMARY, MYF(MY_WME));
//
//	pthd->lex->sql_command = SQLCOM_END;
//
//	THD *thd_2 = current_thd;
//
//	//lex_start(pthd);
//
//	THD *thd_3 = current_thd;
//
//	bool bRes = alloc_query( pthd, query, strlen(query));
//
//	if( false == bRes )
//	{
//		THD *thd_4 = current_thd;
//
//		Parser_state pState;//pState = new Parser_state();
//		pState.init(pthd, query, strlen(query) );
//
//		SELECT_LEX *sel= pthd->lex->current_select;
//
//		THD *thd_temp= current_thd;
//
//
//
//		//mysql_parse(pthd, query, strlen(query), &pState);
//		mysql_parse(pthd, pthd->query(), pthd->query_length(), &pState);
//	}
//	else
//	{
//		cout<<"alloc_query failed....."<<endl;
//	}
//	//Create the join
//
//
//	//Plan-2
//
//	//	List<Item> field_list;
//	//	Create_explain_fields(field_list);
//
//	//delete pthd;
//
//	//tee_fprintf(stdout, "Hello Word \n");
//
//	cout<<"select_describe succeeded"<<endl;
//
//}
//
//

//What is HA_CREATE_INFO??? table definition info???
//Populate it as much as you can
//how to get the handlerton corresponding to a storage engine????

void Populate_HA_CREATE_INFO( HA_CREATE_INFO & icreate_info, handler *file )
{
	memset(&icreate_info, 0, sizeof(icreate_info));
	icreate_info.alias = "myt12";
	icreate_info.db_type = file->ht;
}

/**
  What is handler?????

  The handler class is the interface for dynamically loadable
  storage engines. Do not add ifdefs and take care when adding or
  changing virtual functions to avoid vtable confusion

  handlerton is a singleton structure - one instance per storage engine -
  to provide access to storage engine functionality that works on the
  "global" level (unlike handler class that works on a per-table basis)
 */

//lex->create_info->db_type;

void GetHandler( THD * thd, handler ** iophandler )
{
	DBUG_ASSERT( (thd != NULL) && (NULL != iophandler) );

	*iophandler = get_new_handler( (TABLE_SHARE*) 0, thd->mem_root, thd->lex->create_info.db_type);
}



