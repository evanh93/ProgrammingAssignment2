## Creates special list of functions for retrieving cached value of matrix inverse

## R Object containing functions for setting/getting matrix values and setting/getting matrix inverse

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


## Return a matrix that is the inverse of 'x' (retrieving previously found
## cached value if available)

cacheSolve <- function(x, ...) {
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
