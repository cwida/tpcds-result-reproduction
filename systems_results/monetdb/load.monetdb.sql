-- TPC-DS loading commands for MonetDB, 2018-10-23 hannes@cwi.nl

-- schema in ./tools/tpcds.sql (should run as-is)
-- run as follows: sed "s|PWD|/Users/hannes/source/tpcds-kit/data_qualification|" < load.monetdb.sql | mclient                       
-- replace /Users/hannes/source/tpcds-kit/data_qualification with the full path to the TPC-DS data files (.dat)
-- afterwards create foreign keys from ./tools/tpcds_ri.sql (should run as-is)


START TRANSACTION;
COPY INTO dbgen_version          FROM 'PWD/dbgen_version.dat'          USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO income_band            FROM 'PWD/income_band.dat'            USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO warehouse              FROM 'PWD/warehouse.dat'              USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO ship_mode              FROM 'PWD/ship_mode.dat'              USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO reason                 FROM 'PWD/reason.dat'                 USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO call_center            FROM 'PWD/call_center.dat'            USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO store                  FROM 'PWD/store.dat'                  USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO web_page               FROM 'PWD/web_page.dat'               USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO web_site               FROM 'PWD/web_site.dat'               USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO promotion              FROM 'PWD/promotion.dat'              USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO household_demographics FROM 'PWD/household_demographics.dat' USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO catalog_page           FROM 'PWD/catalog_page.dat'           USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO item                   FROM 'PWD/item.dat'                   USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO time_dim               FROM 'PWD/time_dim.dat'               USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO customer_address       FROM 'PWD/customer_address.dat'       USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO web_returns            FROM 'PWD/web_returns.dat'            USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO date_dim               FROM 'PWD/date_dim.dat'               USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO customer               FROM 'PWD/customer.dat'               USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO catalog_returns        FROM 'PWD/catalog_returns.dat'        USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO store_returns          FROM 'PWD/store_returns.dat'          USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO customer_demographics  FROM 'PWD/customer_demographics.dat'  USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO web_sales              FROM 'PWD/web_sales.dat'              USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO inventory              FROM 'PWD/inventory.dat'              USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO catalog_sales          FROM 'PWD/catalog_sales.dat'          USING DELIMITERS '|', '|\n' NULL AS '';
COPY INTO store_sales            FROM 'PWD/store_sales.dat'            USING DELIMITERS '|', '|\n' NULL AS '';
COMMIT;


-- run queries as follows
-- for i in ../../query_qualification/*.sql; do j=`basename $i .sql`; echo $j; mclient -ftab < $i > answer_sets/$j.ans ;  done

