# (III) Trend of bharti airtel limited in terms of traded volumes over the last quarter of year 2013

project_data <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")

View(project_data)

last_quarter_start_month <- pmin(as.Date("01-Oct-13", format="%d-%b-%y"))

last_quarter_end_month <- pmin(as.Date("31-Dec-13", format="%d-%b-%y"))

targeted_dates <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= last_quarter_start_month & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= last_quarter_end_month & project_data$SYMBOL == "BHARTIARTL")

View(targeted_dates)

require("ggplot2")

ggplot(data=targeted_dates, aes(x=targeted_dates$TOTALTRADES, y=as.Date(targeted_dates$TIMESTAMP, format="%d-%b-%y"), group=1)) + geom_point() + geom_line()