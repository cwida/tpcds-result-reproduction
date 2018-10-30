#!/bin/bash
# this is an ugly hack that makes the TPC-DS queries work with SQL server and produces results compatible with the rest here

for i in ../../query_qualification/*.sql
do 
j=`basename $i .sql`; 
echo $j
sed -e 's/LIMIT/--LIMIT/' -e 's/stddev_samp/stdev/g' < $i > q.sql
sqlcmd -S localhost -U sa -P GdVf53X5526Q19t -W -h-1 -s"	" -i nocount.sql -i q.sql > answer_sets2/$j.ans
sed 's/NULL//g' < answer_sets/$j.ans > answer_sets/$j.ans.org
head answer_sets/$j.ans.org
head -n 100 answer_sets/$j.ans.org > answer_sets/$j.ans
done


# FIXME: actually check whether LIMIT is in query
# FIXME: replace more than two whitespaces with nothing in results
