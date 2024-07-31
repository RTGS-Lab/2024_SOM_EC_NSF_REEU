#load libraries 
library(tidyverse)
library(readxl)
library(car)
library(ggplot2)
library(readr)
library(dplyr)

#load analysis_ready dataset
som_ec_data <- read_excel(r"(C:\Users\rtjor\Downloads\soar_reeu\som_ec_nsf_reeu\analysis_ready\som_ec_data.xlsx)")

#create seperate tables for corn, soy, and turf
corn <- som_ec_data %>%
  filter(field=="Corn")  %>%
  select(field, sample, subsample, acclima_soil_ec_bulk, acclima_soil_ec_pore,organic_matter)
soy <- som_ec_data %>% 
  filter(field=='Soy') %>% 
  select(field, sample, subsample, acclima_soil_ec_bulk,acclima_soil_ec_pore, organic_matter)
turf <- som_ec_data %>% 
  filter(field=="Turf")  %>%
  select(field, sample, subsample, acclima_soil_ec_bulk,acclima_soil_ec_pore,organic_matter)

# box plot of field and SOM
ggplot(som_ec_data, aes(x = field,y = organic_matter, fill = field)) + 
  geom_boxplot() + 
  labs(title = "Soil Organic Matter by Field Type", x = "Field Type", y = "Organic Matter (%)") +
  theme_minimal()

# box plot Bulk EC and SOM
ggplot(som_ec_data, aes(x = field, y= acclima_soil_ec_bulk, fill = factor(field))) +
  geom_boxplot() +
  labs(title = "Boxplot of Soil Bulk EC by Field Type",
       x = "Field Type",
       y = "Soil EC") +
  theme_minimal()

#checking correlation value between Bulk EC and SOM 
head(som_ec_data)
correlation <-cor(som_ec_data$acclima_soil_ec_bulk,som_ec_data$organic_matter)
print(correlation)

#plot for correlation between Bulk EC and SOM
ggplot(som_ec_data, aes(x = acclima_soil_ec_bulk, y = organic_matter, color = field, group = 1)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC", x = "Bulk EC", y = "Soil Organic Matter (%)")

#correlation corn organic matter and bulk ec
correlation_corn <-cor(corn$acclima_soil_ec_bulk,corn$organic_matter)
print(correlation_corn)
ggplot(corn, aes(x = acclima_soil_ec_bulk, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC in Corn", x = "Bulk EC", y = "Soil Organic Matter (%)")

#correlation soy organic matter and bulk ec
correlation_soy <-cor(soy$acclima_soil_ec_bulk, soy$organic_matter)
print(correlation_soy)
ggplot(soy, aes(x = acclima_soil_ec_bulk, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC in Soy", x = "Bulk EC", y = "Soil Organic Matter (%)")

#correlation turf organic matter and bulk ec
correlation_turf <-cor(turf$acclima_soil_ec_bulk, turf$organic_matter)
print(correlation_turf)
ggplot(turf, aes(x = acclima_soil_ec_bulk, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Bulk EC in Turf", x = "Bulk EC", y = "Soil Organic Matter (%)")

#two way anova between Bulk EC, SOM, field 
two.way <- aov(organic_matter ~ acclima_soil_ec_bulk + field, data = som_ec_data)
summary(two.way)

#checking correlation value between EC Pore and SOM
correlation_pore <-cor(som_ec_data$acclima_soil_ec_pore,som_ec_data$organic_matter)
print(correlation_pore)

#plot for correlation between Pore EC and SOM 
ggplot(som_ec_data, aes(x = acclima_soil_ec_pore, y = organic_matter, color = field, group = 1)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Pore EC", x = "Pore EC", y = "Soil Organic Matter (%)")

#correlation corn organic matter and pore ec
correlation_corn_pore <-cor(corn$acclima_soil_ec_pore, corn$organic_matter)
print(correlation_corn_pore)
ggplot(corn, aes(x = acclima_soil_ec_pore, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Pore EC in Corn", x = "Pore EC", y = "Soil Organic Matter (%)")

#correlation soy organic matter and pore ec
correlation_soy_pore <-cor(soy$acclima_soil_ec_pore, soy$organic_matter)
print(correlation_soy_pore)
ggplot(soy, aes(x = acclima_soil_ec_pore, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Pore EC in Soy", x = "Pore EC", y = "Soil Organic Matter (%)")

#correlation turf organic matter and pore ec
correlation_turf_pore <-cor(turf$acclima_soil_ec_pore, turf$organic_matter)
print(correlation_turf_pore)
ggplot(turf, aes(x = acclima_soil_ec_pore, y = organic_matter)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and Pore EC in Turf", x = "Pore EC", y = "Soil Organic Matter (%)")

#box plot permittivity and field
ggplot(som_ec_data, aes(x = field, y = acclima_soil_permitivity, fill = field)) +
  geom_boxplot() +
  labs(title = "Permittivity by Field Type",
       x = "Field Type",
       y = "Permittivity") +
  theme_minimal()

#checking correlation value between Permittivity and SOM 
correlation_perm <-cor(som_ec_data$acclima_soil_permitivity,som_ec_data$organic_matter)
print(correlation_perm)

#plot for correlation between Permittivity and SOM
ggplot(som_ec_data, aes(x = acclima_soil_permitivity, y = organic_matter, color = field, group = 1)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Correlation of Permittivity and SOM", x = "Permittivity", y = "Soil Organic Matter (%)") +
  theme_minimal()

#anova between SOM, and field
anova_som <- aov(organic_matter ~field, data = som_ec_data)
summary(anova_som)
TukeyHSD(anova_som)

#anova between permittivity, SOM, and field
anova_perm <- aov(acclima_soil_permitivity ~field, data = som_ec_data)
summary(anova_perm)
TukeyHSD(anova_perm)

#checking correlation value between temperature and SOM 
correlation_temp <-cor(som_ec_data$acclima_soil_temperature,som_ec_data$organic_matter)
print(correlation_temp)

#plot for correlation between temperature and SOM
ggplot(som_ec_data, aes(x = acclima_soil_temperature, y = organic_matter, color = field, group = 1)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Comparison of SOM and Temperature", x = "Temperature", y = "Soil Organic Matter (%)") 

#checking correlation value between vwc and SOM
correlation_vwc <-cor(som_ec_data$acclima_soil_vwc,som_ec_data$organic_matter)
print(correlation_vwc)

#plot of correlation value between VWC and SOM
ggplot(som_ec_data, aes(x = acclima_soil_vwc, y = organic_matter, color = field, group = 1)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Regression plot of SOM and VWC", x = "VWC", y = "Soil Organic Matter (%)")

#multiple regression model
colnames(som_ec_data)
model = lm(organic_matter ~ acclima_soil_ec_bulk +
                            acclima_soil_permitivity +
                            acclima_soil_ec_pore +
                            acclima_soil_vwc +
                            acclima_soil_temperature +
                            field,
                            
           data = som_ec_data)
summary(model)

### MODEL DIAGNOSTICS
plot(model,1)

ggplot(som_ec_data, aes(x = acclima_soil_permitivity, 
                        y = organic_matter, color = field, group = 1 )) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Correlation of SOM and Permittivity", 
       x = "Permittivity", y = "Soil Organic Matter (%)") +
theme_minimal()




