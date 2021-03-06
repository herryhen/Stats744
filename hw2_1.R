library(tidyverse)
Ms <- DataPlot1Plot2
Year <- Ms[1]
Vaccination <- Ms[2]
Cases <- Ms[3]

ggplot(Ms, aes(x=Year)) +
  geom_area(aes(y=Cases), fill="#FF3D3D99") + 
  geom_ribbon(aes(ymin=800, ymax=3200-Vaccination*32), fill="#4197DA70") +
  scale_y_continuous(
    breaks=c(0, 200, 400, 600, 800), 
    minor_breaks = seq(0, 800, by = 160), 
    name = "Cases (thousands)", 
    sec.axis = sec_axis(~100-./32, breaks=seq(75,100,by=5), name="Vaccination Rate (%)")) +
  scale_color_manual(name="z", values=c("Cases"="red", "Vaccination"="#4197DA")) +
  theme(
    panel.grid.major.y = element_line("#FF3D3D40"),
    panel.grid.minor.y = element_line ("#08A1B340"),
    axis.title.x = element_blank(),
    axis.title.y = element_text(color = "red"),
    axis.text.y = element_text(color = "red"),
    axis.title.y.right = element_text(color = "#4197DA"),
    axis.text.y.right = element_text(color = "#4197DA")) +
  geom_text(data = Ms, aes(x = 1963, y = 850, label = "1st vaccine: 1963"))
