# (IV)Mean opening price for year 2014

project_data <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")

View(project_data)

start_date <- pmin(as.Date("01-Jan-14", format="%d-%b-%y"))

end_date <- pmin(as.Date("31-Dec-14", format="%d-%b-%y"))

targeted_dates <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= end_date & project_data$SYMBOL == "ACC")

year <- c("2014")

year_opening_mean <- mean(targeted_dates$OPEN)

data_frame <- data.frame(year, year_opening_mean)

require('ggplot2')

ggplot(data=data_frame, aes(x=data_frame$year, y=data_frame$year_opening_mean, group=1)) + geom_point() + geom_line()