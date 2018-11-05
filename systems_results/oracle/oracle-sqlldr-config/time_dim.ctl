load data
infile '/Users/hannes/source/tpcds-result-reproduction/sf1/time_dim.dat'
into table time_dim
fields terminated by "|"
TRAILING NULLCOLS
(  t_time_sk    ,
    t_time_id   ,
    t_time      ,
    t_hour      ,
    t_minute    ,
    t_second    ,
    t_am_pm     ,
    t_shift     ,
    t_sub_shift ,
    t_meal_time)
