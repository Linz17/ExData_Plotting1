## fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## download.file(fileurl, destfile = "hpc.zip", method = "curl")
## unzip("hpc.zip")
hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
dates <- grep("2007-02-01|2007-02-02", hpc$Date)
feb <- hpc[dates,]
x <- paste(as.character(feb$Date), feb$Time)
feb$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
feb$Sub_metering_1 <- as.numeric(as.character(feb$Sub_metering_1))
feb$Sub_metering_2 <- as.numeric(as.character(feb$Sub_metering_2))

png(file = "plot3.png", width=480,height=480,units="px")

plot(feb$Time, feb$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(feb$Time, feb$Sub_metering_1, type = "l", col = "black")
lines(feb$Time, feb$Sub_metering_2, type = "l", col = "red")
lines(feb$Time, feb$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), 
    lwd=c(2.5,2.5), col=c("black", "red", "blue"))

dev.off()
