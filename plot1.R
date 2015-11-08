## fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## download.file(fileurl, destfile = "hpc.zip", method = "curl")
## unzip("hpc.zip")
hpc <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
dates <- grep("2007-02-01|2007-02-02", hpc$Date)
feb <- hpc[dates,]
feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))
hist(feb$Global_active_power, col = "orangered", main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width=480,height=480,units="px")
dev.off()
