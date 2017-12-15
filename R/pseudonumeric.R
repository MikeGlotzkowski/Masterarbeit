#clear environment
rm(list = ls())

#converts a vector of pseudo numerics to a vector of numerics
pseudoNumeric.as.numeric <- function(initialVector) {
  
  #the new vector to fill with values
  newVector <- c()
  
  #convert from factors to characters
  initialVector <- as.character(initialVector)
  
  #convert each value
  for(x in initialVector){
    
    #see which case 
    #(1) k or K for 1000
    #(2) m or M for 1000000
    #(3) b ir B for 1000000000
    if (grepl("k", x) || grepl("K", x)) {
      
      #remove character
      x <- gsub("K", "", x)
      x <- gsub("k", "", x)
      
      #convert to numeric
      x <- as.numeric(x)
      
      #multiply to ge correct number
      x <- x * 1000
    }
    if (grepl("m", x) || grepl("M", x)) {
      #remove character
      x <- gsub("m", "", x)
      x <- gsub("M", "", x)
      
      #convert to numeric
      x <- as.numeric(x)
      
      #multiply to ge correct number
      x <- x * 1000000
      
    }
    if (grepl("b", x) || grepl("B", x)) {
      #remove character
      x <- gsub("b", "", x)
      x <- gsub("B", "", x)
      
      #convert to numeric
      x <- as.numeric(x)
      
      #multiply to ge correct number
      x <- x * 1000000000
    }
    
    #add the newly converted value to the return vector
    newVector <- c(newVector, as.character(x))
  }
  
  #return when finished
  return(newVector)
}

