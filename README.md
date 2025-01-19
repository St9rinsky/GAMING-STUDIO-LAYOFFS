# Power BI | GAMING INDUSTRY LAYOFFS

![image](https://github.com/user-attachments/assets/6cd6f0c4-6829-48ae-90fc-2a0f8e33ac70)

## SUMMARY
This is a mini data analysis and dashboard of layoffs in the gaming industry during the period of 2022 to 2024, the data was obtained from a data scraping website from Obsidian. the data was analysed using Ms SQL and Power Bi to create the dashboard.

## The dashboard answers the following business questions

1. How is the layoff distrution over time?
2. Which parent companies Experinced the highest amount of layoffs?
3. Which regions Experinced the highest amount of layoffs and what is the ratio distribution?
4. What is the Percentage contribution of layoffs by the type of Studio?

 ## I took the following steps to create the dashboard
1. Downloaded 3 sets of the .csv data by year from Obsidian website.
2. Imported the three .csv into MSSQL server.
3. Cleaned and updated the raw data.
4. Used JOins,Unions and CTE's for combining and normalising the data into a single table.
5. Imported thhe data into Ms Excel for fine tuning the few and missing critical values.
6. Imported the clean data into MS SQL server to conduct exploratory data analysis.
7. Imported the complete clean data into Power bI to visualisation some of the findings from the EDA.
8. Published everything on Github.
   
## Dashboard Breakdown
  * The dashboard is fully interactable
  * The Filters are dependent on each other and change according to selection
     
## Limitations
  * Some records had missing critical information and were excluded from the queries
  * Records for the year 2024 were incomplete for the last months as the data was obtained during 2024
