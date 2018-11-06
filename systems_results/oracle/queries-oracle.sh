#!/bin/bash
# this is another ugly hack that makes the TPC-DS queries work with Oracle and produces results compatible with the rest here

export PATH=$PATH:/Users/hannes/Downloads/instantclient_12_2/

for i in ../../query_qualification/27.sql
do 
j=`basename $i .sql`; 
echo $j

echo "
set heading off
set feedback off
set markup csv on delimiter | quote off

alter session set nls_date_format = 'YYYY-MM-DD';

" > q.sql
sed -e 's/LIMIT/--LIMIT/' -e 's/SUBSTRING/SUBSTR/g' < $i >> q.sql
sqlplus -S system/oracle@localhost:49161/xe < q.sql > answer_sets/$j.ans
sed -e 's/|/	/g' -e 's/"//' < answer_sets/$j.ans | sed -E -e 's/  +//g' > answer_sets/$j.ans.fix
	if grep --quiet "LIMIT" q.sql; then
		head -n 100 answer_sets/$j.ans.fix > answer_sets/$j.ans
		rm answer_sets/$j.ans.fix
	else
		mv answer_sets/$j.ans.fix answer_sets/$j.ans
	fi

done



	
