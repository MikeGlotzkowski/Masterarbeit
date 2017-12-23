# Map 1-based optional input ports to variables
data <- maml.mapInputPort(1) # class: data.frame

#add column increase and default to NA
data[, "increase"] <- NA

#get the column with the price
priceVector <- data[, "btc_market_price"]

#returns 0 if there was no increase in value; else returns 1
checkForIncrease <- function(prev, cur) {
  #skip na values
  if ((is.na(prev)) || (is.na(cur))) {
    return(0)
  } else {
    #set to 1
    increase <- 1
    
    #if there was no increase --> set to zero
    if (prev >= cur) {
      increase <- 0
    }
    
    #return increase
    return(increase)
  }
}

#for each value
for (i in 1:length(priceVector)) {
  #get values
  prev <- data[i, "btc_market_price"]
  cure <- data[i + 1, "btc_market_price"]
  
  #fill values
  data[i + 1, "increase"] <-
    checkForIncrease(prev, cure)
}

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("data")
