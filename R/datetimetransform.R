BTCUSDT <- read.csv("C:/Users/s.lischewski/Documents/Masterarbeit/Sammlung/BTCUSDT.csv")
ETHUSDT <- read.csv("C:/Users/s.lischewski/Documents/Masterarbeit/Sammlung/ETHUSDT.csv")
head(BTCUSDT)

# Convert to datetimes
install.packages("anytime")
library(anytime)
ETHUSDT[,1] <- anytime(ETHUSDT[,1])

# Test
head(BTCUSDT)
head(ETHUSDT)
BTCUSDT[40000:40010,]
ETHUSDT[30000:30010,]

# Daily stuff
data <- BTCUSDT

# data table daily mean
install.packages("data.table")
library(data.table)

BTCUSDT.data.table <- data.table(BTCUSDT)
BTCUSDT.data.table[,1] <- as.Date(anytime(BTCUSDT[,1]))
#mean from column
b2 <- BTCUSDT.data.table[, mean(close), by = date]
b3 <- BTCUSDT.data.table[, mean(open), by = date]

#merge means into one table
b4 <- merge(b2,b3,by="date")

#rename them
colnames(b4)[2] <- "open"
colnames(b4)[3] <- "close"
b4

ETHUSDT.data.table <- data.table(ETHUSDT)
ETHUSDT.data.table[,1] <- as.Date(anytime(ETHUSDT[,1]))
e2 <- ETHUSDT.data.table[, mean(close), by = date]
