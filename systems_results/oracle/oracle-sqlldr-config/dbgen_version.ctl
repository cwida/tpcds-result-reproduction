load data
infile '/Users/hannes/source/tpcds-kit/sf1/dbgen_version.dat'
into table dbgen_version
fields terminated by "|"
(dv_version, dv_create_date DATE 'YYYY-MM-DD', dv_create_time, dv_cmdline_args)