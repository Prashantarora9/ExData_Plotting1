
##Plot2 script

#reading the data 

data <- read.table ("household_power_consumption.txt", header = TRUE                   
                    ,sep= ";", colClasses= "character", na.strings= "?", dec= ".")

#subsetting only complete cases
sub1 <- data[complete.cases(data),]

#subsetting data for required days

sub <- subset(sub1,as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-01"|
                as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-02")

#ploting the empty scatter plot

png(filename = "Plot2.png")

plot(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_active_power),
     type = "n", xlab = "", ylab="Global Active Power (kilowatts)")  

#adding line to scatter plot
#using strptime function to create datetime for y axis

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_active_power))


##Plot2 script

#reading the data 

data <- read.table ("household_power_consumption.txt", header = TRUE                   
                    ,sep= ";", colClasses= "character", na.strings= "?", dec= ".")

#subsetting only complete cases
sub1 <- data[complete.cases(data),]

#subsetting data for required days

sub <- subset(sub1,as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-01"|
                as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-02")

#ploting the empty scatter plot

png(filename = "Plot2.png")

plot(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_active_power),
     type = "n", xlab = "", ylab="Global Active Power (kilowatts)")  

#adding line to scatter plot
#using strptime function to create datetime for y axis

lines(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"),as.numeric(sub$Global_active_power))


axis(side =2, lwd= 2)

dev.off()

     

     