## swirl exercises #11 - vapply/tapply

install.packages("swirl")
library("swirl")
swirl()
quora1
1

#############################################
vapply(flags, unique, numeric(1)) ## numeric specifies that each element 
##of the vector is of length 1
## it didnt work cuz the result is not a unique number
vapply(flags, class, character(1)) ##this one worked
## basically we use it to be sure that the dim we expected (and cannot verify) are right.
## if they are not vapply will return message and sapply will not. its a "safer" version of sapply.
table(flags$landmass)
tapply(flags$animate, flags$landmass, mean) ## the second argument (landmass) 
##is a category, here you take a mean of column animate by each landmass category
tapply(flags$population, flags$red, summary) ##summary of population values
## for countries with and without the color red on their flag
