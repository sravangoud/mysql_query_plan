#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include<iostream>
using namespace std;
#include "sql_wrapper.h"
/*
 * sqlw.cpp
 *
 *  Created on: 10-Aug-2012
 *      Author: sravang
 */

//char * query1 = "explain select temp.id from (select books1.title_id as id from books,books1 where books.title_id=books1.title_id) temp;";
//char * query = "explain select books1.title_id as id from books,books1 where books.title_id=books1.title_id;";
//char * query = "create table myt12(id int) engine=foo;";
//char * query = "explain select qgd.id2 from myt1234 where id=1;";

//char * query1 = "explain select t1.a,t2.b from ( select t3.x from t3 )t1, ( select t4.y from t4 ) t2;";
//char * query = "explain select t1.a from t1 where t1.b=5;";

char * query1 = "explain select t1.a, t1.b from t1 where t1.c=5;";

//char * query = " explain SELECT booking_awarded_count.id,"
//       "booking_awarded_count.property_name AS property_name,"
//       "(booking_awarded_count.current / booking_count.current) AS current,"
//       "(booking_awarded_count.historic / booking_count.historic) AS historic "
//		"FROM booking_awarded_count, booking_count;";


char * query = " explain SELECT booking_awarded_count.id,"
       "booking_awarded_count.property_name AS property_name,"
       "(booking_awarded_count.current / booking_count.current) AS current,"
       "(booking_awarded_count.historic / booking_count.historic) AS historic "
  "FROM (SELECT current_table.id,"
               "current_table.name AS property_name,"
               "current_table.value AS current,"
               "historic_table.value AS historic "
          "FROM (SELECT COUNT(DISTINCT b.id) AS value, p.name, p.id "
                  "FROM temp_property p, temp_booking b, temp_upgrade_request ur "
                 "WHERE     b.property_id IN (87,856,694,1056,474,1301,455,1943,20,808,190,426,1888) "
                       "AND b.property_id = p.id "
                       "AND b.id = ur.booking_id "
                       "AND ur.awarded = 'yes' "
                       "AND b.arrival BETWEEN '2012-07-01' AND '2012-07-31' "
                       "AND b.arrival < CURDATE() "
                "GROUP BY b.property_id) current_table,"
               "(SELECT COUNT(DISTINCT b.id) AS value, p.name, p.id "
                  "FROM temp_property p, temp_booking b, temp_upgrade_request ur "
                 "WHERE     b.property_id IN (87,856,694,1056,474,1301,455,1943,20,808,190,426,1888) "
                       "AND b.property_id = p.id "
                       "AND b.id = ur.booking_id "
                       "AND ur.awarded = 'yes'"
                       "AND b.arrival BETWEEN '2012-06-01' AND '2012-06-30'"
                       "AND b.ARRIVAL < CURDATE() "
               "GROUP BY b.property_id) historic_table "
         "WHERE current_table.id = historic_table.id) booking_awarded_count,"
       "(SELECT current_table.id,"
               "current_table.name AS property_name,"
               "current_table.value AS current,"
               "historic_table.value AS historic "
          "FROM (SELECT COUNT(DISTINCT b.id) AS value, p.name, p.id "
                  "FROM temp_booking b, temp_property p, temp_upgrade_request ur "
                 "WHERE     b.property_id IN (87,856,694,1056,474,1301,455,1943,20,808,190,426,1888) "
                       "AND b.property_id = p.id "
                       "AND b.id = ur.booking_id "
                       "AND b.arrival BETWEEN '2012-07-01' AND '2012-07-31' "
                       "AND b.arrival < CURDATE() "
                "GROUP BY b.property_id) current_table,"
               "(SELECT COUNT(DISTINCT b.id) AS value, p.name, p.id "
                  "FROM temp_booking b, temp_property p, temp_upgrade_request ur "
                 "WHERE     b.property_id IN (87,856,694,1056,474,1301,455,1943,20,808,190,426,1888) "
                       "AND b.property_id = p.id "
                       "AND b.id = ur.booking_id "
                       "AND b.arrival BETWEEN '2012-06-01' AND '2012-06-30' "
                       "AND b.ARRIVAL < CURDATE() "
                "GROUP BY b.property_id) historic_table "
         "WHERE current_table.id = historic_table.id) booking_count "
 "WHERE booking_awarded_count.id = booking_count.id ;";
