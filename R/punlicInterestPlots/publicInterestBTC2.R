#Read historical BTC price data and convert date
btcPrice.csv <- read.csv2("btcPrice.csv");
btcPrice.csv[,1] <- as.Date(btcPrice.csv[,1],"%d/%m/%Y")
attach(btcPrice.csv)

#Plot the data
ggplot(google_Trends_BTC_Websearch.csv) + 
  geom_line(data = google_Trends_BTC_Websearch.csv, aes(x = Monat, y = bitcoin...Weltweit., color = "BTC Websearch")) +
  geom_line(data = google_Trends_BTC_Newssearch.csv, aes(x = Monat, y = bitcoin...Weltweit., color = "BTC Newssearch")) +
  geom_line(data = btcPrice.csv, aes(x = i..Date, y = btc_market_price/50, color = "Bitcoinkurs")) +
  xlab('Date') +
  ylab('GoogleSearchIndex')+
  scale_colour_manual("", 
                      breaks = c("BTC Websearch", "BTC Newssearch", "Bitcoinkurs"),
                      values = c("red", "green", "blue"))