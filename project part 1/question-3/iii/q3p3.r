# (III) Monthly turnover during the year 2015(Pie Chart)

project_data <- read.csv('/home/shashi/Downloads/nifty_50_consolidated.csv', header=TRUE, sep=",")

View(project_data)

month_one <- pmin(as.Date("01-Jan-15", format="%d-%b-%y"))
month_two <- pmin(as.Date("01-Feb-15", format="%d-%b-%y"))
month_three <- pmin(as.Date("01-Mar-15", format="%d-%b-%y"))
month_four <- pmin(as.Date("01-Apr-15", format="%d-%b-%y"))
month_five <- pmin(as.Date("01-May-15", format="%d-%b-%y"))
month_six <- pmin(as.Date("01-Jun-15", format="%d-%b-%y"))
month_seven <- pmin(as.Date("01-Jul-15", format="%d-%b-%y"))
month_eight <- pmin(as.Date("01-Aug-15", format="%d-%b-%y"))
month_nine <- pmin(as.Date("01-Sep-15", format="%d-%b-%y"))
month_ten <- pmin(as.Date("01-Oct-15", format="%d-%b-%y"))
month_eleven <- pmin(as.Date("01-Nov-15", format="%d-%b-%y"))
month_twelve <- pmin(as.Date("01-Dec-15", format="%d-%b-%y"))

targeted_dates_jan <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_one & as.Date(project_data$Date, format="%d-%b-%y") <= month_one + 30)

targeted_dates_feb <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_two & as.Date(project_data$Date, format="%d-%b-%y") <= month_two + 27)

targeted_dates_mar <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_three & as.Date(project_data$Date, format="%d-%b-%y") <= month_three + 30)

targeted_dates_apr <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_four & as.Date(project_data$Date, format="%d-%b-%y") <= month_four + 29)

targeted_dates_may <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_five & as.Date(project_data$Date, format="%d-%b-%y") <= month_five + 30)

targeted_dates_jun <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_six & as.Date(project_data$Date, format="%d-%b-%y") <= month_six + 29)

targeted_dates_jul <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_seven & as.Date(project_data$Date, format="%d-%b-%y") <= month_seven + 30)

targeted_dates_aug <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_eight & as.Date(project_data$Date, format="%d-%b-%y") <= month_eight + 30)

targeted_dates_sep <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_nine & as.Date(project_data$Date, format="%d-%b-%y") <= month_nine + 29)

targeted_dates_oct <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_ten & as.Date(project_data$Date, format="%d-%b-%y") <= month_ten + 30)

targeted_dates_nov <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_eleven & as.Date(project_data$Date, format="%d-%b-%y") <= month_eleven + 29)

targeted_dates_dec <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= month_twelve & as.Date(project_data$Date, format="%d-%b-%y") <= month_twelve + 30)

month_sum_vector <- c(sum(targeted_dates_jan$Turnover..Rs..Cr.), sum(targeted_dates_feb$Turnover..Rs..Cr.), sum(targeted_dates_mar$Turnover..Rs..Cr.), sum(targeted_dates_apr$Turnover..Rs..Cr.), sum(targeted_dates_may$Turnover..Rs..Cr.), sum(targeted_dates_jun$Turnover..Rs..Cr.), sum(targeted_dates_jul$Turnover..Rs..Cr.), sum(targeted_dates_aug$Turnover..Rs..Cr.), sum(targeted_dates_sep$Turnover..Rs..Cr.), sum(targeted_dates_oct$Turnover..Rs..Cr.), sum(targeted_dates_nov$Turnover..Rs..Cr.), sum(targeted_dates_dec$Turnover..Rs..Cr.))

month_vector <- c(month_one, month_two, month_three, month_four, month_five, month_six, month_seven, month_eight, month_nine, month_ten, month_eleven, month_twelve)

data_frame <- data.frame(month_vector, month_sum_vector)


require('ggplot2')

ggplot(data=data_frame, aes(x=data_frame$month_sum_vector, y=data_frame$month_vector, group=1)) + geom_point() + geom_line()
