#!/bin/bash
# this is another ugly hack that makes the TPC-DS queries work with Oracle and produces results compatible with the rest here

export PATH=$PATH:/Users/hannes/Downloads/instantclient_12_2/

i=$1
q=`mktemp`
out1=`mktemp`
out2=`mktemp`

echo "
set heading off
set feedback off
set markup csv on delimiter | quote off

alter session set nls_date_format = 'YYYY-MM-DD';

" > $q
sed -e 's/LIMIT/--LIMIT/' -e 's/SUBSTRING/SUBSTR/g' < $i >> $q
sqlplus -S system/oracle@localhost:49161/xe < $q > $out1
sed -e 's/|/	/g' -e 's/"//' < $out1 | sed -E -e 's/  +//g' > $out2
if grep --quiet "LIMIT" $q; then
	head -n 100 $out2
else
	cat $out2
fi



	
