# 1. Connect to Snowflake using the Snowflake UI
#    create a database with name TPCDS_REP
#    create a warehouse with name XSMALL and size XSMALL
#    (make sure warehouse has auto suspend = 5 minutes to save credits)

# 2. Download the snowsql client from Snowflake Documentation website
#    specify connection settings in ~/.snowsql/config, including:
#      accountname = ...
#      username = ...
#      password = ...
#      dbname = TPCDS_REP
#      schemaname = PUBLIC
#      warehousename = XSMALL
#      rolename = SYSADMIN

# 3. Create tables
snowsql -f tools/tpcds.sql

# 4. Import data for all tables
for tab in call_center catalog_page catalog_returns catalog_sales customer customer_address customer_demographics date_dim dbgen_version household_demographics income_band inventory item promotion reason ship_mode store store_returns store_sales time_dim warehouse web_page web_returns web_sales web_site;
do
    # download to local machine
    wget https://homepages.cwi.nl/~hannes/tpcds-sf1-xz/$tab.dat.xz
    # recompress as bz2 because Snowflake doesn't understand xz
    xz -d $tab.dat.xz
    bzip2 $tab.dat
    # upload dat file to user stage in Snowflake
    snowsql -q "put file://$PWD/$tab.dat.bz2 @~"
    # copy data into table
    snowsql -q "copy into $tab from @~/$tab.dat.bz2 file_format=(type=csv field_delimiter='|' error_on_column_count_mismatch=false)"
done

# 5. Run queries
for i in ../../query_qualification/[0-9]*.sql; do
    j=`basename $i .sql`;
    echo $j;
    snowsql -f $i -o friendly=False -o header=False -o output_format=tsv -o empty_for_null_in_tsv=True -o timing=False > answer_sets/$j.ans;
done
