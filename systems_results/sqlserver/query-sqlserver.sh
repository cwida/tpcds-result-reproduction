#!/bin/bash
# this is an ugly hack that makes the TPC-DS queries work with SQL server and produces results compatible with the rest here
i=$1
q=`mktemp`
out1=`mktemp`
out2=`mktemp`
echo "SET NOCOUNT ON;" > $q
sed -e 's/LIMIT/--LIMIT/' -e 's/stddev_samp/stdev/g' < $i >> $q
sqlcmd -S localhost -U sa -P GdVf53X5526Q19t -W -h-1 -s"	" -i $q > $out1
sed -E -e 's/  +//g' -e 's/NULL//g' < $out1 > $out2
if grep --quiet "LIMIT" $q; then
	head -n 100 $out2
else
	cat $out2
fi
