## Matrix inversion is a costly computation
## Therefore there may be some benefit to caching the inverse of a matrix rather
## then computing it repeatedly.

## This function creates a special matrix object that can caches its inverse
## it contains the following functions:
## 1. set the value of a matrix
## 2. get the value of a matrix
## 3. set the value of the inverse of a matrix
## 4. get the value of the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## Following function calculates he inverse of the matrix created by makeCacheMatrix
## It assumes that the matrix passed is always invertible.
## It first checks if the inverse matrix has already been calculated
## If so it gets the inverse from the cache and skips the calculated
## Otherwise it calculated the inverse of the matrix and stores that value in the makeCacheMatrix 
## using the setinverse function

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data.")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}