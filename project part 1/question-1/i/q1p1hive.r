# (I) Daily closing price for 01/Feb/2014 to 28/Feb/2014

rhive.query("create table share_market (ISIN string, SYMBOL string, COMPANY_NAME string, INDUSTRY string, SERIES string, OPEN double, HIGH double, LOW double, CLOSE double, LAST double, PREVCLOSE double, TOTTRDQTY double, TOTTRDVAL double, TIME_STAMP date, TOTALTRADES int)row format delimited fields terminated by ',' lines terminited by '\n' stored as textfile")

rhive.query("load data local inpath '/home/shashi/Downloads/final_consolidated_data.csv' into table share_market")

rhive.query("select count(*) from share_market")

rhive.query("SELECT * FROM share_market WHERE TIME_STAMP >= '01-Feb-14' AND TIME_STAMP <= '28-Feb-14'")