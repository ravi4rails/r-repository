# (V) Yearly turnover for last five years (Line Chart)

project_data <- read.csv('/home/shashi/Downloads/nifty_50_consolidated.csv', header=TRUE, sep=",")

View(project_data)

year_one_start <- pmin(as.Date("01-Jan-11", format="%d-%b-%y"))
year_two_start <- pmin(as.Date("01-Jan-12", format="%d-%b-%y"))
year_three_start <- pmin(as.Date("01-Jan-13", format="%d-%b-%y"))
year_four_start <- pmin(as.Date("01-Jan-14", format="%d-%b-%y"))
year_five_start <- pmin(as.Date("01-Jan-15", format="%d-%b-%y"))

year_one_end <- pmin(as.Date("31-Dec-11", format="%d-%b-%y"))
year_two_end <- pmin(as.Date("31-Dec-12", format="%d-%b-%y"))
year_three_end <- pmin(as.Date("31-Dec-13", format="%d-%b-%y"))
year_four_end <- pmin(as.Date("31-Dec-14", format="%d-%b-%y"))
year_five_end <- pmin(as.Date("31-Dec-15", format="%d-%b-%y"))


targeted_first_year <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= year_one_start & as.Date(project_data$Date, format="%d-%b-%y") <= year_one_end)

targeted_second_year <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= year_two_start & as.Date(project_data$Date, format="%d-%b-%y") <= year_two_end)

targeted_third_year <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= year_three_start & as.Date(project_data$Date, format="%d-%b-%y") <= year_three_end)

targeted_fourth_year <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= year_four_start & as.Date(project_data$Date, format="%d-%b-%y") <= year_four_end)

targeted_fifth_year <- subset(project_data, as.Date(project_data$Date, format="%d-%b-%y") >= year_five_start & as.Date(project_data$Date, format="%d-%b-%y") <= year_five_end)

year_sum_vector <- c(sum(targeted_first_year$Turnover..Rs..Cr.), sum(targeted_second_year$Turnover..Rs..Cr.), sum(targeted_third_year$Turnover..Rs..Cr.), sum(targeted_fourth_year$Turnover..Rs..Cr.), sum(targeted_fifth_year$Turnover..Rs..Cr.))

year_vector <- c(substring(year_one_start,1,4), substring(year_two_start,1,4), substring(year_three_start,1,4), substring(year_four_start,1,4), substring(year_five_start,1,4))

data_frame <- data.frame(year_vector, year_sum_vector)


require('ggplot2')

ggplot(data=data_frame, aes(x=data_frame$year_sum_vector, y=data_frame$year_vector, group=1)) + geom_point() + geom_line()
