## Best

## The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specifed outcome in that state

rm(list=ls())
getwd()
dir()
setwd("/Users/quora1/Desktop/DataScience/R_programming/R_wd")
 
best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  ## Check that state is valid
  state.vec   <- data$State ## cut out from the dataframe a vector containing states to do the validity check
     if(sum(state == state.vec) == 0){
      stop("invalid state")
    } else {

    	outcome.state <-data[which(data$State == state),] 
    }
    
    ## Check that outcome is valid and if it is, return hospital name in that state with lowest 30-day death
      
  outcome.vec <- c("heart attack","heart failure","pneumonia")
  
 if(sum(outcome == outcome.vec) == 0){
     stop("invalid outcome")
    } else {
      if (outcome  == "heart attack")   
      best.hosp <- outcome.state$Hospital.Name[which.min(as.numeric(outcome.state[,11]))]        
      if (outcome  == "heart failure")          
      best.hosp <- outcome.state$Hospital.Name[which.min(as.numeric(outcome.state[,17]))]        
      if (outcome  == "pneumonia")              
      best.hosp <- outcome.state$Hospital.Name[which.min(as.numeric(outcome.state[,23]))]        
    }
  
  ## handling ties
   
   besthospital <- sort(best.hosp)[1]
   return(besthospital)
  
}

best("TX","heart attack")

##quiz
best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")

 
