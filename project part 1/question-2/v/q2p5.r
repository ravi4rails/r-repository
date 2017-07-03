# (V) Top three traded days for SUN TV Network Limited (SUNTV) in terms of traded volumes in the month of december

project_data <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")

View(project_data)

project_date_1 <- pmin(as.Date("01-Dec-13", format="%d-%b-%y"))

project_date_2 <- pmin(as.Date("31-Dec-13", format="%d-%b-%y"))

targeted_dates <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= project_date_1 & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= project_date_2 & project_data$SYMBOL == "SUNTV")

View(targeted_dates)

sorted_suntv_trades <- targeted_dates[rev(order(targeted_dates$TOTALTRADES)),]

sorted_top_three_traded_days <- head(sorted_suntv_trades,3)

require("ggplot2")

ggplot(data=sorted_top_three_traded_days, aes(x=sorted_top_three_traded_days$TOTALTRADES, y=sorted_top_three_traded_days$TIMESTAMP, group=1)) + geom_point() + geom_line()