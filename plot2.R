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

png(filename = "plot2.png", width = 480, height = 480, units = "px") ## Opens PNG device; creates 
                                                                     ## "plot2.png" in working directory. 
                                                                    
{plot(data_change_class_subset$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "n", xaxt = "n")} ## Creates a plot and 
                                                                        ## sends it to a file.

axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880)) ## Adds x-axis tick marks 
                                                                       ## and labels to the plot.

lines(data_change_class_subset$Global_active_power) ## Adds line to the plot that represents 
                                                    ## the global active power data.
                                                                           
dev.off() ## Closes the PNG file device.

