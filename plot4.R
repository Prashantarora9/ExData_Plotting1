
##Plot4 script

#reading the data 

data <- read.table ("household_power_consumption.txt", header = TRUE                   
                    ,sep= ";", colClasses= "character", na.strings= "?", dec= ".")

#subsetting only complete cases
sub1 <- data[complete.cases(data),]

#subsetting data for required days

sub <- subset(sub1,as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-01"|
                as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-02")


png(filename = "Plot4.png")

#setting up plotscreen for 4 plots

par(mfrow = c(2,2))

par(mar= c(4,4,2,2))

#plot1

plot(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_active_power),
     type = "n", xlab = "", ylab="Global Active Power")  

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_active_power),
      col ="black")


axis.POSIXct( strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"), side= 1,  lwd=2 )

axis(side =2, lwd= 2)

#plot2

plot(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Voltage),
     type = "n", xlab = "datetime", ylab="Voltage")  

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Voltage),
      col ="black")


axis.POSIXct( strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"), side= 1,  lwd=2 )

axis(side =2, lwd= 2)

#plot3


plot(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_1),
     type = "n", xlab = "", ylab="Energy sub metering")  

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_1),
      col ="black")


lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_2),
      col ="red")

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_3),
      col ="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),pch = "_", bty = "n",xjust = 0)


axis.POSIXct( strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"), side= 1,  lwd=2 )

axis(side =2, lwd= 2)

#plot4

plot(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_reactive_power),
     type = "n", xlab = "datatime", ylab="Global_reactive_power")  

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_reactive_power),
      col ="black")


axis.POSIXct( strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"), side= 1,  lwd=2 )

axis(side =2, lwd= 2)

dev.off()


