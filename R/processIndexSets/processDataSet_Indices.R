#clear all environment data
rm(list=ls())

#use anytime for date conversions
library(anytime)

#Function to format the data and rename columns
processDataSet <- function(fileName){

  #Read Data as csv
  dataSet <- read.csv2(fileName)
  
  #Name for columns
  name <- basename(fileName)
  dateName <- paste(name, "Date")
  priceName <- paste(name, "Price")
  openName <- paste(name, "Open")
  highName <- paste(name, "High")
  lowName <- paste(name, "Low")
  volumeName <- paste(name, "Volume")
  colNames <- c(dateName, priceName, openName, highName, lowName, volumeName)
  
  #attach and rename columns
  colnames(dataSet)[c(1, 2, 3, 4, 5, 6)] <- colNames
  
  #select what to keep --> drop column Change
  keep <- colNames
  dataSet <- dataSet[,keep]
  
  #remove all thousand-seperator-commas
  dataSet[,priceName] <- gsub(",", "", dataSet[,priceName])
  dataSet[,openName] <- gsub(",", "", dataSet[,openName])
  dataSet[,highName] <- gsub(",", "", dataSet[,highName])
  dataSet[,lowName] <- gsub(",", "", dataSet[,lowName])
  
  #change type Factor to correct one
  dataSet[,dateName] <- anytime(dataSet[,dateName])
  dataSet[,priceName] <- as.numeric(as.character(dataSet[,priceName]))
  dataSet[,openName] <- as.numeric(as.character(dataSet[,openName]))
  dataSet[,highName] <- as.numeric(as.character(dataSet[,highName]))
  dataSet[,lowName] <- as.numeric(as.character(dataSet[,lowName]))
  dataSet[,volumeName] <- as.character(dataSet[, volumeName])
  
  #set K to 1000 M to 1000000 and B to 1000000000
  dataSet[,volumeName] <- gsub("K", "000", dataSet[,volumeName])
  dataSet[,volumeName] <- gsub("M", "000000", dataSet[,volumeName])
  dataSet[,volumeName] <- gsub("B", "000000000", dataSet[,volumeName])
  
  #remove "." and convert to numeric
  dataSet[,volumeName] <- gsub("\\.", "", dataSet[,volumeName]) #meh
  dataSet[,volumeName] <- as.numeric(dataSet[,volumeName])
  
  
  #save as csv; not csv2, because azure ML studio can't read semicolons as seperators
  write.csv(dataSet, file = paste(name, "_processed.csv"), append = FALSE, quote = TRUE, sep = ",",
              eol = "\n", na = "", dec = ".", row.names = TRUE,
              col.names = TRUE, qmethod = c("escape", "double"),
              fileEncoding = "")
}

#get all files to convert
files <- list.files(path=".", pattern="*.csv", full.names=T, recursive=FALSE)

#convert
lapply(files, processDataSet)

