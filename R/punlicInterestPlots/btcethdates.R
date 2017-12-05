setwd("./public Interest/")
getwd()
install.packages("ggplot2")
library(ggplot2)

rm(list=ls())

# Read BTC datasets and convert dates
google_Trends_BTC_Websearch.csv <- read.csv("google_Trends_BTC_Websearch.csv");
google_Trends_BTC_Websearch.csv[,1] <- as.Date(google_Trends_BTC_Websearch.csv[,1])
google_Trends_BTC_Newssearch.csv <- read.csv("google_Trends_BTC_Newssearch.csv");
google_Trends_BTC_Newssearch.csv[,1] <- as.Date(google_Trends_BTC_Newssearch.csv[,1])
attach(google_Trends_BTC_Websearch.csv)
attach(google_Trends_BTC_Newssearch.csv)

#Read historical BTC price data and convert date
btcPrice.csv <- read.csv2("btcPrice.csv");
btcPrice.csv[,1] <- as.Date(btcPrice.csv[,1],"%d/%m/%Y")
attach(btcPrice.csv)

#Plot the data
ggplot() + 
  geom_line(data = google_Trends_BTC_Websearch.csv, aes(x = Monat, y = bitcoin...Weltweit., color = "BTC Websearch")) +
  geom_line(data = google_Trends_BTC_Newssearch.csv, aes(x = Monat, y = bitcoin...Weltweit., color = "BTC Newssearch")) +
  geom_line(data = btcPrice.csv, aes(x = ï..Date, y = btc_market_price/50, color = "Bitcoinkurs")) +
  xlab('Date') +
  ylab('GoogleSearchIndex')+
  scale_colour_manual("", 
                      breaks = c("BTC Websearch", "BTC Newssearch", "Bitcoinkurs"),
                      values = c("red", "green", "blue")) 


# Read ETH datasets and convert dates
google_Trends_ETH_Websearch.csv <- read.csv("google_Trends_ETH_Websearch.csv");
google_Trends_ETH_Websearch.csv[,1] <- as.Date(google_Trends_ETH_Websearch.csv[,1])
google_Trends_ETH_Newssearch.csv <- read.csv("google_Trends_ETH_Newssearch.csv");
google_Trends_ETH_Newssearch.csv[,1] <- as.Date(google_Trends_ETH_Newssearch.csv[,1])
attach(google_Trends_ETH_Websearch.csv)
attach(google_Trends_ETH_Newssearch.csv)

#Read historical ETH price data and convert date
ethPrice.csv <- read.csv2("ethPrice.csv");
ethPrice.csv[,1] <- as.Date(ethPrice.csv[,1],"%m/%d/%Y")
attach(ethPrice.csv)

#Plot the data
ggplot() + 
  geom_line(data = google_Trends_ETH_Websearch.csv, aes(x = Monat, y = Ethereum...Weltweit., color = "ETH Websearch")) +
  geom_line(data = google_Trends_ETH_Newssearch.csv, aes(x = Monat, y = Ethereum...Weltweit., color = "ETH Newssearch")) +
  geom_line(data = ethPrice.csv, aes(x = ï..Date.UTC., y = eth_etherprice/8, color = "Ethereumkurs")) +
  xlab('Date') +
  ylab('GoogleSearchIndex')+
  scale_colour_manual("", 
                      breaks = c("Ethereumkurs", "ETH Newssearch", "ETH Websearch"),
                      values = c("red", "green", "blue")) +
  xlim(as.Date("2015-01-01"), as.Date("2018-01-01"))


ggplot() +
  geom_line(data = ethPrice.csv, aes(x = ï..Date.UTC., y = eth_etherprice, color = "Ethereumkurs"))
  
