## Coursera R Programming - Programming Assignment 2
## functions do

## This function creates a special 'matrix' object that
## can cache its inverse. This is really a list containing
## a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the vaule of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


## cacheSolve function calculates the inverse of the special
## 'matrix' from makeCacheMatrix above. If the inverse has already
## been calculated, it 'get's the inverse from the cache and skips
## the computation. Otherwise, it calculates the inverse of the data
## and sets the value of the inverse in the cache via the 'setinverse' function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
