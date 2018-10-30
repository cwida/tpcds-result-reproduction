#!/bin/bash
# this is another ugly hack that makes the TPC-DS queries work with Oracle and produces results compatible with the rest here

export PATH=$PATH:/Users/hannes/Downloads/instantclient_12_2/

for i in ../../query_qualification/*.sql
do 
j=`basename $i .sql`; 
echo $j

echo "
set heading off
set feedback off
set markup csv on delimiter | quote off

" > q.sql
sed -e 's/LIMIT/--LIMIT/' -e 's/stddev_samp/stdev/g' < $i >> q.sql
sqlplus -S system/oracle@localhost:49161/xe < q.sql > answer_sets/$j.ans
sed -e 's/|/	/g' -e 's/"//' < answer_sets/$j.ans > answer_sets/$j.ans.org
head answer_sets/$j.ans.org
head -n 100 answer_sets/$j.ans.org > answer_sets/$j.ans
done

# FIXME: actually check whether LIMIT is in query
# FIXME: replace more than two whitespaces with nothing in results
