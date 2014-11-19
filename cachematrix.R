## These functions take a matrix and allow the inverse of the matrix to be
## cached so that it does not have to be recalculated each time
## This function creates a vector that stores both the matrix and its inverse
## if the inverse had already been calculated
makeCacheMatrix <- function(mat = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- mat
    inv <<-NULL
  }
  get <- function() mat
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
  setinv=setinv, getinv = getinv)
}
## This function takes the vector created by makeCacheMatrix and
## finds the inverse if it is not already there
## returns the inverse
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
    data <-x$get()
inv <- solve(data, ...)
  x$setinv(inv)
  inv
}


  


 