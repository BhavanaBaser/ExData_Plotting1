## How much memory the datset will require in computer
memory_required <- (2075259*9*8)/10^6

## Read dataset file 
fulldataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## changing the date into standard format
fulldataset$Date <- as.Date(fulldataset$Date, format= "%d/%m/%Y")

## Now to subset the data according to date following function is used 

final_data<- subset(fulldataset, Date == "2007-02-01" | Date == "2007-02-02" )

## Merge Date and Time columns into a third column named "Date_Time"
final_data$Date_Time <- paste(final_data[,1], final_data[,2],sep=" ")

## Convert newly created Date_Time column to POSIXct format
final_data$Date_Time <- as.POSIXct(Date_Time)

## Plotting a line graph
plot(final_data$Global_active_power ~ final_data$Date_Time, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## To copy the line graph in png file and then closing the png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
