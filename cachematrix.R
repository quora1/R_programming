## The functions below allow to cache the value of the inverse of a matrix:


##1) makeCacheMatrix builds a list with functions that do the following things: 
##a) set velue of the matrix and it's inverse
##b) gets the above values 

makeCacheMatrix <- function(x = matrix()) {

inv <- NULL # It is a default value of the inverse of the matrix
 ##a)
  set <- function(y) {
    x   <<- y
    inv <<- NULL
}
##b)
  get <- function() x 
  setSolve <- function(solved) inv <<- solved ## This one stores the inverse in a different environment.
  getSolve <- function() inv #retrieves the cached value.
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)}

##2)
## cacheSolve calculates and caches the inverse of what was constructed with makeCacheMatrix. 
##If the inverse has already been computed, it retrieves its value from cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getSolve()
  if(!is.null(inv)) {
    message("getting cached output")
    return(inv) }
  data <- x$get()
  inv <- solve(a = data, ...)
  x$setSolve(inv)
  inv}
