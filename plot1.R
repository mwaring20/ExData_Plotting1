lines <- grep("^(1|2)/2/2007", readLines("household_power_consumption.txt"), value = TRUE)
header <- readLines("household_power_consumption.txt", n = 1)
col_names <- strsplit(header, ";")[[1]]
data <- read.table(text = lines, sep = ";", header = FALSE, col.names = col_names, na.strings = "?")


png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()


