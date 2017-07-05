# Performance of Reliance Industries Limited (RELIANCE) vs. the Index(NIFTY 50) over the second quarter of financial 2015-16 on the basis of Closing part (Draw Chart)

data_set_one <- read.csv('/home/shashi/Downloads/nifty_50_consolidated.csv', header=TRUE, sep=",")
View(data_set_one)

data_set_two <- read.csv('/home/shashi/Downloads/final_consolidated_data.csv', header=TRUE, sep=",")
View(data_set_two)

fyq_start_date <- pmin(as.Date("01-Jul-15", format="%d-%b-%y"))

fyq_end_date <- pmin(as.Date("30-Sep-15", format="%d-%b-%y"))


second_fyq_month_one <- pmin(as.Date("01-Jul-15", format="%d-%b-%y"))
second_fyq_month_two <- pmin(as.Date("01-Aug-15", format="%d-%b-%y"))
second_fyq_month_three <- pmin(as.Date("01-Sep-15", format="%d-%b-%y"))

targeted_dates_jul <- subset(data_set_one, as.Date(data_set_one$Date, format="%d-%b-%y") >= second_fyq_month_one & as.Date(data_set_one$Date, format="%d-%b-%y") <= second_fyq_month_one + 30)

targeted_dates_aug <- subset(data_set_one, as.Date(data_set_one$Date, format="%d-%b-%y") >= second_fyq_month_two & as.Date(data_set_one$Date, format="%d-%b-%y") <= second_fyq_month_two + 30)

targeted_dates_sep <- subset(data_set_one, as.Date(data_set_one$Date, format="%d-%b-%y") >= second_fyq_month_three & as.Date(data_set_one$Date, format="%d-%b-%y") <= second_fyq_month_three + 29)

targeted_dates_jul_reliance <- subset(data_set_two, as.Date(data_set_two$TIMESTAMP, format="%d-%b-%y") >= second_fyq_month_one & as.Date(data_set_two$TIMESTAMP, format="%d-%b-%y") <= second_fyq_month_one + 30 & data_set_two$SYMBOL=="RELIANCE")

targeted_dates_aug_reliance <- subset(data_set_two, as.Date(data_set_two$TIMESTAMP, format="%d-%b-%y") >= second_fyq_month_two & as.Date(data_set_two$TIMESTAMP, format="%d-%b-%y") <= second_fyq_month_two + 30 & data_set_two$SYMBOL=="RELIANCE")

targeted_dates_sep_reliance <- subset(data_set_two, as.Date(data_set_two$TIMESTAMP, format="%d-%b-%y") >= second_fyq_month_three & as.Date(data_set_two$TIMESTAMP, format="%d-%b-%y") <= second_fyq_month_three + 29 & data_set_two$SYMBOL=="RELIANCE")

close_sum_vector <- c(sum(targeted_dates_jul$Close), sum(targeted_dates_aug$Close), sum(targeted_dates_sep$Close))

month_vector <- c(months(second_fyq_month_one), months(second_fyq_month_two), months(second_fyq_month_three))

close_sum_vector_reliance <- c(sum(targeted_dates_jul_reliance$CLOSE), sum(targeted_dates_aug_reliance$CLOSE), sum(targeted_dates_sep_reliance$CLOSE))

month_vector_reliance <- c(months(second_fyq_month_one), months(second_fyq_month_two), months(second_fyq_month_three))

data_frame_nifty <- data.frame(month_vector, close_sum_vector)
data_frame_reliance <- data.frame(month_vector_reliance, close_sum_vector_reliance)

require('ggplot2')

ggplot(data=data_frame_nifty, aes(x=data_frame_nifty$close_sum_vector, y=data_frame_nifty$month_vector, group=1)) + geom_point() + geom_line()

ggplot(data=data_frame_reliance, aes(x=data_frame_reliance$close_sum_vector_reliance, y=data_frame_reliance$month_vector_reliance, group=1)) + geom_point() + geom_line()

bp <- ggplot(data_frame_nifty, aes(x="", y=close_sum_vector, fill=month_vector)) + geom_bar(width=1, stat="identity")

pie <- bp + coord_polar("y", start=0)

pie <- bp + coord_polar("x", start=0)

bp1 <- ggplot(data_frame_reliance, aes(x="", y=close_sum_vector_reliance, fill=month_vector_reliance)) + geom_bar(width=1, stat="identity")

pie <- bp1 + coord_polar("y", start=0)

pie <- bp1 + coord_polar("x", start=0)


targeted_dates_nifty <- subset(data_set_one, as.Date(data_set_one$Date, format="%d-%b-%y") >= fyq_start_date & as.Date(data_set_one$Date, format="%d-%b-%y") <= fyq_end_date)

targeted_dates_reliance <- subset(data_set_two, as.Date(data_set_one$TIMESTAMP, format="%d-%b-%y") >= fyq_start_date & as.Date(data_set_one$TIMESTAMP, format="%d-%b-%y") <= fyq_end_date)


ggplot(data=data_set_one, aes(x=data_set_one$Close, y=data_set_one$Date, group=1)) + geom_point() + geom_line()

ggplot(data=data_set_two, aes(x=data_set_two$CLOSE, y=data_set_two$TIMESTAMP, group=1)) + geom_point() + geom_line()