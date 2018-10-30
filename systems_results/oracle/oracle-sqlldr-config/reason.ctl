load data
infile '/Users/hannes/source/tpcds-kit/sf1/reason.dat'
into table reason
fields terminated by "|"
TRAILING NULLCOLS
(    r_reason_sk ,
    r_reason_id  ,
    r_reason_desc)