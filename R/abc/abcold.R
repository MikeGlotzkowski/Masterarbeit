# Map 1-based optional input ports to variables
abcnews <- maml.mapInputPort(1) # class: data.frame
attach(abcnews)

#remove old news
abcnews <- abcnews[abcnews$publish_date > 20110101,]

#convert text to date
abcnews$publish_date <- as.Date(as.character(abcnews$publish_date), "%Y%m%d")

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("abcnews");