# (I) Top three traded scrip(Symbol) iin terms of Traded Volume in the month of November 2015

project_data <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")

View(project_data)

start_date <- pmin(as.Date("01-Nov-15", format="%d-%b-%y"))

targeted_dates <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= start_date + 29)

View(targeted_dates)

# symbols <- data.frame(unique(targeted_dates$SYMBOL))

symbols <- c(unique(as.character(targeted_dates$SYMBOL)))

# paste(shQuote(symbols), collapse=", ")

# targeted_symbols <- subset(targeted_dates, targeted_dates$SYMBOL == "ACC")

targeted_symbols <- 0
max_trade <- 0

symbols <- dput(as.character(symbols))

for(i in 1:length(symbols)) {
  targeted_symbols[i] <- symbols[i]
  targeted_symbols_loop <- subset(targeted_dates, targeted_dates$SYMBOL == targeted_symbols[i])
  max_trade[i] <-  max(targeted_symbols_loop$TOTALTRADES)
}

# for(i in 1:length(symbols)) {
#   targeted_symbols[i] <- symbols[i]
#   targeted_symbols_loop <- subset(project_data, as.Date(project_data$TIMESTAMP, format="%d-%b-%y") >= start_date & as.Date(project_data$TIMESTAMP, format="%d-%b-%y") <= start_date + 29 & project_data$SYMBOL == targeted_symbols[i])
#   max_trade[i] <-  max(targeted_symbols_loop$TOTALTRADES)
# }

data_frame <- data.frame(targeted_symbols, max_trade)

sorted_frame <- data_frame[rev(order(data_frame$max_trade)),]

sorted_top_three <- head(sorted_frame,3)

require("ggplot2")

ggplot(data=sorted_top_three, aes(x=sorted_top_three$targeted_symbols, y=sorted_top_three$max_trade, group=1)) + geom_point() + geom_line()

