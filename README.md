---
title: "README"
output: html_document
date: "2024-07-18"
---
# **Project Title:** Real-time Soil Health Sensing: Soil Permittivity and Soil Organic Matter Correlation in Annual Tilled Crops Versus Perennial Turf


## **Project Description:** 
This project was built in the interest of further understanding the validity of permittivity sensor data as a surrogate for soil organic matter mass percent in agricultural land as the number of farmers interested in more efficient, environmentally conscious management practices increases. It contains the data files and code associated with the data analysis and visualization for soil permittivity correlation with soil organic matter at the University of Minnesota St. Paul Campus. This project was funded by the NSF sponsored SOAR-REEU program in partnership with Runck lab and GEMS Informatics. 

1. **Folder:** raw

  A. **Filename:** *ec_raw_data.csv*
  	
   CSV file that contains raw data of time and date of Acclima TDR 315H sensor readings of soil electrical conductivity, permittivity, temperature, volumetric water content in 60 second intervals 
 
  B. **Filename:** *soil_report.pdf*
  	
   A pdf file sent via email by Soil Testing Laboratory at UMN St. Paul campus that provides estimated soil texture, soil organic matter, phosphorous, and potassium levels for each sample location
      
2. **Folder:** preprocessed

  A. **Filename:** *ec_data.xlsx*
  	
   CSV file containing time and date of Acclima TDR 315 sensor electrical conductivity, permittivity, temperature, volumetric water content data within sample ranges with corresponding coordinates, field type, sample and subsample number
 
  B. **Filename:** *som_data.xlsx*
  	
   An excel table that includes the relevant information pertaining to the experiment which includes the field, sample, organic matter measured in mass percent, and level in terms of low, medium and high

3. **Folder:** analysis_ready

  A. **Filename:** *som_ec_data.xlsx*
  	
   The two files in the preprocessed folder combined into one table

4. **Folder:** exploratory
    
  A. **Filename:** *ec_data_analysis.R*
  	
   Code written in RStudio that creates boxplots for each dependent variable versus field, one-way ANOVA with field versus ec_bulk, and two-way ANOVA with field, sample, and ec_bulk
      
  B. **Filename:** *som_ec_analysis.R*
  
  Code written to RStudio that analyzes SOM and permittivity data with regression lines and two way ANOVA

5. **Folder:** results

  A. **Folder:** images_and_graphics

  Folder that contains plots and graphs corresponding to variables measured and field type 

  B. **Filename:** README

  Markdown file that contains descriptions and images of results 
  
    
**Relationship between files:**        
Files in the *preprocessed* folder are cleaned datasets for SOM and permittivity containing measurements from the *raw* folder that are pertinent to the experiment. The file in the *analysis_ready* folder is a dataset created by combining the files in the *preprocessed* folder. Files in the *exploratory* folder are code written for the process of exploratory data visualization and analysis.   

# Other Resources
- [Main project Google Drive folder](https://drive.google.com/drive/folders/1-ZpFsM2tPaxNaNnNS-6vKggXL9pEBzZs)

# Acknowledgements
## **Introduction**
This section is to ackowledge the organizations and individuals who contributed time, knowledge, money, and moral support for this 10-week project. 

## **Contributors**
* Samikshya Subedi - Graduate Student/Mentor - Department of Soil, Water, and Climate

  Allowed use of her plots for this project. Provided guidance for project methodology, ArcGIS Pro, coding, and poster design. Helped execute protocol in corn plot.

* Bobby Schulz - Lead Engineer - GEMS Informatics

  Created V3 Logger used for this project. Provided guidance for proposal, methodology, data analysis, Github, and poster design. Helped execute protocol in corn/soy plot.

* Ann Piotrowski - Lab Manager - GEMS Informatics

  Showed me how to use the sensor and logger for this project. Provided guidance on project proposal, data cleaning, and poster design. Helped execute protocol in turf plot.

* Bryan Runck - Primary Investigator - GEMS Informatics

  Supervised the development of this project. Provided guidance on project proposal, methodology, data analysis, and poster design.

## **Organizations**
* GEMS Informatics/Runck - Hosting Lab

  Contibuted supplies, technology, labor, and funding to this 10-week project.

* CFANS - Hosting College

  Hosted and supported all undergraduate interns in the SOAR-REEU program

* SOAR-REEU

  Provided funding, transportation and education

## **Special Thanks**
Thank you to Logan Gall for helping with code review, data analysis, and Github. 
  
  

   
