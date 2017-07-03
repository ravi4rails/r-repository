# (II) Daily closing price for Third Quarter of year 2014

project_data <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")

View(project_data)


project_date_1 <- pmin(as.Date("01-Jul-14", format="%d-%b-%y"))

project_date_2 <- pmin(as.Date("30-Sep-14", format="%d-%b-%y"))


targeted_dates <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= project_date_1 & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= project_date_2 & project_data$SYMBOL == "ACC")

View(targeted_dates)

require('ggplot2')

ggplot(data=targeted_dates, aes(x=targeted_dates$OPEN, y=targeted_dates$TIMESTAMP, group=1)) + geom_line()

ggplot(data=targeted_dates, aes(x=targeted_dates$CLOSE, y=targeted_dates$TIMESTAMP, group=1)) + geom_point() + geom_line()

ggplot(data=targeted_dates, aes(x=targeted_dates$CLOSE, y=as.Date(project_data$TIMESTAMP, format="%d-%b-%y"), group=1)) + geom_point() + geom_line()