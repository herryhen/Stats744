library(readxl)
library(tidyverse)
source("http://peterhaschke.com/Code/multiplot.R")

dd <- read_excel("Table4.xlsx")
## BMB: thank you for not using a full path! However, if you set the working directory properly, this will work for

#my directory would be ... dd <- read_excel("C:/Users/Sherry/OneDrive - McMaster University/Documents/McMaster University/2021 Fall/Stats 744/Assignments/Oct 1 table to graph/Table4.xlsx")
head(dd)
site_order = c("WWTP","Outfall","Downstream", "Reference")
x.ordered <- factor(dd$Site, levels=site_order)
plot_colours = c("red", "#FF6363", "#FFA1A1", "#5FAF6D")
p1 <-
  ggplot(dd, aes(x=x.ordered, Temperature)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  ylab(expression("Temperature"~(degree*C)))
## BMB: special character failed on my system
## ylab("Temperature (°C)")
p2 <-
  ggplot(dd, aes(x=x.ordered, pH)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
p3 <-
  ggplot(dd, aes(x=x.ordered, DO)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Dissolved O. (mg/L)")
p6 <-
  ggplot(dd, aes(x=x.ordered, Conductivity)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Conductivity (??S)")
p5 <-
  ggplot(dd, aes(x=x.ordered, Salinity)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Salinity (ppm)")
p4 <-
  ggplot(dd, aes(x=x.ordered, TDS)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("TDS (ppm)")
p7 <-
  ggplot(dd, aes(x=x.ordered, Flow)) +
  geom_bar(stat='identity', fill=plot_colours) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  ylab("Flow (m/s)")
## BMB: could have generated this *much* more compactly
## by using pivot_longer() and faceting (to get the units
## in the plot titles you would
## have to change the column names before pivoting, or
## the levels of the factor after pivoting; second best would
## be creating a function and repeating it 7 times

plot.new()
## BMB: this didn't work for me. Did you have another
## package loaded ... ???
## BMB: why use multiplot rather than something from
##  a package (cowplot, gridExtra, patchwork)? 'cowplot' in
## particular is specifically designed to go with our textbook
multiplot(p1, p2, p3, p4, p5, p6, p7, cols=2) +
legend(
    "bottomright",
    col = plot_colours,
    inset =c(-0.025,-0.4),
    legend = site_order,
    lwd = 2, xpd = TRUE, cex = 0.9,
    ncol=1,)
