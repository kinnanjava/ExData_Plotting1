setwd("D:/Study/Coursera/4_Exploratory Data Analysis/Week 1/ExData_Plotting1")

#read csv
householdfull <- read.csv("../household_power_consumption.txt", sep = ";" ,stringsAsFactors = FALSE, na.strings = c("?"))
names(householdfull)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
#subset only "1/2/2007" and "2/2/2007"
household <- subset(householdfull, Date %in% c("1/2/2007","2/2/2007") )
head(household)

#plot graph and save
png("plot1.png", width=480, height=480)
hist(household$Global_active_power, xlab = "Global Active Power (kilowatts)", col= "red", main = "Global Active Power")
dev.off()