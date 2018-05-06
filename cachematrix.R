## Put comments here that give an overall description of what your
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.


## make Cache matrix  creates the inverse of a matrix, and if the matrix doesn't change the cachesolve 
## part should access the inverse and should pass the result without calculation

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
  x <<- y
  inv <<- NULL
    }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
 list(set = set, get = get, setinv = setinv, getinv = getinv)
 	
 }



## cachesolve works on the matrix created by makecachematrix, it passes the inverse of matrix if 
## the matrix is new, otherwise for unchanged matrixit will access the matrix already in cache 
## without doing any calculation.

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
   if(!is.null(inv)) {
        message("getting cached result")
        return(inv)
      }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}	


