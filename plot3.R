
##Plot3 script

#reading the data 

data <- read.table ("household_power_consumption.txt", header = TRUE                   
                    ,sep= ";", colClasses= "character", na.strings= "?", dec= ".")

#subsetting only complete cases
sub1 <- data[complete.cases(data),]

#subsetting data for required days

sub <- subset(sub1,as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-01"|
                as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-02")

#ploting the empty scatter plot

png(filename = "Plot3.png")


plot(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_1),
     type = "n", xlab = "", ylab="Energy sub metering")  

#adding the line for sub$Sub_metering_1

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_1),
      col ="black")

#adding the line for sub$Sub_metering_2

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_2),
      col ="red")

#adding the line for sub$Sub_metering_3

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Sub_metering_3),
      col ="blue")

#adding the legend

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),pch = "_")

axis(lwd= 2)

dev.off()