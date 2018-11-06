#!/bin/bash
# this is an ugly hack that makes the TPC-DS queries work with SQL server and produces results compatible with the rest here
i=$1
j=`basename $i .sql`; 
echo $j
sed -e 's/LIMIT/--LIMIT/' -e 's/stddev_samp/stdev/g' < $i > q.sql
sqlcmd -S localhost -U sa -P GdVf53X5526Q19t -W -h-1 -s"	" -i nocount.sql -i q.sql > answer_sets/$j.ans
	sed -E -e 's/  +//g' -e 's/NULL//g' < answer_sets/$j.ans > answer_sets/$j.ans.fix
	if grep --quiet "LIMIT" q.sql; then
		head -n 100 answer_sets/$j.ans.fix > answer_sets/$j.ans
		rm answer_sets/$j.ans.fix
	else
		mv answer_sets/$j.ans.fix answer_sets/$j.ans
	fi
rm q.sql
