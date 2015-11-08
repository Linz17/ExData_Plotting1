## fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## download.file(fileurl, destfile = "hpc.zip", method = "curl")
## unzip("hpc.zip")
hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
dates <- grep("2007-02-01|2007-02-02", hpc$Date)
feb <- hpc[dates,]
x <- paste(as.character(feb$Date), feb$Time)
feb$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")
feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))
plot(feb$Time, feb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
