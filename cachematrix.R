## Matrix inversion is a costly computation
## Therefore there may be some benefit to caching the inverse of a matrix rather
## then computing it repeatedly.

## This function creates a special matrix object that can caches its inverse
## it contains the following functions:
## 1. setMatrix     set the value of a matrix
## 2. getMatrix     get the value of a matrix
## 3. setInverse    set the value of the inverse of a matrix
## 4. getInverse    get the value of the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
    
    # initialize the cache
    m <- NULL
    
    # store a matrix
    setMatrix <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    # return a stored matrix
    getMatrix <- function() {
        x
    }
    
    # cache the inversed matrix
    setInverse <- function(solve) {
        m <<- solve
    }
    
    # get the inversed matrix
    getInverse <- function() {
        m
    }
    
    list(setMatrix=setMatrix, getMatrix=getMatrix, setInverse=setInverse, getInverse=getInverse)
}

## Following function calculates he inverse of the matrix created by makeCacheMatrix
## It assumes that the matrix passed is always invertible.
## It first checks if the inverse matrix has already been calculated
## If so it gets the inverse from the cache and skips the calculated
## Otherwise it calculated the inverse of the matrix and stores that value in the makeCacheMatrix 
## using the setinverse function

cacheSolve <- function(x, ...) {
    
    # get the cached inverse matrix
    im <- x$getInverse()
    
    # when there is a cached inverse matrix, return it
    if(!is.null(im)) {
        message("getting cached data.")
        return(im)
    }
    
    # otherwise calculate it
    m <- x$getMatrix()
    im <- solve(m)
    # store the inverted matrix in the cache
    x$setInverse(im)
    
    #return the inverse matrix
    im
}