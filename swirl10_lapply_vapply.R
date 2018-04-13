## swirl exercises lapply/sapply

install.packages("swirl")
library("swirl")
swirl()
quora1
1

#############################################
class(flag) ## returns class of the objets (table) --> dataframe
cls_list<-lapply(flags, class) ##applies fct class to each column of object flags
class(cls_list)
as.character(cls_list) ## prints results in a character list
cls_vect<-sapply(flags,class) ##same as lapply but prints results like after applying as.character(cls_list) fct (in a vector)
cls_vect<-sapply(flags,class)
sum(flags$orange)
flag_colors <- flags[, 11:17]
lapply(flag_colors, sum)
sapply(flag_colors, sum)
sapply(flag_colors,mean)
flag_shapes <- flags[, 19:23]
lapply(flag_shapes, range)
shape_mat <-sapply(flag_shapes, range)
unique(c(3, 4, 5, 5, 5, 6, 6)) ## returns unique values of the vactor
unique_vals <-lapply(flags,unique)
sapply(unique_vals, length)
lapply(unique_vals, function(elem) elem[2])


