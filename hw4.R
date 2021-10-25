library(tidyverse)
dd <- read_excel(".../hw4.xlsx")

temp <- dd[[2]] #https://www.reddit.com/r/rstats/comments/9bnvox/why_cant_i_plot_using_dataframei/
year <- dd[[1]]

ddfit = lm(temp ~ year, dd)
summary(ddfit)

ggplot(dd, aes(x = year, y = temp)) + 
  geom_point() +
  xlab("Year")+ 
  ylab("Annual temperature anomaly") +
  stat_smooth(method = "lm", col = "red")