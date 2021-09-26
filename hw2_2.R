library(tidyverse)
Ds <- DataPlot1Plot2
Disease <- Ds[1]
Pre <- Ds[2]
Post <- Ds[3]

Ds %>%
  pivot_longer(!Disease, names_to = "Vaccine", values_to = "Cases") %>% 
  ggplot(aes(x=reorder(Disease, Cases), Cases, fill=Vaccine)
    ) + 
  geom_bar(
    stat="identity", 
    position=position_dodge2(reverse = TRUE),
    width = 0.7,
    ) +
  guides(fill = guide_legend(reverse = TRUE)) +
  theme(
    axis.title.x = element_blank(), 
    legend.title = element_blank(),
    legend.position="top",
    ) +
  scale_y_continuous(ylab("Mean cases (thousands)")) +
  scale_fill_manual("Vaccine",values = c('#15AFEE', '#FF3F3F'))