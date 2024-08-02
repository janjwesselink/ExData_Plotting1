library(dplyr)
data_set <- data.table::fread('household_power_consumption.txt', na.strings='?')
#get datetime objects
data_set <- data_set %>% mutate( date_time = as.POSIXct(paste(data_set$Date, data_set$Time),
                                                        format = '%d/%m/%Y %H:%M:%S'))
# set Global_active_power to numeric
data_set <- data_set %>% mutate(Global_active_power = as.numeric(Global_active_power))
# select dates
data_set <- data_set %>% filter(date_time > '2007-02-01' & date_time < '2007-02-03')
png('plot4.png')
#set grafical layout and margins
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1))
# first plot
with(data_set, plot(date_time, Global_active_power, , type='l', xlab='',
                    ylab='Global Active Power (kilowatts)'))
#second plot
with(data_set, plot(date_time, Voltage, type='l', xlab = 'datetime'))
# third plot
with(data_set, plot(date_time, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(data_set, lines(date_time, Sub_metering_2, col = 'red'))
with(data_set, lines(date_time, Sub_metering_3, col = 'blue'))
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'),
       lty = c(1,1,1), bty = 'n')
# fourth plot
with(data_set, plot(date_time, Global_reactive_power, type = 'l', xlab = 'datetime'))
dev.off()