## How much memory the datset will require in computer
memory_required <- (2075259*9*8)/10^6

## Read dataset file 
fulldataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## changing the date into standard format
fulldataset$Date <- as.Date(fulldataset$Date, format= "%d/%m/%Y")

## Now to subset the data according to date following function is used 

final_data<- subset(fulldataset, Date == "2007-02-01" | Date == "2007-02-02" )

## To plot the  histogram
hist(final_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency")

## To copy the histogram in png file and then closing the png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()