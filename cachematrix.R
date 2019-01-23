## Functions that create a matrix 'x', and calculate and return the inverse of matrix 'x'.
## The inverse is cached and retrieved if an attempt to solve for the inverse is made again.

## Return list of functions that set and get matrix values and also
## set and get the inverse of matrix 'x'.

makeCacheMatrix <- function(x = matrix()) {
    mtxInv <- NULL
    
    set <- function(y) {
        x <<- y
        mtxInv <<- NULL
    }
    
    get <- function() x
    setInverse <- function(inverse) mtxInv <<- inverse
    getInverse <- function() mtxInv
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Calculates, caches, and returns matrix that is inverse of 'x'. 
## If inverse matrix was previously cached, returns that matrix.

cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x'
    mtxInv <- x$getInverse()
    
    if (!is.null(mtxInv)) {
        message("Getting cached data")
        return(mtxInv)
    }
    
    data <- x$get()
    mtxInv <- solve(data, ...)
    x$setInverse(mtxInv)
    mtxInv
}
