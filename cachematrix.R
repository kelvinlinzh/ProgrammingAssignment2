## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        k <- NULL
        set <- function(y) {
                x <<- y
                k <<- NULL
        }
        get <- function() {
                x
        }
        
        setinv <- function(inv){
        k <<- inv
        }
        
        getinv <- function() {
                k
        }
        
        list(set = set, get = get,
             setinv = setinv,
             getinv  = getinv )
}

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        } 
        data <- x$get()   
        m <- solve(data, ...)
        x$setinv(m)
        m
}
