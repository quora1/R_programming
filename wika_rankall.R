##Rankall
rm(list=ls())
getwd()
dir()
setwd("/Users/quora1/Desktop/DataScience/R_programming/R_wd")

##outcome = "heart failure"
##num = 10
##i=3

rankall <- function(outcome, num = "best") {
  ## Read outcome data

data <- read.csv(file = "outcome-of-care-measures.csv", colClasses = "character")
 
  ## Check that outcome is valid

outcome.vec <- c("heart attack","heart failure","pneumonia")
  
  if(sum(outcome == outcome.vec) == 0){
    stop("invalid outcome")
  } else {
    if (outcome  == "heart attack")     selection <- 11 
    if (outcome  == "heart failure")    selection <- 17
    if (outcome  == "pneumonia")        selection <- 23
  }
  
 outcome.state <- split(data, f = data$State)
  
 num_states <- length(unique(data$State)) ## = length(outcome.state)
 
 best.hosp <- data.frame(matrix(0, ncol = 2, nrow= num_states))
  
  
  for(i in 1:num_states){
    if (num == "best"){
      best.hosp.x <- outcome.state[[i]]$Hospital.Name[which.min(as.numeric(outcome.state[[i]][,selection]))]
    } else if(num == "worst") {
      best.hosp.x <- outcome.state[[i]]$Hospital.Name[which.max(as.numeric(outcome.state[[i]][, selection]))]
    } else {
      hosp  <- outcome.state[[i]]$Hospital.Name 
      score <- as.numeric(outcome.state[[i]][, selection])
      hosp.sorted <- hosp[order(score, hosp)]
      best.hosp.x <- hosp.sorted[num]
    }
    best.hosp[i,1] <- best.hosp.x
  }
  names(best.hosp) <- c("hospital", "state")
  best.hosp[,2] <- levels(as.factor(data$State)) ## similar to "unique(data$State)" but in this case doesnt match perfectly
  rownames(best.hosp) <- levels(as.factor(data$State))
  return(best.hosp)
}

##quiz
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)