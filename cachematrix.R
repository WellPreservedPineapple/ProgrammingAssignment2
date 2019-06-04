## These functions work to calculate and cache the inverse of a matrix you supply.
## The next function will skip the inverse calculations and return
## the inverse if you supply a matrix which has its inverse already cached.
## If you supply a new matrix it will proceed to calculate the inverse then 
## return it.


## This function is very similar to the example function given to us.
## I just made a few small changes to set it for the solve function rather
## than mean.
 makeCacheMatrix <- function(x = matrix()) {
         inv <- NULL
         set <- function(y) {
                 x <<- y
                 inv <<- NULL
             }
         get <- function() x
         setsolve <- function(solveMatrix) inv <<- solveMatrix
         getsolve <- function() inv
         list(set = set, get = get, 
                         setsolve = setsolve,
                         getsolve = getsolve)
     
         }

     
 ## Also very similar to the example; this function is only different
 ## in that I set it to pull/solve the inverse rather than the mean.
     
     cacheSolve <- function(x, ...) {
             inv <- x$getsolve()
             if(!is.null(inv)) {
                     message("I gotchu with that inverse.")
                     return(inv)
                 }
             data <- x$get()
             inv <- solve(data)
             x$setsolve(inv)
             inv
         }
