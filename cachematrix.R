## makeCacheMatrix & cacheSolve
##
## Matrix inversion is usually a costly computation and there 
## may be some benefit to caching the inverse of a matrix rather 
## than computing it repeatedly.  This pair of functions can 
## cache the inverse of a matrix.
##
## EXAMPLE: show product of matrix and its inverse is identity matrix
##    M = rbind(c(4, 3), c(3, 2))
##    M
##            [,1] [,2]
##        [1,]    4    3
##        [2,]    3    2
##
##    cacheM <- makeCacheMatrix(M)
##    cacheM$get()
##            [,1] [,2]
##        [1,]    4    3
##        [2,]    3    2
##
##    invM <- cacheSolve(cacheM)
##    invM
##            [,1] [,2]
##        [1,]   -2    3
##        [2,]    3   -4
##
##    M %*% invM          ## %*% is R matrix multiplication operator
##            [,1] [,2]
##        [1,]    1    0
##        [2,]    0    1

## makeCacheMatrix is a function that creates a special "matrix" 
## object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    ## first, clear cache so new inverse will be calculated
    inv <- NULL
    ## next, assign functions to variables: set, get, setinv, getinv
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    ## finally, return a list: $index = function()
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## cacheSolve is a function that computes the inverse of the 
## special "matrix" returned by makeCacheMatrix above. If the 
## inverse has already been calculated (and the matrix has not 
## changed), then cacheSolve retrieves the inverse from 
## the cache.

cacheSolve <- function(x, ...) {
    ## assume that x is list with index $getinv
    ## assign cached value of inverse to inv
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached inverse")
        return(inv)  ## return cached inverse, if not NULL
    }
    ## otherwise: fetch matrix, calculate inverse and cache result
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv     ## return new inverse
}
