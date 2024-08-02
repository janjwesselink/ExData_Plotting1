library(dplyr)
data_set <- data.table::fread('household_power_consumption.txt', na.strings='?')
#get datetime objects
data_set <- data_set %>% mutate( date_time = as.POSIXct(paste(data_set$Date, data_set$Time),
                                                        format = '%d/%m/%Y %H:%M:%S'))
# set Global_active_power to numeric
data_set <- data_set %>% mutate(Global_active_power = as.numeric(Global_active_power))
# select dates
data_set <- data_set %>% filter(date_time > '2007-02-01' & date_time < '2007-02-03')
png('plot2.png')
with(data_set, plot(date_time, Global_active_power, , type='l', xlab='', ylab='Global Active Power (kilowatts)'))
dev.off()