## Programming Assignment 2

The code is this repository can be used to cache the inverse matrix

Hereunder you can find instructions on how to use the functions

Create our cached matrix object

`> myData <- makeCacheMatrix()`

Store a matrix

`> myData$setMatrix(matrix(c(1:4),nrow = 2, ncol = 2) )`

Get the matrix

`> myData$getMatrix()`

	     [,1] [,2]
	[1,]    1    3
	[2,]    2    4

1st run of the cacheSolve function

`> cacheSolve(myData)`

	     [,1] [,2]
	[1,]   -2  1.5
	[2,]    1 -0.5

2nd run of the cacheSolve function, now return the cached data

`> cacheSolve(myData)`

	getting cached data.
	     [,1] [,2]
	[1,]   -2  1.5
	[2,]    1 -0.5