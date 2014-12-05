library(lubridate)

# First set working directory to the location where
# household_power_consumption.txt was downloaded and unpacked

data <- read.table("household_power_consumption.txt",header=T, sep=";",stringsAsFactors=F, na.strings = "?")
data$Time <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,format="%d/%m/%Y %H:%M:%S")

data <- subset(data,data$Date == "2007-02-01" | data$Date == "2007-02-02")


# Plot
png(file="plot3.png",width=480,height=480)
with(data, plot(Time,Sub_metering_1,type="n", xlab="", ylab="Energy sub metering"))
with(data, lines(Time,Sub_metering_1))
with(data, lines(Time,Sub_metering_2,col="red"))
with(data, lines(Time,Sub_metering_3,col="blue"))
legend("topright", lty=1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()