## Matrix inversion is usually a costly computation and there 
## may be some benefit to caching the inverse of a matrix rather 
## than computing it repeatedly.  This pair of functions can 
## cache the inverse of a matrix.

## makeCacheMatrix is a function that creates a special "matrix" 
## object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## cacheSolve is a function that computes the inverse of the 
## special "matrix" returned by makeCacheMatrix above. If the 
## inverse has already been calculated (and the matrix has not 
## changed), then cacheSolve retrieves the inverse from 
## the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
