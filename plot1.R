library(lubridate)

# First set working directory to the location where
# household_power_consumption.txt was downloaded and unpacked

data <- read.table("household_power_consumption.txt",header=T, sep=";",stringsAsFactors=F, na.strings = "?")
data$Time <- paste(data$Date, data$Time)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,format="%d/%m/%Y %H:%M:%S")

data <- subset(data,data$Date == "2007-02-01" | data$Date == "2007-02-02")


# Plot
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()  
