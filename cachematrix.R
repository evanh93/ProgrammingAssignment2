## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    mtxInv <- NULL
    set <- function(y) {
        x <<- y
        mtxInv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    mtxInv <- X$getInverse()
    if (!is.null(m)) {
        message("Getting cached data")
        return(mtxInv)
    }
    data <- x$get()
    mtxInv <- solve(data, ...)
    x$setInverse(mtxInv)
    mtxInv
}
