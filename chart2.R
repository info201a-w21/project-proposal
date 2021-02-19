library(dplyr)
library(ggplot2)
library(stringr)
library(tidyverse)

owid.covid.data <- read.csv("owid-covid-data.csv")
View(owid.covid.data)

#gdp per capita for each country

country_and_GDP <- owid.covid.data %>% 
select(location, gdp_per_capita) %>% #only take country name and GDP
  unique() %>% #dont need repeats
  filter(gdp_per_capita != "") 

#deaths for each country
country_and_DEATHS <- owid.covid.data %>% 
  select(location, total_deaths) %>%  #only take country name and cases
  filter(total_deaths != "") %>% 
  group_by(location) %>% 
  filter(total_deaths == max(total_deaths )) %>% #filter to see the max cases for each location
  unique()   #some of the data never changes (e.g. dominican republic had the same amount of cases for 20 rows)



#joining both
capita_to_deaths <- left_join(
  country_and_DEATHS,
  country_and_GDP,
  by = "location")

#cleaning up the data a bit more
capita_to_deaths <- capita_to_deaths %>% 
  na.omit() #removing NA values, in turn removing entire continents (e.g. Africa, Asia) 


#making graph
covid_plot_2 <- ggplot(data = capita_to_deaths) +
  geom_point(mapping =aes(x = gdp_per_capita, y = total_deaths,)) +
  geom_smooth(mapping =aes(x = gdp_per_capita, y = total_deaths,), se = FALSE) +
    scale_color_gradient(low = "black", high = "red") +
  scale_x_continuous(limits = c(4000, 70000)) + #show those countries with atleast 10k gdp
  scale_y_continuous(limits = c(1000,59000)) +
  labs(title="Relationship Between Countries Death Rates and GDP", subtitle = "The blue line represents average total deaths") +
  xlab("GDP Per Capita") +
  ylab("Total Deaths") 
