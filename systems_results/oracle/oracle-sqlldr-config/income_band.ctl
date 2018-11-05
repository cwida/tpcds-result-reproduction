load data
infile '/Users/hannes/source/tpcds-result-reproduction/sf1/income_band.dat'
into table income_band
fields terminated by "|"
TRAILING NULLCOLS
(    ib_income_band_sk,
    ib_lower_bound,
    ib_upper_bound )
