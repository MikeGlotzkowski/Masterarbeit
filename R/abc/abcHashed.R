# Map 1-based optional input ports to variables
abcnews <- maml.mapInputPort(1) # class: data.frame
attach(abcnews)

#aggregate by date
abccompact <- aggregate(. ~ publish_date, abcnews, sum)

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("abccompact");