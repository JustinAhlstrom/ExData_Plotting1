## This assumes the Electric Power Consumption data file is available in your working directory

plot1 <- function() {
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
        png(file = "plot1.png", bg = "transparent")
        
        ## Create the plot
        par(bg = "transparent") ## Makes the background transparent
        hist(power.sub[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
        
        ## Close the graphics device
        dev.off()
        print("Plot Complete")
}


