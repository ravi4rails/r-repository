# Performance of Pratibha Industries Limited (PRATIBHA) vs. the Taxtile Industries over the month of July 2013 on the basis of Closing part (Draw Chart)

data_set <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")
View(data_set)

start_date <- pmin(as.Date("01-Jul-15", format="%d-%b-%y"))
end_date <- pmin(as.Date("31-Jul-15", format="%d-%b-%y"))

targeted_dates_pratibha <- subset(data_set, as.Date(data_set$TIMESTAMP, format="%d-%b-%y") >= start_date & as.Date(data_set$TIMESTAMP, format="%d-%b-%y") <= end_date & data_set$SYMBOL == "PRATIBHA")
View(targeted_dates_pratibha)

targeted_dates_textile_industries <- subset(data_set, as.Date(data_set$TIMESTAMP, format="%d-%b-%y") >= start_date & as.Date(data_set$TIMESTAMP, format="%d-%b-%y") <= end_date & data_set$INDUSTRY == "Textiles" & data_set$SYMBOL != "PRATIBHA")
View(targeted_dates_textile_industries)


industries <- c(unique(as.character(targeted_dates_textile_industries$SYMBOL)))
industries <- dput(as.character(industries))

targeted_industries <- 0
closing_sum_values <- 0

for(i in 1:length(industries)) {
  targeted_industries[i] <- industries[i]
  targeted_industries_loop <- subset(targeted_dates_textile_industries, targeted_dates_textile_industries$SYMBOL == targeted_industries[i])
  closing_sum_values[i] <- sum(targeted_industries_loop$CLOSE)
}

data_frame_textiles_industries <- data.frame(targeted_industries, closing_sum_values)

symbol_name <- unique(targeted_dates_pratibha$INDUSTRY)
sum_value <- sum(targeted_dates_pratibha$CLOSE)

data_frame_partibha_industry <- data.frame(symbol_name, sum_value)

hist(data_frame_textiles_industries, xlab=data_frame_textiles_industries$closing_sum_values)

require("ggplot2")

ggplot(data=data_frame_partibha_industry, aes(x=data_frame_partibha_industry$symbol_name, y=data_frame_partibha_industry$sum_value, group=1)) + geom_point() + geom_line()

ggplot(data=data_frame_textiles_industries, aes(x=data_frame_textiles_industries$targeted_industries, y=data_frame_textiles_industries$closing_sum_values, group=1)) + geom_point() + geom_line()

ggplot(data=data_frame_textiles_industries, aes(x=data_frame_textiles_industries$targeted_industries, y=data_frame_textiles_industries$closing_sum_values)) + geom_bar()