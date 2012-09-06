/*
 * sqlw.cpp
 *
 *  Created on: 10-Aug-2012
 *      Author: sravang
 */

char * query = "explain select id from myt12;";

//char * query = " explain SELECT booking_awarded_count.id,"
//       "booking_awarded_count.property_name AS property_name,"
//       "(booking_awarded_count.current / booking_count.current) AS current,"
//       "(booking_awarded_count.historic / booking_count.historic) AS historic "
//		"FROM booking_awarded_count, booking_count;";

/*
char * query = " explain SELECT booking_awarded_count.id,"
       "booking_awarded_count.property_name AS property_name,"
       "(booking_awarded_count.current / booking_count.current) AS current,"
       "(booking_awarded_count.historic / booking_count.historic) AS historic "
  "FROM (SELECT current_table.id,"
               "current_table.name AS property_name,"
               "current_table.value AS current,"
               "historic_table.value AS historic "
          "FROM (SELECT COUNT(DISTINCT b.id) AS value, p.name, p.id "
                  "FROM x_property p, x_booking b, x_upgrade_request ur "
                 "WHERE     b.property_id IN (87,856,694,1056,474,1301,455,1943,20,808,190,426,1888) "
                       "AND b.property_id = p.id "
                       "AND b.id = ur.booking_id "
                       "AND ur.awarded = 'yes' "
                       "AND b.arrival BETWEEN '2012-07-01' AND '2012-07-31' "
                       "AND b.arrival < CURDATE() "
                "GROUP BY b.property_id) current_table,"
               "(SELECT COUNT(DISTINCT b.id) AS value, p.name, p.id "
                  "FROM x_property p, x_booking b, x_upgrade_request ur "
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
                  "FROM x_booking b, x_property p, x_upgrade_request ur "
                 "WHERE     b.property_id IN (87,856,694,1056,474,1301,455,1943,20,808,190,426,1888) "
                       "AND b.property_id = p.id "
                       "AND b.id = ur.booking_id "
                       "AND b.arrival BETWEEN '2012-07-01' AND '2012-07-31' "
                       "AND b.arrival < CURDATE() "
                "GROUP BY b.property_id) current_table,"
               "(SELECT COUNT(DISTINCT b.id) AS value, p.name, p.id "
                  "FROM x_booking b, x_property p, x_upgrade_request ur "
                 "WHERE     b.property_id IN (87,856,694,1056,474,1301,455,1943,20,808,190,426,1888) "
                       "AND b.property_id = p.id "
                       "AND b.id = ur.booking_id "
                       "AND b.arrival BETWEEN '2012-06-01' AND '2012-06-30' "
                       "AND b.ARRIVAL < CURDATE() "
                "GROUP BY b.property_id) historic_table "
         "WHERE current_table.id = historic_table.id) booking_count "
 "WHERE booking_awarded_count.id = booking_count.id ;";
*/

#include<iostream>
using namespace std;
#include "sql_wrapper.h"
int main(void)
{
	sql_wrapper sql;
	//char * query = "explain select f1 from T1,T2 where T1.f2=T2.f2;";
	//char * query = "explain select books.title_id from books, books1 where books.title_id=books1.title_id;";

	//char * query = "explain select id,name from t_foo;";
	sql.select_describe(query);
	cout<<"Test...."<<endl;
	return 0;
}





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
 */




