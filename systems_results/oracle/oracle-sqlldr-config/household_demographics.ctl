load data
infile '/Users/hannes/source/tpcds-kit/sf1/household_demographics.dat'
into table household_demographics
fields terminated by "|"
TRAILING NULLCOLS
(  hd_demo_sk            ,
    hd_income_band_sk    ,
    hd_buy_potential     ,
    hd_dep_count         ,
    hd_vehicle_count    )