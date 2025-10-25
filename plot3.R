lines <- grep("^(1|2)/2/2007", readLines("household_power_consumption.txt"), value = TRUE)
header <- readLines("household_power_consumption.txt", n = 1)
col_names <- strsplit(header, ";")[[1]]
data <- read.table(text = lines, sep = ";", header = FALSE, col.names = col_names, na.strings = "?")

data$DateTime <- as.POSIXct(
  paste(data$Date, data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = 'Energy sub metering',  xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 1)
dev.off()

