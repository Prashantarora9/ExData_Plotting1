
##Plot1 script


#reading the data 

data <- read.table ("household_power_consumption.txt", header = TRUE                   
                    ,sep= ";", colClasses= "character", na.strings= "?", dec= ".")

#subsetting only complete cases
sub1 <- data[complete.cases(data),]

#subsetting data for required days

sub <- subset(sub1,as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-01"|
                as.Date(data$Date, format= "%d/%m/%Y") == "2007-02-02")
               

#plotting the histogram

png(filename = "Plot1.png")

hist(as.numeric(sub$Global_active_power), xlab= "Global Active Power (kilowatts)", ylab= "Frequency",
     col="red", main = "Global Active Power")

dev.off()
