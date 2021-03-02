
library(tidyverse)
library(stringr)
library(lintr)
data <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")

# Aggregate table ---------------------------------------------------------

highest_stringency_countries <- data %>% 
  filter(stringency_index == max(stringency_index, na.rm = TRUE)) %>% 
  group_by(location) %>% 
  summarize(new_cases = mean(new_cases, na.rm = TRUE)) 


# Rename columns ----------------------------------------------------------

 highest_stringency_countries <- highest_stringency_countries %>%
  rename("average daily cases" = new_cases)

 highest_stringency_countries <- highest_stringency_countries %>% 
   rename("stringent countries" = location)
 

# Round average new cases -------------------------------------------------
 
 highest_stringency_countries <- highest_stringency_countries %>% 
   mutate_if(is.numeric, round, digits = 0)


# Create table ------------------------------------------------------------
 
 kable(highest_stringency_countries)
 
 
# -------------------------------------------------------------------------

 

  
  
  
