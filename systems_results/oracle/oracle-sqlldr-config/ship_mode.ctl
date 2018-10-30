load data
infile '/Users/hannes/source/tpcds-kit/sf1/ship_mode.dat'
into table ship_mode
fields terminated by "|"
TRAILING NULLCOLS
( sm_ship_mode_sk     ,
    sm_ship_mode_id   ,
    sm_type           ,
    sm_code           ,
    sm_carrier        ,
    sm_contract       )