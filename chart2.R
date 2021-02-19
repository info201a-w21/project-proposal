library(dplyr)
library(ggplot2)
library(ggrepel) #if you're running this you will need to install the package

#gdp per capita for each country
country_and_GDP <- owid.covid.data %>% 
select(V3, V50) %>% #only take country name and GDP
  unique() %>% #dont need repeats
  filter(V50 != "") %>%  #remove rows/countries with no GDP listed
  filter(V50 != "gdp_per_capita") #removing text bc it shows up on graph
country_and_GDP

#converting to numeric

is.numeric(country_and_GDP$V50) #FALSE. what? why is it a string?
country_and_GDP$V50 <- as.numeric(country_and_GDP$V50) #converting to numeric.
country_and_GDP$V50 
is.numeric(country_and_GDP$V50) #TRUE. 


#converting to numeric


#deaths for each country
country_and_DEATHS <- owid.covid.data %>% 
  select(V3, V8) %>%  #only take country name and cases
  filter(V8 != "") %>%  #filter out countries with no cases listed
  filter(V8 != "total_deaths")
country_and_DEATHS

#sorry for the split here, something is wonky - dataset cases should be a number but instead its a stirng

is.numeric(country_and_DEATHS$V8) #FALSE. what? why is it a string?
country_and_DEATHS$V8 <- as.numeric(country_and_DEATHS$V8) #converting to numeric.
country_and_DEATHS$V8 
is.numeric(country_and_DEATHS$V8) #TRUE. 
country_and_DEATHS

country_and_DEATHS <-  country_and_DEATHS %>% 
  group_by(V3) %>% 
  filter(V8 == max(V8)) %>% #filter to see the max cases for each location
  unique()   #some of the data never changes (e.g. dominican republic had the same amount of cases for 20 rows)
country_and_DEATHS



#joining both
capita_to_deaths <- left_join(
  country_and_DEATHS,
  country_and_GDP,
  by = "V3")

#cleaning up the data a bit more
capita_to_deaths <- capita_to_deaths %>% 
  na.omit() %>% #removing NA values, in turn removing entire continents (e.g. Africa, Asia) 
filter(V3 != "World") #removing world, will only confuse if its included in graph.
  capita_to_deaths

#changing names
names(capita_to_deaths)[1] <- "location"
names(capita_to_deaths)[2] <- "total_deaths"
names(capita_to_deaths)[3] <- "gdp_per_capita"


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
  
  covid_plot_2