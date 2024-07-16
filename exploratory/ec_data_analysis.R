library(tidyverse)
library(readr)
library(readxl)
data <- read_excel(r"(C:\Users\rtjor\Downloads\soar_reeu\som_ec_nsf_reeu\preprocessed\ec_data.xlsx)")
#box plots of field versus each dependent variable
ggplot(data, aes(x = field, y = acclima_soil_ec_bulk, fill = factor(field))) +
  geom_boxplot() +
  labs(title = "Boxplot of Bulk EC by Field Type",
       x = "Field Type",
       y = "Bulk EC") +
  theme_minimal()
ggplot(data, aes(x = field,y = acclima_soil_ec_pore, fill = factor(field))) + 
  geom_boxplot() +
  labs(title = "Boxplot of Pore EC by Field Type" ,
       x = "Field Type",
       y = "Pore EC") +
    theme_minimal()
ggplot(data, aes(x = field, y= acclima_soil_permitivity, fill = factor(field))) +
  geom_boxplot() +
  labs(title = "Boxplot of Soil Permitivity by Field Type",
       x = "Field Type",
       y = "Soil Permitivity") +
      theme_minimal()
ggplot(data, aes(x = field, y = acclima_soil_temperature, fill = factor(field))) +
  geom_boxplot() +
  labs(title = "Boxplot of Soil Temp by Field Type",
       x = "Field Type",
       y = "Soil Temperature") +
  theme_minimal()
ggplot(data, aes(x = field, y = acclima_soil_vwc, fill = factor(field))) +
  geom_boxplot() +
  labs(title = "Boxplot of Volumetric Water Content by Field Type",
       x = "Field Type",
       y = "Volumetric Water Content") +
  theme_minimal()
install.packages(c("ggpubr", "broom", "AICcmodavg"))
glimpse(data)
class(data $field)
data$field <- as.factor(data$field)
class(data$sample)
data$sample <- as.factor(data$sample)
glimpse(data)
library(dplyr)
ec_data <- data %>%
  select(field, sample, subsample, acclima_soil_ec_bulk)
glimpse(ec_data)
summary(ec_data)
#one way annova with field versus ec_bulk
anova_result <- aov(acclima_soil_ec_bulk~ field, data = ec_data)
summary(anova_result)
# Fit linear model
lm_model <- lm(acclima_soil_ec_bulk ~ field, data = ec_data)
anova_table <- anova(lm_model)
#two way annova with field and sample versus ec_bulk
two.way <- aov(acclima_soil_ec_bulk ~ field + sample, data = ec_data)
summary(two.way)
# Fit linear model two
lm_model_two <- lm(acclima_soil_ec_bulk ~ field + sample, data = ec_data)
anova_table_two <- anova(lm_model_two)
# violin plot of field versus each dependent variable
ggplot(data, aes(x = field, y = acclima_soil_ec_bulk, fill = field)) +
  geom_violin(trim = FALSE, scale = "width") +
  geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1.0) +
  labs(title = "Violin Plot of Bulk EC by Field", x = "Field Type", y = "Bulk EC")
ggplot(data, aes(x = field, y = acclima_soil_ec_pore, fill = field)) +
  geom_violin(trim = FALSE, scale = "width") +
  geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1.0) +
  labs(title = "Violin Plot of Pore EC by Field", x = "Field Type", y = "Pore EC")
ggplot(data, aes(x = field, y = acclima_soil_permitivity, fill = field)) +
  geom_violin(trim = FALSE, scale = "width") +
  geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1.0) +
  labs(title = "Violin Plot of Permitivity by Field", x = "Field Type", y = "Permitivity")
ggplot(data, aes(x = field, y = acclima_soil_temperature, fill = field)) +
  geom_violin(trim = FALSE, scale = "width") +
  geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1.0) +
  labs(title = "Violin Plot of Soil Temp by Field", x = "Field Type", y = "Soil Temperature")
ggplot(data, aes(x = field, y = acclima_soil_vwc, fill = field)) +
  geom_violin(trim = FALSE, scale = "width") +
  geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 1.0) +
  labs(title = "Violin Plot of Volumetric Water Content by Field", x = "Field Type", y = "Soil VWC")
