
library(tidyverse)
library(stringr)
library(lintr)
data <- read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")

# Summary --------------------------------------------------------------

summary_info <- list()

# Location with highest total deaths -------------------------------------

summary_info$highest_death_location <- data %>%
  filter(iso_code != "OWID_WRL") %>% 
  filter(total_deaths == max(total_deaths, na.rm = TRUE)) %>% 
  pull(location)

# Location with highest total tests ---------------------------------------

summary_info$highest_test_location <- data %>%
  filter(total_tests == max(total_tests, na.rm = TRUE)) %>% 
    pull(location)

# Locations with highest stringency index (100) ----------------------------------

summary_info$highest_stringency_locations <- data %>% 
  filter(stringency_index == max(stringency_index, na.rm = TRUE)) %>% 
  distinct(location)

# Locations with lowest stringency index -----------------------------------

summary_info$lowest_stringency_locations <- data %>%
  filter(stringency_index == min(stringency_index, na.rm = TRUE)) %>% 
  distinct(location)

# Location with most percentage of people vaccinated ----------------------

summary_info$most_percentage_vacc_location <- data %>%
  filter(total_vaccinations_per_hundred == max(total_vaccinations_per_hundred, na.rm = TRUE)) %>% 
  pull(location)
  

# -------------------------------------------------------------------------









