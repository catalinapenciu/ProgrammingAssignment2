## Put comments here that give an overall description of what your
## functions do

#The purpose of the two functions below is to optimize the calculation of the inverse
#of a matrix; because this is usually a costly computation, the aim is to cache previously 
#computed inverse matrixes and return them if the computation repeats

## Write a short comment describing this function
#The <makeCacheMatrix> function creates a matrix object and caches it's invers

makeCacheMatrix <- function(x = matrix()) {
  inverse<- matrix(nrow=0, ncol=0)
  setinverse<- function(solve) inverse <<-solve 
  getCache<- function() inverse
  list(setinverse = setinverse, getCache = getCache)
}


## Write a short comment describing this function
#The <cacheSolve> function computes the inverse of the matrix returned by the <makeCacheMatrix> above
#For a previously calculated pair of (inverse, matrix), the function returns the inverse from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$setinverse
  if(!is.null(inverse)) {
    message("Inverse already computed. Retrieving result from cache")
    return(inverse)
  }
  inverse <-solve(x)
  inverse
}