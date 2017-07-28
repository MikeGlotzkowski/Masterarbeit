#Transformation
data[,"ErfahrungGesamt"] <- data[,3] + data[,4]

#Regression
regression3 <- lm(Gehalt ~ Studium + ErfahrungGesamt, data=data)
summary(regression3)