//
//int main(void)
//{
//	sql_wrapper sql;
//	//char * query = "explain select f1 from T1,T2 where T1.f2=T2.f2;";
//	//char * query = "explain select books.title_id from books, books1 where books.title_id=books1.title_id;";
//
//	//char * query = "explain select id,name from t_foo;";
//	sql.select_describe(query);
//	cout<<"Test...."<<endl;
//	return 0;
//}

//============================================================================
// Name        : REPL.cpp
// Author      :
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================


int main() {

  const int command_fd = 0;//stdin
  const int response_fd = 1;//stdout

  FILE* command_pipe = fdopen(command_fd, "rb");
  if (!command_pipe) {
    perror("fdopen(command_fd)");
    return 1;
  }
  setlinebuf(command_pipe);

  FILE* response_pipe = fdopen(response_fd, "wb");
  if (!response_pipe) {
    perror("fdopen(response_fd)");
    return 1;
  }
  setlinebuf(response_pipe);

  cout<<"sqlw > ";

  char buf[102400];
  char strquit[] = "quit\n";
  while (fgets(buf, sizeof(buf), command_pipe))
  {
	  if(strcmp(buf,strquit) == 0)
	  {
		  //DBUG_PRINT("quit", ("Closing mysqlw") );
		  cout<<"quit, Closing mysqlw"<<endl;
		  break;
	  }
	  else
	  {
		  sql_wrapper sql;
		  sql.select_describe(buf);

		  cout<<endl<<"sqlw > ";
		  //print the input
//		  if (fputs(buf, response_pipe) < 0) {
//			  perror("CHILD> fputs");
//			  break;
//		  }
	  }
	  fflush(response_pipe);
  }

  fclose(command_pipe);
  fclose(response_pipe);

  return 0;
};


/*
 * Known Bugs:
 *
 * id is not displayed correctly for the tables.
 */



/*
 * Not able to write to the .frm( form file)...
 *  Is it a constraint???? or insufficient data????
 *
 *
 * Why do we need to create .frm file????
 * Can't we manage it inside handler implementation(custom storage engine)????
 *		-	no...some piece of the native handler code looks for .frm file
 *		before passing the handle to custom handler.
 *
 *
 *
 * From the result of the parser...
 * 1) Get the Table names.
 * 2) Field names, type...etc
 *
 * How the parse information is consumed by the Query Optimizer???
 *
 *
 *
 *
 *
 * What is join_tab->next_select???
 *
 *
 * For tomorrow :
 * Debug how value of "thd->security_ctx->master_access" is modified????
 *
 *
 *
 * 11th Sep
 *
 * mysql_execute_command is not called
 *
 * Probably we should analyse the above method to see if it does anything specific to derived tables...
 *
 * It internally calls the same method execute_sqlcom_select()
 *
 *
 * 12th Sep
 *
 * Objective : Create table with constraints( primary key, unique...etc)
 *
 *
 * 17th Sep:
 * Issue: Unable to create a table with constraints using FOO( it is working fine with other SE's)
 *
 * 		RCA : unable to grant for the table( grant_table is NULL: table_hash_search function call at Line:4587 )
 *
 *
 * Methods to look-for
 * acl_init() in sql_acl.cpp
 *
 * acl initialization is failing because of failing to initialize
 * "native pwd plugin" and "old pwd plugin"
 *
 * why plugin initialization is failing???
 *
 *
 *
 *
 *
 *
 *
 */





