## week2 - part2 "complete" function

## Task:
##Write a function that reads a directory full of files and reports the number of completely observed 
##cases in each data file. The function should return a data frame where the first column is 
##the name of the file and the second column is the number of complete cases.
#######################################################################



  

complete <- function(directory, id=1:332 ){

		##compile CSV files in one big dataset
files_list <- list.files(directory, full.names=TRUE)
  data<-data.frame()
  for (i in 1:length(files_list)) {
    data <-rbind(data,read.csv(files_list[i]))
  }

		## create empty matrix placeholder for final output
  matrix <- data.frame(matrix(nrow = length(id), ncol =2))
  colnames(matrix) <- c("id", "nobs")  

		##fill the matrix(index=j) with elements from dataset
  for(j in 1:length(id)){
 		##fill the first column with id from dataset corresponding to j
    matrix[j,1] <- id[j]
		##fill the second column with number of complete cases for ID corresponding to j
    matrix[j,2] <- sum(complete.cases(data[data$ID == id[j],]))
  }
  matrix
}


##Check 
##complete("specdata", 1)
##complete("specdata", c(2, 4, 8, 10, 12))
##complete("specdata", 30:25)
##complete("specdata", 3)