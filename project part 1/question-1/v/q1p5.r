# (V) Yearly high for five years

project_data <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")

View(project_data)

first_year_start_date <- pmin(as.Date("01-Jan-11", format="%d-%b-%y"))
first_year_end_date <- pmin(as.Date("31-Dec-11", format="%d-%b-%y"))
second_year_start_date <- pmin(as.Date("01-Jan-12", format="%d-%b-%y"))
second_year_end_date <- pmin(as.Date("31-Dec-12", format="%d-%b-%y"))
third_year_start_date <- pmin(as.Date("01-Jan-13", format="%d-%b-%y"))
third_year_end_date <- pmin(as.Date("31-Dec-13", format="%d-%b-%y"))
fourth_year_start_date <- pmin(as.Date("01-Jan-14", format="%d-%b-%y"))
fourth_year_end_date <- pmin(as.Date("31-Dec-14", format="%d-%b-%y"))
fifth_year_start_date <- pmin(as.Date("01-Jan-15", format="%d-%b-%y"))
fifth_year_end_date <- pmin(as.Date("31-Dec-15", format="%d-%b-%y"))


targeted_year_first <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= first_year_start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= first_year_end_date & project_data$SYMBOL == "ACC")

View(targeted_year_first)

targeted_year_second <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= second_year_start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= second_year_end_date & project_data$SYMBOL == "ACC")

View(targeted_year_second)

targeted_year_third <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= third_year_start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= third_year_end_date & project_data$SYMBOL == "ACC")

View(targeted_year_third)

targeted_year_fourth <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= fourth_year_start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= fourth_year_end_date & project_data$SYMBOL == "ACC")

View(targeted_year_fourth)

targeted_year_fifth <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= fifth_year_start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= fifth_year_end_date & project_data$SYMBOL == "ACC")

View(targeted_year_fifth)

high_vector <- c(max(targeted_year_first$HIGH), max(targeted_year_second$HIGH), max(targeted_year_third$HIGH) , max(targeted_year_fourth$HIGH), max(targeted_year_fifth$HIGH))

year_vector <- c("2011", "2012", "2013", "2014", "2015")

year_df <- data.frame(high_vector, year_vector)

require("ggplot2")

ggplot(data=year_df, aes(x=year_df$year_vector, y=year_df$high_vector, group=1)) + geom_point() + geom_line()
