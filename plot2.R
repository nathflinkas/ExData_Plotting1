> my_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")
> head(my_data)
        Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
1 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4              0              1             17
2 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0              0              1             16
3 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0              0              2             17
4 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0              0              1             17
5 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8              0              1             17
6 16/12/2006 17:29:00               3.520                 0.522  235.02             15.0              0              2             17
> my_data$Date<-as.Date(my_data$Date,"%d/%m/%Y")
> my_data2 <- subset(my_data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
> dateTime <- paste(my_data2$Date, my_data2$Time)
> dateTime <- setNames(dateTime, "DateTime")
> my_data2 <- my_data2[ ,!(names(my_data2) %in% c("Date","Time"))]
> my_data2 <- cbind(dateTime, my_data2)
> my_data2$dateTime <- as.POSIXct(dateTime)
> png("plot2.png")
> png("plot2.png",width=480,height=480)
> plot(my_data2$Global_active_power~my_data2$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
> dev.off()
