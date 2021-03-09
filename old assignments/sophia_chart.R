library("ggplot2") 
library(tidyverse)
library(scales)
options(scipen=999)


all_data <- read.csv("data.csv")

strin_cases <- all_data %>% 
  group_by(location) %>% 
  summarize(location, stringency_index, total_cases_per_million)

  
strin_cases_plot <- ggplot(data = strin_cases) +
  geom_point(mapping = aes(x = stringency_index, y = total_cases_per_million), na.rm = T)+
  geom_smooth(mapping = aes(x = stringency_index, y = total_cases_per_million), na.rm =T) +
  ggtitle("Stringency vs Total Cases per Million") + 
  labs(y= "Total Cases per million", x = "Stringency Index") +
  scale_y_continuous(labels = comma)