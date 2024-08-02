library(dplyr)
data_set <- data.table::fread('household_power_consumption.txt', na.strings='?')
# set dateTime objects
data_set <- data_set %>% mutate( date_time = as.POSIXct(
  paste(Date, Time), format = '%d/%m/%Y %H:%M:%S'))
data_set <- data_set %>% mutate(Global_active_power = as.numeric(Global_active_power))
#limit data to data from the dates 2007-02-01 and 2007-02-02
data_set <- data_set %>% filter(date_time > '2007-02-01' & date_time < '2007-02-03')
png(filename = 'plot1.png')
hist(data_set$Global_active_power, col='red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')
dev.off()