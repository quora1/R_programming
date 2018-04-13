##pollutantmean.R.
##week2_part1

##Task
##Write a function named 'pollutantmean' that calculates the mean of a pollutant 
##(sulfate or nitrate) across a specified list of monitors. Function returns 
##the mean of the pollutant for the chosen monitors (ID) ignoring missing values.
####################################################################

pollutantmean <- function(directory, pollutant, id=1:332)  {

			##setup 
setwd("C:/Users/gvaurantowka/Desktop/DataScience/R_programming/R_wd") 
files_list <- list.files("specdata", full.names=TRUE)
nc<-length(files_list)

			##compiling csv files into one dataset
data<-data.frame()
	for (i in 1:nc) {
	data <-rbind(data,read.csv(files_list[i]))
	}

			##creating data subset with the obs of required ID 
subset <- data[data$ID >= min(id) & data$ID <= max(id), ]
			
			##computing the mean of this subset
mean(subset[,pollutant], na.rm=TRUE)
}


##check
##pollutantmean("specdata", "sulfate", 1)
##pollutantmean("specdata", "sulfate", 1:10)
##pollutantmean("specdata", "nitrate", 70:72)
##pollutantmean("specdata","nitrate",23:23)

