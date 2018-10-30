-- TPC-DS loading commands for SQLite, 2018-10-24 hannes@cwi.nl

-- schema in ./tools/tpcds.sql (should run as-is)
-- run as follows: sed "s|PWD|/Users/hannes/source/tpcds-kit/data_qualification|" < load.monetdb.sql | mclient                       
-- replace /Users/hannes/source/tpcds-kit/data_qualification with the full path to the TPC-DS data files (.dat)

.mode csv
.separator "|"
.import dbgen_version.dat          dbgen_version 
.import income_band.dat            income_band            
.import warehouse.dat              warehouse              
.import ship_mode.dat              ship_mode              
.import reason.dat                 reason                 
.import call_center.dat            call_center            
.import store.dat                  store                  
.import web_page.dat               web_page               
.import web_site.dat               web_site               
.import promotion.dat              promotion              
.import household_demographics.dat household_demographics 
.import catalog_page.dat           catalog_page           
.import item.dat                   item                   
.import time_dim.dat               time_dim               
.import customer_address.dat       customer_address       
.import web_returns.dat            web_returns            
.import date_dim.dat               date_dim               
.import customer.dat               customer               
.import catalog_returns.dat        catalog_returns        
.import store_returns.dat          store_returns          
.import customer_demographics.dat  customer_demographics  
.import web_sales.dat              web_sales              
.import inventory.dat              inventory              
.import catalog_sales.dat          catalog_sales          
.import store_sales.dat            store_sales            
