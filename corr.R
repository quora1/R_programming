##week2-part3
##corr.R

##Task:
##Write a function that takes a directory of data files and a threshold for complete cases 
##and calculates the correlation between sulfate and nitrate for monitor locations 
##where the number of completely observed cases (on all variables) is greater than the threshold. 
##The function should return a vector of correlations for the monitors that meet the threshold requirement. 
##If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
####################################################################################################


##rm(list=ls())


corr <-function(directory,threshold=0) {

	##initial setup
setwd("C:/Users/gvaurantowka/Desktop/DataScience/R_programming/R_wd") 
files_list <- list.files("specdata", full.names=TRUE)


corre <- numeric()   ##create an empty vector
for(i in 1:length(files_list)){
nobs<-nrow(read.csv(files_list[i])[complete.cases(read.csv(files_list[i])),]) ##calculates number of rows with complete observations
if(nobs>0){
correlation <- cor(data.frame(read.csv(files_list[i])$sulfate,read.csv(files_list[i])$nitrate),use="complete.obs")
correlation <- correlation[1,2] ## "cor" provides a matrix, here I extract the proper correlation

if(nobs > threshold) {

corre <- append(corre, correlation ) ## I take an empty vector and apend correlations one after another if the two conditions are satisfied
}
}
}
corre
}


##NOTES
##corr("specdata",100)
##corr("specdata",1000)
##corr("specdata",5000)

##before you run "source" commned, for ex:
##source("corr.R"), make sure that the environment from which you call this function is the same as
##the one you saved this function in!
##so before you run "source" command, run "setwd" command if necessary!

