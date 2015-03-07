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
final_data$Date_Time <- as.POSIXct(final_data$Date_Time)

## Plotting a line graph and writing a legend
par(mar = c(4,4,2,2), oma = c(0,0,2,0))
with(final_data, {
  
  plot(Sub_metering_1 ~ Date_Time, type="l", ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2 ~ Date_Time, col = 'Red')
  lines(Sub_metering_3 ~ Date_Time, col = 'Blue')
})
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


## To copy the line graph in png file and then closing the png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
