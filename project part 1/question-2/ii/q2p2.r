# (II) Highest traded industry in terms of traded amount in the month of July 2014.

project_data <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")

View(project_data)

start_date <- pmin(as.Date("01-Jul-14", format="%d-%b-%y"))

targeted_dates <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= start_date + 30)

industries <- c(unique(as.character(targeted_dates$INDUSTRY)))

industries <- dput(as.character(industries))

targeted_industries <- 0
max_traded_values <- 0

for(i in 1:length(industries)) {
  targeted_industries[i] <- industries[i]
  targeted_industries_loop <- subset(targeted_dates, targeted_dates$INDUSTRY == targeted_industries[i])
  max_traded_values[i] <-  max(targeted_industries_loop$TOTTRDVAL)
}

data_frame_industry <- data.frame(targeted_industries, max_traded_values)

sorted_industry_frame <- data_frame_industry[rev(order(data_frame_industry$max_traded_values)),]

sorted_top_three_industries <- head(sorted_industry_frame,3)

require("ggplot2")

ggplot(data=sorted_top_three_industries, aes(x=sorted_top_three_industries$targeted_industries, y=sorted_top_three_industries$max_traded_values, group=1)) + geom_point() + geom_line()
