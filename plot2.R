lines <- grep("^(1|2)/2/2007", readLines("household_power_consumption.txt"), value = TRUE)
header <- readLines("household_power_consumption.txt", n = 1)
col_names <- strsplit(header, ";")[[1]]
data <- read.table(text = lines, sep = ";", header = FALSE, col.names = col_names, na.strings = "?")

data$DateTime <- as.POSIXct(
  paste(data$Date, data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = 'Global Active Power (kilowatts)',  xaxt = "n")
ticks <- as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03"))
axis(1, at = ticks, labels = c("Thu", "Fri", "Sat"))
dev.off()

