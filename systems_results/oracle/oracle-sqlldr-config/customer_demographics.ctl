load data
infile '/Users/hannes/source/tpcds-kit/sf1/customer_demographics.dat'
into table customer_demographics
fields terminated by "|"
(cd_demo_sk                   ,
    cd_gender                ,
    cd_marital_status        ,
    cd_education_status      ,
    cd_purchase_estimate     ,
    cd_credit_rating         ,
    cd_dep_count             ,
    cd_dep_employed_count    ,
    cd_dep_college_count )