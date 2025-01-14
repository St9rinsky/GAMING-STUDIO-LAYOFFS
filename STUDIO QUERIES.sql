SELECT *
FROM [gaming layoffs pt2];

--How many unique studios were affected

SELECT COUNT (DISTINCT [Studio]) AS [total number of studios]
FROM [gaming layoffs pt2];

--How many layoffs in total were there

SELECT SUM([Headcount]) AS [total number of layoffs]
FROM [gaming layoffs pt2];

--How many total layoffs per country

SELECt [Studio Location],SUM([Headcount]) AS [total layoffs]
FROM [gaming layoffs pt2]
GROUP BY [Studio Location]
ORDER BY [Studio Location];

--Average layoff per company in a country

WITH [layoffs ratio] AS
(
SELECT [Studio Location],COUNT([Studio]) AS [total studios], SUM([Headcount]) AS [total layoffs]
FROM [gaming layoffs pt2]
GROUP BY [Studio Location]
)
SELECT [studio location],(ROUND(([total layoffs]/[total studios]),0)) AS [layoffs ratio]
FROM [layoffs ratio]
ORDER BY [Studio Location];

--Which studio type had the highest amount of layoffs

SELECT [Type], SUM([Headcount]) AS [Studio type layoffs]
FROM [gaming layoffs pt2]
GROUP BY [type];

--Percentage contribution to the total layoffs by parent company

SELECT [Parent],(SUM([headcount])/32071)*100 AS [% contribution of layoffs by parent company]
FROM [gaming layoffs pt2]
GROUP BY [Parent]
ORDER BY 2 DESC;

--Layoffs by date

SELECT [date],SUM([headcount]) AS [ Total layoffs]
FROM [gaming layoffs pt2]
GROUP BY date
ORDER BY 1 ASC;