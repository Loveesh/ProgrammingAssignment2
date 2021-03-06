# This function creates a special matrix that provides a list of
# functions which cache / retrieve the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(v){
    x <<- v
    inv <<- NULL
  }
  get <- function(){
    x
  }
  setInv <- function(i){
    inv <<- i
  }
  getInv <- function(){
    inv
  }
  list(set = set, 
       get = get,
       setInv = setInv, 
       getInv = getInv)
}

# This function calculates the inverse of the given matrix.
# It first check if there is any existing cache of the inverse.
# If so, it getInv the value; if not, the inverse is calculated
# and cached using setInv.

cacheSolve <- function(x, ...) {
        
  inv <- x$getInv()
  if(!is.null(inv)){
    message("getting cached inverse of x")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInv(inv)
  inv
}
