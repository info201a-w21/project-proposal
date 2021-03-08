library(stringr)
library(tidyverse)
library(countrycode)
library(scales)

covid <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")

covid_data <- covid %>%
  filter(date== max(date)) %>%
  select(iso_code, location, total_cases)

# most_recent_date <- covid_data %>%
#   filter(date == avg(date))

shapefile <-map_data("world")
  
shapefile <- shapefile %>%
  mutate(iso_code = countrycode(region, origin = 'country.name', destination = 'iso3c')) %>%
  left_join(covid_data, by = "iso_code")

covid_map <- ggplot(data = shapefile)+
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = total_cases))+
  scale_fill_gradient(labels = comma) + 
  labs(title = paste("Total Number of Covid Cases in Each Country"), 
       x = "", y = "", fill = "Number of Cases")+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank())
