load data
infile '/Users/hannes/source/tpcds-kit/sf1/catalog_page.dat'
into table catalog_page
fields terminated by "|"
TRAILING NULLCOLS
(  cp_catalog_page_sk      ,
    cp_catalog_page_id     ,
    cp_start_date_sk       ,
    cp_end_date_sk         ,
    cp_department          ,
    cp_catalog_number      ,
    cp_catalog_page_number ,
    cp_description         ,
    cp_type               )