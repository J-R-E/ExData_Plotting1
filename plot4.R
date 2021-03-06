setwd("C:/Coursera/ExploratoryDataAnalysis/week1/CourseProject1/Data") ## Sets working directory.

library(dplyr) ## Loads "dplyr" package.

data <- {read.table("household_power_consumption.txt", 
         header = TRUE, sep = ";", na.strings = c("?"))} ## Reads data from file into R and stores it in 
                                                         ## "data" object.

data_change_class <- {mutate(data, Date = as.Date(Date, "%d/%m/%Y"),
                      Time = as.POSIXct(Time, format = c("%H:%M:%S")))} ## Changes "Date" and "Time" 
                                                                        ## columns or variables of "data"
                                                                        ## object from class factor to 
                                                                        ## classes Date and POSIXct,
                                                                        ## respectively. These two 
                                                                        ## variables and the other seven
                                                                        ## variables from the "data" 
                                                                        ## object are stored in 
                                                                        ## "data_change_class" object.

data_change_class_subset <- {filter(data_change_class, 
                             Date == "2007-02-01" | Date == "2007-02-02")} ## Allows records from 
                                                                           ## "data_change_class" object
                                                                           ## that have particular Date
                                                                           ## values to pass through
                                                                           ## filter and then stores 
                                                                           ## these records in 
                                                                           ## "data_change_class_subset"
                                                                           ## object.

png(filename = "plot4.png", width = 480, height = 480, units = "px") ## Opens PNG device; creates 
                                                                     ## "plot4.png" in working directory. 
                                                                    
par(mfrow = c(2, 2)) ## Creates a plot and sends it to a file.

{plot(data_change_class_subset$Global_active_power, xlab = "", 
      ylab = "Global Active Power", type = "n", xaxt = "n")} ## Creates a subplot and sends it to a file.

axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880)) ## Adds x-axis tick marks
                                                                       ## and labels to a subplot.

lines(data_change_class_subset$Global_active_power) ## Adds line to subplot that represents
                                                    ## the global active power data.

{plot(data_change_class_subset$Voltage, xlab = "", 
      ylab = "Voltage", type = "n", xaxt = "n")} ## Creates a subplot and sends it to a file.

axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880)) ## Adds x-axis tick marks 
                                                                       ## and labels to a subplot.

lines(data_change_class_subset$Voltage) ## Adds line to subplot that represents the voltage data.

title(xlab = "datetime") ## Adds an x-axis label to subplot.

{plot(data_change_class_subset$Sub_metering_1,  xlab = "", 
      ylab = "Energy sub metering", type = "n", xaxt = "n")} ## Creates a subplot and sends it to a file.

axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880)) ## Adds x-axis tick marks 
                                                                       ## and labels to a subplot.

lines(data_change_class_subset$Sub_metering_1) ## Adds line to subplot that represents  
                                               ## the sub metering 1 data.

lines(data_change_class_subset$Sub_metering_2, col = "red") ## Adds line to subplot that represents
                                                            ## the sub metering 2 data.

lines(data_change_class_subset$Sub_metering_3, col = "blue") ## Adds line to subplot that represents 
                                                             ## the sub metering 3 data.

{legend("topright", lty = 1, col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        bty = "n", text.font = 1)} ## Adds a legend to subplot.

{plot(data_change_class_subset$Global_reactive_power,  xlab = "", 
      ylab = "Global_reactive_power", type = "n", xaxt = "n")} ## Creates a subplot and 
                                                               ## sends it to a file.

axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880)) ## Adds x-axis tick marks 
                                                                       ## and labels to a subplot.

lines(data_change_class_subset$Global_reactive_power) ## Adds line to subplot that represents 
                                                      ## the global reactive power data.

title(xlab = "datetime") ## Adds an x-axis label to subplot.

dev.off() ## Closes the PNG file device.

