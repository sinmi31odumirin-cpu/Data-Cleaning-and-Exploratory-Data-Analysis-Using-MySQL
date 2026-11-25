# Data Cleaning and Exploratory Data Analysis (EDA) Using MySQL
Project Overview

This project focuses on data cleaning, preparation and exploratory data analysis using Microsoft Excel and MySQL. The dataset was initially imported from Excel into MySQL, where it was inspected, cleaned, validated and transformed to improve data quality and ensure consistency before conducting exploratory analysis.

Project Objectives

Inspect and understand the structure of the raw dataset.

Identify missing values, duplicate records and data inconsistencies.

Clean and standardize records to improve data accuracy.

Organize and prepare the dataset for analysis.

Explore the cleaned dataset to identify patterns, trends and meaningful insights.

Tools Used

Microsoft Excel – Initial dataset handling and data inspection.

MySQL – Data cleaning, transformation, validation and exploratory analysis.


Project Workflow

1. Data Importation and Inspection

Imported the raw dataset from Microsoft Excel into MySQL.

Examined the dataset structure, columns and data types.

Inspected records to identify potential data quality issues.


2. Data Cleaning

Identified and handled missing and NULL values.

Checked for and removed duplicate records where appropriate.

Corrected data inconsistencies.

Standardized data formats and entries.

Prepared the cleaned dataset for further analysis.


3. Exploratory Data Analysis

Explored the cleaned dataset using SQL queries.

Examined relevant distributions and patterns.

Used aggregate functions and other SQL operations to investigate the data.

Extracted insights from the available records.

Repository Structure

Dataset/ – Original and cleaned datasets.

SQL/ – SQL scripts for data cleaning and exploratory analysis.

Images/ – Screenshots documenting the project workflow and results.



Key Findings According to the dataset
The exploratory data analysis revealed several patterns in company layoffs across different years and industries.

1. Yearly Layoff Trends

2022 recorded the highest number of layoffs, with 160,661 employees affected.

2023 followed with 125,677 layoffs.

2020 recorded 80,998 layoffs, while 2021 had the lowest total among the four years, with 15,823.

2. Layoffs by Industry

The Consumer industry recorded the highest layoffs, with 45,182.

Retail followed with 43,613, while the Other category recorded 36,289.

Transportation and Finance also recorded significant layoffs, with 33,748 and 28,344, respectively.

3. Companies with the Highest Layoffs

The top five companies with the highest layoffs were identified for each year:

2020: Uber ranked first with 7,525 layoffs.

2021: Bytedance ranked first with 3,600 layoffs.

2022: Meta ranked first with 11,000 layoffs.

2023: Google ranked first with 12,000 layoffs.

4. Data Quality Observation

The yearly analysis also returned 500 layoffs with a NULL date value. These records could not be assigned to a specific year, highlighting the importance of identifying and handling missing values during data cleaning.

Conclusion

The analysis identified differences in layoff patterns across years, industries, and individual companies. SQL aggregation, Common Table Expressions (CTEs), window functions, and ranking techniques were used to explore the dataset and extract meaningful insights.


Conclusion

This project provided practical experience in importing, cleaning, validating, organizing and analyzing structured data using Excel and MySQL. It demonstrates the importance of data quality and proper data management in producing reliable analytical results.
