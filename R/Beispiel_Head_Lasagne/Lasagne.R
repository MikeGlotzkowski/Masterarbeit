setwd("C:/Users/Sebastian Lischewski/Documents/Masterarbeit/R/Beispiel_Head_Lasagne")
install.packages("xtable")
library(xtable)

data <- read.csv2("Case Lasagne Test.csv")
data
head(data)
xtable(head(data))
