library(ggplot2)

phases <- c("Business Understanding", "Data Understanding", "Data Preperation", "Modeling", "Evaluation")

shearer <- data.frame(
  group = phases,
  value = c(10, 20, 50, 10, 10)
)

plan <- data.frame(
  group = phases,
  value = c(5, 20, 10, 5, 5)
)

real <- data.frame(
  group = phases, 
  value = c(5, 16, 29, 10, 5)
)

# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

pie1 <- ggplot(shearer, aes(x="HI", y=value, fill=group)) +
  ggtitle("Aufteilung nach Shearer") +
  geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        legend.position="none",
        panel.grid  = element_blank(),
         plot.title = element_text(size=10))+
        scale_fill_brewer(palette = "Paired", type = "seq")

pie2 <- ggplot(plan, aes(x="", y=value, fill=group)) +
  ggtitle("Aufteilung nach Plan") +
  geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        plot.title = element_text(size=10))+
  scale_fill_brewer(palette = "Paired", type = "seq") +
  guides(fill=guide_legend(title="Phasen"))


pie3 <- ggplot(real, aes(x="", y=value, fill=group)) +
  ggtitle("Tatsächliche Aufteilung") +
  geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        legend.position="none",
        panel.grid  = element_blank(),
        plot.title = element_text(size=10))+
  scale_fill_brewer(palette = "Paired", type = "seq")


multiplot(pie1, pie2, pie3, cols=1)
