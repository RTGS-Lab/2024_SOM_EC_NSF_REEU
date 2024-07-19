#load analysis_ready dataset
library(tidyverse)
library(readxl)
library(car)
library(ggplot2)
library(readr)
library(dplyr)
som_ec_data <- read_excel(r"(C:\Users\rtjor\Downloads\soar_reeu\som_ec_nsf_reeu\analysis_ready\som_ec_data.xlsx)")
#checking correlation value between EC and SOM 
head(som_ec_data)
correlation <-cor(som_ec_data$acclima_soil_ec_bulk,som_ec_data$organic_matter)
print(correlation)
ggplot(som_ec_data, aes(x = acclima_soil_ec_bulk, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC", x = "Bulk EC", y = "Soil Organic Matter (%)")
# checking correlation value between EC Pore and SOM
correlation_pore <-cor(som_ec_data$acclima_soil_ec_pore,som_ec_data$organic_matter)
print(correlation_pore)
ggplot(som_ec_data, aes(x = acclima_soil_ec_pore, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Pore EC", x = "Bulk EC", y = "Soil Organic Matter (%)")
# checking correlation value between Permittivity and SOM 
correlation_perm <-cor(som_ec_data$acclima_soil_permitivity,som_ec_data$organic_matter)
print(correlation_perm)
ggplot(som_ec_data, aes(x = acclima_soil_permitivity, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Permittivity", x = "Permittivity", y = "Soil Organic Matter (%)")
# two way annova between Bulk EC, SOM, field 
two.way <- aov(organic_matter ~ acclima_soil_ec_bulk + field, data = som_ec_data)
summary(two.way)
# boxplot of field and SOM
ggplot(som_ec_data, aes(x = field,y = organic_matter, fill = factor(field))) + 
  geom_boxplot() +
  labs(title = "Boxplot of Soil Orgainic Matter by Field Type" ,
       x = "Field Type",
       y = "Organic Matter") +
  theme_minimal()
# boxplot bulk ec and field
ggplot(som_ec_data, aes(x = field, y = acclima_soil_ec_bulk, fill = factor(field))) +
  geom_boxplot() +
  labs(title = "Boxplot of Bulk EC by Field Type",
       x = "Field Type",
       y = "Bulk EC") +
  theme_minimal()
#create seperate tables for corn, soy, and turf
corn <- som_ec_data %>%
  filter(field=="Corn")  %>%
  select(field, sample, subsample, acclima_soil_ec_bulk, organic_matter)
soy <- som_ec_data %>% 
  filter(field=='Soy') %>% 
  select(field, sample, subsample, acclima_soil_ec_bulk, organic_matter)
turf <- som_ec_data %>% 
  filter(field=="Turf")  %>%
  select(field, sample, subsample, acclima_soil_ec_bulk, organic_matter)
# correlation corn
correlation_corn <-cor(corn$acclima_soil_ec_bulk,corn$organic_matter)
print(correlation_corn)
ggplot(corn, aes(x = acclima_soil_ec_bulk, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC in Corn", x = "Bulk EC", y = "Soil Organic Matter (%)")
# correlation soy
correlation_soy <-cor(soy$acclima_soil_ec_bulk, soy$organic_matter)
print(correlation_soy)
ggplot(soy, aes(x = acclima_soil_ec_bulk, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC in Soy", x = "Bulk EC", y = "Soil Organic Matter (%)")
# correlation turf
correlation_turf <-cor(turf$acclima_soil_ec_bulk, turf$organic_matter)
print(correlation_turf)
ggplot(turf, aes(x = acclima_soil_ec_bulk, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC in Turf", x = "Bulk EC", y = "Soil Organic Matter (%)")
