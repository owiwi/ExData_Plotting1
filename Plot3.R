library(datasets)

#get data file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- subset(transform(as.data.frame.matrix(read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";")), DateVal = as.Date(Date, "%d/%m/%Y")), DateVal >= as.Date("2007-02-01") & DateVal <= as.Date("2007-02-02"))
unlink(temp)

#set graphics
png(file = "Plot3.png",width=480,height=480,units="px")

################################################
#Plot 3
options(digits=9)
data <- transform(data, DateTime = as.POSIXlt(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"), Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))
x<-data$DateTime
y<-data$Sub_metering_1
plot(x, y, type="n", main="", xlab = "", ylab = "Energy sub metering") 
lines(x, y, type="l") 
lines(x, data$Sub_metering_2, type="l", col = "red") 
lines(x, data$Sub_metering_3, type="l", col = "blue") 

legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
################################################


dev.off()
