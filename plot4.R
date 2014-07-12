## This assumes the Electric Power Consumption data file is available in your working directory

plot4 <- function() {
        ## Load the file
        file <- "household_power_consumption.txt"
        power <- read.table(file,na.strings="?",sep=";",header=TRUE)
        
        ## Convert the date
        power$DateTime <- strptime(paste(power$Date," ",power$Time),"%d/%m/%Y %X")
        power$Date <- strptime(power$Date,"%d/%m/%Y")
        
        ## Define the date range
        startdate = as.Date("2007-02-01")
        enddate = as.Date("2007-02-02")
        
        ## Subset out the data for the plots
        power.sub <- power[as.Date(power$Date) >= startdate & as.Date(power$Date) <= enddate,]
        
        ## Initialize the file
        png(file = "plot4.png", bg = "transparent")
        
        ## Create the plot
        par(mfrow = c(2,2),bg = "transparent") ## Makes the background transparent
        
        ## Plot 1,1
        plot(power.sub[,10],power.sub[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
        
        ## Plot 1,2
        plot(power.sub[,10],power.sub[,5],type="l",xlab="datetime",ylab="Voltage")
        
        ## Plot 2,1
        with(power.sub,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
        with(power.sub,lines(DateTime,Sub_metering_2,col="red"))
        with(power.sub,lines(DateTime,Sub_metering_3,col="blue"))
        legend("topright",col = c("black","red","blue"),legend = colnames(power.sub[,7:9]),lty = c(1),lwd = c(1),bty = "n")
        
        ## Plot 2,2
        plot(power.sub[,10],power.sub[,4],type="l",xlab="datetime",ylab="Global_reactive_power")
        
        
        ## Close the graphics device
        dev.off()
        print("Plot Complete")
}


