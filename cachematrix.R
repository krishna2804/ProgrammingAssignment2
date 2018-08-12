## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

i <- NULL
  set<- function(y) {
    x<<-y
    i<<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  
  list(set = set,get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function
# this function will give a list of 4 with set ,get,setinverse,getinverse which we use in cacheSolve function as input.

cacheSolve <- function(x, ...) {
i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i

        ## Return a matrix that is the inverse of 'x'
}

## Test run with data sample
matrix1<-matrix(c(1,2,3,4),2,2)
cache_matrix<-makeCacheMatrix(matrix1)
inverse_matrix<-cacheSolve(cache_matrix)
print(inverse_matrix)
