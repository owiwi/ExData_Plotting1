library(datasets)

#get data file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- subset(transform(as.data.frame.matrix(read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";")), DateVal = as.Date(Date, "%d/%m/%Y")), DateVal >= as.Date("2007-02-01") & DateVal <= as.Date("2007-02-02"))
unlink(temp)

#set graphics
png(file = "Plot1.png",width=480,height=480,units="px")

################################################
#Plot 1
data <- transform(data, Global_Active_PwdVal = as.numeric(Global_active_power))
hist(data$Global_Active_PwdVal, xlab = "Global Active Power (kilowatts)", col = "red", main="Global Active Power")
################################################


dev.off()
