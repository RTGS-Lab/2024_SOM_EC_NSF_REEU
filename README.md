---
title: "README"
output: html_document
date: "2024-07-18"
---
# **Project Title:** Real-time Soil Health Sensing: Soil Permittivity and Soil Organic Matter Correlation in Annual Tilled Crops Versus Perennial Turf


## **Project Description:** This project was built in the interest of further understanding the validity of permittivity sensor data as a surrogate for soil organic matter mass percent in agricultural land as the number of farmers interested in more efficient, environmentally conscious management practices increases. It contains the data files and code associated with the data analysis and visualization for soil permittivity correlation with soil organic matter at the University of Minnesota St. Paul Campus. This project was funded by the NSF sponsored SOAR-REEU program in partnership with Runck lab and GEMS Informatics. 

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
    
**Relationship between files:**        
Files in the *preprocessed* folder are cleaned datasets for SOM and permittivity containing measurements from the *raw* folder that are pertinent to the experiment. The file in the *analysis_ready* folder is a dataset created by combining the files in the *preprocessed* folder. Files in the *exploratory* folder are code written for the process of exploratory data visualization and analysis.   

# Other Resources
- [Main project Google Drive folder](https://drive.google.com/drive/folders/1-ZpFsM2tPaxNaNnNS-6vKggXL9pEBzZs)

# Acknowledgements

