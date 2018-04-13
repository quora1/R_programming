## Rankhospital 
rm(list=ls())
getwd()
dir()
setwd("/Users/quora1/Desktop/DataScience/R_programming/R_wd")


rankhospital <- function(state, outcome, num = "best") {

## Read outcome data 
  data <- read.csv(file= "outcome-of-care-measures.csv", colClasses = "character")

## Check that state is valid
  state.vec   <- data$State
  if(sum(state == state.vec) == 0){
    stop("invalid state")
  } else {
    	outcome.state <-data[which(data$State == state),] 

## Check that outcome is valid
	outcome.vec <- c("heart attack","heart failure","pneumonia")
    if(sum(outcome == outcome.vec) == 0){
    stop("invalid outcome")
  } else {
    if (outcome  == "heart attack")           selection <- 11 
    if (outcome  == "heart failure")          selection <- 17
    if (outcome  == "pneumonia")              selection <- 23
  }

 ## Order hospitals according to their mortality rates from the selected outcome
    hosp  <- outcome.state$Hospital.Name 
    score <- as.numeric(outcome.state[, selection])
    hosp.sorted <- hosp[order(score,hosp)] 

 ## Return the name of hospital with a given rank   
  if (num == "best"){
    best.hosp <- outcome.state$Hospital.Name[which.min(as.numeric(outcome.state[, selection]))]
  } else if(num == "worst") {
    best.hosp <- outcome.state$Hospital.Name[which.max(as.numeric(outcome.state[, selection]))]
  } else {
        best.hosp <- hosp.sorted[num]
      }
      
      if(length(best.hosp)>0) {
    return(best.hosp)
  } else {
    return(NA)      
  }
}
}
##Checks

 rankhospital("TX", "heart failure", 4)
 ##  [1] "DETAR HOSPITAL NAVARRO"
 
 rankhospital("MD", "heart attack", "worst")
  ## "HARFORD MEMORIAL HOSPITAL"
   
  rankhospital("MN", "heart attack", 5000)
  ## [1] NA
 
##quiz

rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
 rankhospital("TX", "pneumonia", 10)
 rankhospital("NY", "heart attack", 7)