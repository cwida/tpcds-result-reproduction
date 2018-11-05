load data
infile '/Users/hannes/source/tpcds-result-reproduction/sf1/web_page.dat'
into table web_page
fields terminated by "|"
TRAILING NULLCOLS
(  wp_web_page_sk         ,
    wp_web_page_id        ,
    wp_rec_start_date   DATE 'YYYY-MM-DD'  ,
    wp_rec_end_date     DATE 'YYYY-MM-DD'  ,
    wp_creation_date_sk   ,
    wp_access_date_sk     ,
    wp_autogen_flag       ,
    wp_customer_sk        ,
    wp_url                ,
    wp_type               ,
    wp_char_count         ,
    wp_link_count         ,
    wp_image_count        ,
    wp_max_ad_count    )
