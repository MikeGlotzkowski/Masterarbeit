install.packages("xtable")
library(xtable)
options(xtable.floating = FALSE)
options(xtable.timestamp = "")
setwd("C:/Users/Sebastian Lischewski/Documents/Masterarbeit/R/Beispiel_Berufserfahrung")



#Daten einlesen
data <- read.csv2("Beispiel_Berufserfahrung_Datensatz1.csv")
data
xtable(data)

#Regression mit allen Faktoren
regression1 <- lm(Gehalt ~ Studium + ErfahrungExtern + ErfahrungIntern + Alter, data=data)
summary(regression1)
xtable(summary(regression1))

#Regression mit signifikanten Faktoren
regression2 <- lm(Gehalt ~ Studium + ErfahrungExtern + ErfahrungIntern, data=data)
summary(regression2)

#Transformation
data[,"ErfahrungGesamt"] <- data[,3] + data[,4]

#Regression
regression3 <- lm(Gehalt ~ ErfahrungGesamt, data=data)
summary(regression3)


