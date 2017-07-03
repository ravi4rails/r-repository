# (II) Shares traded during 07 Feb 2011 to 11 Feb 2011

project_data <- read.csv('/home/shashi/Downloads/nifty_50_consolidated.csv', header=TRUE, sep=",")

View(project_data)

project_date_1 <- pmin(as.Date("07-Feb-11", format="%d-%b-%y"))

project_date_2 <- pmin(as.Date("11-Feb-11", format="%d-%b-%y"))

targeted_dates <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= project_date_1 & as.Date(project_data$Date, format="%d-%b-%y") <= project_date_2)

View(targeted_dates)

require("ggplot2")

ggplot(data=targeted_dates, aes(y=targeted_dates$Date, x=targeted_dates$Shares.Traded, group=1)) + geom_point() + geom_line()