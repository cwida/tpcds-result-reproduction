load data
infile '/Users/hannes/source/tpcds-result-reproduction/sf1/inventory.dat'
into table inventory
fields terminated by "|"
TRAILING NULLCOLS
(   inv_date_sk          ,
    inv_item_sk          ,
    inv_warehouse_sk     ,
    inv_quantity_on_hand)
