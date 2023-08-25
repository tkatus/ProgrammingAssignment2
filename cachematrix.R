# function provides methods to get the matrix and to cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  setInv <- function() m <<- solve(x)
  getInv <- function() m
  list(setInv = setInv, getInv = getInv)
}


# calculate inverse of matrix x, unless the inverse has been cached - if so return cached value
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  x$setInv()
  x$getInv()
}



# testcase
m <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
m1 <- makeCacheMatrix(m)
# first call solves matrix (as there is no value in the cache)
cacheSolve(m1)
# second call uses cached value
cacheSolve(m1)


