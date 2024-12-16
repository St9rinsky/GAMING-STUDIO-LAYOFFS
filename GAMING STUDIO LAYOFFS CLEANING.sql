/*
1.data cleaning
2.data standardisation
*/

--gaming layoffs for 2022 data cleaning--

SELECT *
FROM [Gaming layoffs 2022]

DELETE
FROM [Gaming layoffs 2022]
WHERE Headcount = ' '

SELECT *
FROM [Gaming layoffs 2022]
WHERE Studio like ' %'

UPDATE [Gaming layoffs 2022]
SET Studio = LTRIM (studio)

update [Gaming layoffs 2022]
SET Parent = LTRIM (parent)

SELECT DISTINCT [type]
FROM [Gaming layoffs 2022]

UPDATE [Gaming layoffs 2022]
SET [Type] = LTRIM ([Type])

SELECT DISTINCT [studio location]
FROM [Gaming layoffs 2022]

SELECT *
FROM [Gaming layoffs 2022]
WHERE [studio location]  like '%England%'

UPDATE [Gaming layoffs 2022]
SET [Studio Location] = 'England'
WHERE [Studio Location] like '%England%'

SELECT DISTINCT [parent location]
FROM [Gaming layoffs 2022]

SELECT *
FROM [Gaming layoffs 2022]
WHERE [parent location]  like '%Israel%'

UPDATE [Gaming layoffs 2022]
SET [Parent Location]= 'Israel'
WHERE [parent Location] like '%Israel%'

--gaming layoffs for 2023 data cleaning--

SELECT *
FROM [gaming layoffs 2023]
WHERE Headcount = ' '

SELECT *
FROM [gaming layoffs 2023]
WHERE [type] = ' %'

SELECT *
FROM [gaming layoffs 2023]
WHERE studio like ' %' or
	  parent like ' %' or 
	  type like ' %' or 
	  [Studio Location] like ' %' or
	  [Parent Location] like ' %'

UPDATE [gaming layoffs 2023]
SET studio = LTRIM (studio)

UPDATE [gaming layoffs 2023]
SET parent = LTRIM (parent)

UPDATE [gaming layoffs 2023]
SET type = LTRIM (type)

UPDATE [gaming layoffs 2023]
SET [studio location] = LTRIM ([studio location])

UPDATE [gaming layoffs 2023]
SET [parent location] = LTRIM ([parent location])

--gaming layoffs 2024 data cleaning--

SELECT *
FROM [gaming layoffs 2024]

SELECT *
FROM  [gaming layoffs 2024]
WHERE Headcount = ' '

UPDATE [gaming layoffs 2024]
SET studio = LTRIM (studio)

UPDATE [gaming layoffs 2024]
SET parent = LTRIM (parent)

UPDATE [gaming layoffs 2024]
SET type = LTRIM (type)

UPDATE [gaming layoffs 2024]
SET [studio location] = LTRIM ([studio location])

UPDATE [gaming layoffs 2024]
SET [parent location] = LTRIM ([parent location])

--now to merge all the layoffs into a single table--

SELECT *
INTO [Gaming studio layoffs]
FROM
(
SELECT *
FROM [Gaming layoffs 2022]
UNION all
SELECT *
FROM [gaming layoffs 2023]
UNION all
SELECT*
FROM [gaming layoffs 2024]
) GSL;

SELECT *
FROM [Gaming studio layoffs]

--gaming studio layoffs data cleaning--

SELECT *
FROM [Gaming studio layoffs]
ORDER BY 1

SELECT *
FROM [Gaming studio layoffs] GSL1
JOIN [Gaming studio layoffs] GSL2
ON GSL1.studio = GSL2.Studio
AND GSL1.type = GSL2.type
WHERE GSL1.[Studio Location] = ' '
AND GSL2.[Studio Location] != ' ' 

UPDATE GSL1
SET [studio location] = GSL2.[studio location]
FROM [Gaming studio layoffs] GSL1
JOIN [Gaming studio layoffs] GSL2
    ON GSL1.studio = GSL2.studio
   AND GSL1.type = GSL2.type
WHERE GSL1.[studio location] = ' '
  AND GSL2.[studio location] != ' ';

SELECT *
FROM [Gaming studio layoffs] GSL1
JOIN [Gaming studio layoffs] GSL2
ON GSL1.studio = GSL2.Studio
AND GSL1.[Parent Location] = GSL2.[Parent Location]
WHERE GSL1.[Parent] = ' '
AND GSL2.[Parent] != ' ' 

UPDATE GSL1
SET [Parent] = GSL2.[Parent]
FROM [Gaming studio layoffs] GSL1
JOIN [Gaming studio layoffs] GSL2
    ON GSL1.studio = GSL2.studio
   AND GSL1.[Parent Location] = GSL2.[Parent Location]
WHERE GSL1.[Parent] = ' '
  AND GSL2.[Parent] != ' ';

---THE TABLE WAS TRANSFERRED TO M EXCEL FOR FURTHER PROCESSING--

--THE TABLE WAS BROUGHT BACK TO SQL FOR FURTHER CLEANING--

SELECT *
FROM [Gaming layoffs pt2]

UPDATE [gaming layoffs pt2]
SET [parent location] = null
WHERE [parent location] = '' AND [parent] = 'independent'

SELECT DISTINCT [parent location]
FROM [Gaming layoffs pt2]


UPDATE [gaming layoffs pt2]
SET [parent location] = 'Canada'
WHERE [parent location] = 'british columbia'

UPDATE [gaming layoffs pt2]
SET [parent location] = 'United Kingdom'
WHERE [parent location] = 'England'

SELECT DISTINCT [studio location]
FROM [Gaming layoffs pt2]

UPDATE [gaming layoffs pt2]
SET [studio location] = 'United States'
WHERE [studio location] IN ( 'Arizona' , 'california' , 'colorado' , 'florida' , 'idaho' , 'illinois' , 
						  'los angeles' , 'lousiana' , 'maryland' , 'massachusetts' , 'minneapolis' ,
						  'nevada' , ' New York' , 'north carolina' , 'oregon' , 'texas' , ' washington' ,
						  'washington state')

UPDATE [gaming layoffs pt2]
SET [studio location] = 'Canada'
WHERE [studio location] IN ( 'Alberta' , 'British columbia', 'montreal' , 'ontario' , 'ottawa' , 'quebec')

UPDATE [gaming layoffs pt2]
SET [studio location] = 'poland'
WHERE [studio location] = 'wroclaw'

UPDATE [gaming layoffs pt2]
SET [studio location] = 'United States'
WHERE [studio location] = 'washington'



