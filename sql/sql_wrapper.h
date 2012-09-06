/*
 * sql_wrapper.h
 *
 *  Created on: 10-Aug-2012
 *      Author: sravang
 */

#ifndef SQL_WRAPPER_H_
#define SQL_WRAPPER_H_

class sql_wrapper {
public:
	sql_wrapper();

	void select_describe( char * query );
	virtual ~sql_wrapper();
};

#endif /* SQL_WRAPPER_H_ */
