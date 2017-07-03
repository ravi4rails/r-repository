# (I) Trend of Nifty 50 in terms of turnover during the year 2014

project_data <- read.csv('/home/shashi/Downloads/nifty_50_consolidated.csv', header=TRUE, sep=",")

View(project_data)

project_date_1 <- pmin(as.Date("01-Jan-14", format="%d-%b-%y"))

project_date_2 <- pmin(as.Date("31-Dec-14", format="%d-%b-%y"))

targeted_dates <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= project_date_1 & as.Date(project_data$Date, format="%d-%b-%y") <= project_date_2)

View(targeted_dates)

require("ggplot2")

ggplot(data=targeted_dates, aes(y=targeted_dates$Date, x=targeted_dates$Turnover..Rs..Cr., group=1)) + geom_point() + geom_line()