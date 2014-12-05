library(lubridate)

# First set working directory to the location where
# household_power_consumption.txt was downloaded and unpacked

data <- read.table("household_power_consumption.txt",header=T, sep=";",stringsAsFactors=F, na.strings = "?")
data$Time <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,format="%d/%m/%Y %H:%M:%S")

data <- subset(data,data$Date == "2007-02-01" | data$Date == "2007-02-02")


# Plot
with(data, plot(Time,Global_active_power,type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(data, lines(Time,Global_active_power))
dev.copy(png, file = "plot2.png")
dev.off()

