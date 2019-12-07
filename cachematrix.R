
## With the functions below you will invert matrices and store the result in memory (cache).
## Subsequent inversions of the same array will use the cached value.
## Warning: Test first if matrix is invertible: det (A)! = 0
## det () is in the "matlib" library

##   How to use this:

##  Step1: Create a matriz, for example  
##   A <- matrix( c(5, 1, 0,
##                3,-1, 2,
##        4, 0,-1), nrow=3, byrow=TRUE)

##   Step 2: call makeCacheMatrix
##   t  <- makeCacheMatrix(A)

##   Step 3 : call cacheSolve
##   cacheSolve(t)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  

}

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
  
  
}
