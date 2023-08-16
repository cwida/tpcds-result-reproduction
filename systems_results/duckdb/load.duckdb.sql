-- TPC-DS loading commands for DuckDB, 2023-08-16 hannes@duckdblabs.com

-- schema in ./tools/tpcds.sql (should run as-is): duckdb systems_results/duckdb/ds.duckdb < tools/tpcds.sql
-- stupid |\n line endings need fixing: 	for i in *.dat; do sed -i.bak 's/.$//' $i ; done
-- run as follows: sed "s|PWD|/Users/hannes/source/tpcds-result-reproduction/tpcds-sf1-xz|" < systems_results/duckdb/load.duckdb.sql | duckdb systems_results/duckdb/ds.duckdb    
-- replace /Users/hannes/source/tpcds-kit/data_qualification with the full path to the TPC-DS data files (.dat)

 
COPY dbgen_version          FROM 'PWD/dbgen_version.dat'          (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY income_band            FROM 'PWD/income_band.dat'            (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY warehouse              FROM 'PWD/warehouse.dat'              (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY ship_mode              FROM 'PWD/ship_mode.dat'              (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY reason                 FROM 'PWD/reason.dat'                 (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY call_center            FROM 'PWD/call_center.dat'            (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY store                  FROM 'PWD/store.dat'                  (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY web_page               FROM 'PWD/web_page.dat'               (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY web_site               FROM 'PWD/web_site.dat'               (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY promotion              FROM 'PWD/promotion.dat'              (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY household_demographics FROM 'PWD/household_demographics.dat' (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY catalog_page           FROM 'PWD/catalog_page.dat'           (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY item                   FROM 'PWD/item.dat'                   (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY time_dim               FROM 'PWD/time_dim.dat'               (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY customer_address       FROM 'PWD/customer_address.dat'       (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY web_returns            FROM 'PWD/web_returns.dat'            (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY date_dim               FROM 'PWD/date_dim.dat'               (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY customer               FROM 'PWD/customer.dat'               (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY catalog_returns        FROM 'PWD/catalog_returns.dat'        (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY store_returns          FROM 'PWD/store_returns.dat'          (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY customer_demographics  FROM 'PWD/customer_demographics.dat'  (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY web_sales              FROM 'PWD/web_sales.dat'              (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY inventory              FROM 'PWD/inventory.dat'              (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY catalog_sales          FROM 'PWD/catalog_sales.dat'          (FORMAT csv, DELIMITER '|', HEADER false, NULL '');
COPY store_sales            FROM 'PWD/store_sales.dat'            (FORMAT csv, DELIMITER '|', HEADER false, NULL '');




-- run queries as follows for i in ../../query_qualification/*.sql; do j=`basename $i .sql`; echo $j;  psql -p 7483 -h localhost -w --field-separator '	' -A -t -P null=''  < $i > answer_sets/$j.ans ;  done

