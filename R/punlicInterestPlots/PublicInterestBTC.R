# Read BTC datasets and convert dates
google_Trends_BTC_Websearch.csv <- read.csv("google_Trends_BTC_Websearch.csv");
google_Trends_BTC_Websearch.csv[,1] <- as.Date(google_Trends_BTC_Websearch.csv[,1])
google_Trends_BTC_Newssearch.csv <- read.csv("google_Trends_BTC_Newssearch.csv");
google_Trends_BTC_Newssearch.csv[,1] <- as.Date(google_Trends_BTC_Newssearch.csv[,1])
attach(google_Trends_BTC_Websearch.csv)
attach(google_Trends_BTC_Newssearch.csv)

#Plot the data in line graphs
ggplot(google_Trends_BTC_Websearch.csv) + 
  geom_line(data = google_Trends_BTC_Websearch.csv, aes(x = Monat, y = bitcoin...Weltweit., color = "BTC Websearch")) +
  geom_line(data = google_Trends_BTC_Newssearch.csv, aes(x = Monat, y = bitcoin...Weltweit., color = "BTC Newssearch")) +
  xlab('Date') +
  ylab('GoogleSearchIndex')+
  scale_colour_manual("", 
                      breaks = c("BTC Websearch", "BTC Newssearch"),
                      values = c("green", "blue")) 