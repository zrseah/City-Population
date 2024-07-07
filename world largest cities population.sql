# check for nulls 
SELECT 
	`populationdf`.`City`,
    `populationdf`.`Country`,
    `populationdf`.`Population (2024)` AS Population_2024,
    `populationdf`.`Population (2023)`AS Population_2023,
    `populationdf`.`Growth Rate`
FROM 
	`worldcitypopulation`.`populationdf`
WHERE
  `populationdf`.`Population (2023)` IS NULL OR `populationdf`.`Population (2024)` IS NULL OR `populationdf`.`Growth Rate` IS NULL;

# Check for non unique cities 
SELECT
  `populationdf`.`City`, 
  COUNT(*) AS count
FROM
  `worldcitypopulation`.`populationdf`
GROUP BY 
  `populationdf`.`City`
HAVING 
  COUNT(*) > 1;

# Identify the corresponding countries of these cities 
SELECT
  `populationdf`.`City`, 
  `populationdf`.`Country`
FROM 
  `worldcitypopulation`.`populationdf`
WHERE `populationdf`.`City` IN ("Suzhou", "Valencia", "San Jose", "Hyderabad");

# Rename cities 
## Disable MYSQL safe update mode
SET SQL_SAFE_UPDATES = 0;

UPDATE `worldcitypopulation`.`populationdf`
SET `populationdf`.`City` = 'Valencia (Spain)'
WHERE `populationdf`.`Country` = 'Spain' AND `populationdf`.`City`= 'Valencia';

UPDATE `worldcitypopulation`.`populationdf`
SET `populationdf`.`City` = 'Valencia (Venezuela)'
WHERE `populationdf`.`Country` = 'Venezuela' AND `populationdf`.`City`= 'Valencia';

UPDATE `worldcitypopulation`.`populationdf`
SET `populationdf`.`City` = 'San Jose (United States)'
WHERE `populationdf`.`Country` = 'United States' AND `populationdf`.`City`= 'San Jose';

UPDATE `worldcitypopulation`.`populationdf`
SET `populationdf`.`City` = 'San Jose (Costa Rica)'
WHERE `populationdf`.`Country` = 'Costa Rica' AND `populationdf`.`City`= 'San Jose';

UPDATE `worldcitypopulation`.`populationdf`
SET `populationdf`.`City` = 'Hyderabad (Pakistan)'
WHERE `populationdf`.`Country` = 'Pakistan' AND `populationdf`.`City`= 'Hyderabad';

UPDATE `worldcitypopulation`.`populationdf`
SET `populationdf`.`City` = 'Hyderabad (India)'
WHERE `populationdf`.`Country` = 'India' AND `populationdf`.`City`= 'Hyderabad';

# city that has the highest population in 2023
SELECT 
	`populationdf`.`City`,
    `populationdf`.`Country`,
    `populationdf`.`Population (2024)` AS Population_2024,
    `populationdf`.`Population (2023)` AS Population_2023,
    `populationdf`.`Growth Rate`
FROM 
	`worldcitypopulation`.`populationdf`
ORDER BY 
	`populationdf`.`Population (2023)` DESC;

# city that has the highest population in 2024
SELECT 
	`populationdf`.`City`,
    `populationdf`.`Country`,
    `populationdf`.`Population (2024)` AS Population_2024,
    `populationdf`.`Population (2023)` AS Population_2023,
    `populationdf`.`Growth Rate`
FROM 
	`worldcitypopulation`.`populationdf`
ORDER BY 
	`populationdf`.`Population (2024)` DESC;
    
# City that has the highest growth rate 
SELECT 
	`populationdf`.`City`,
    `populationdf`.`Country`,
    `populationdf`.`Population (2024)` AS Population_2024,
    `populationdf`.`Population (2023)` AS Population_2023,
    `populationdf`.`Growth Rate`
FROM 
	`worldcitypopulation`.`populationdf`
ORDER BY 
	`populationdf`.`Growth Rate` DESC;
    
# City that has the lowest growth rate 
SELECT 
	`populationdf`.`City`,
    `populationdf`.`Country`,
    `populationdf`.`Population (2024)` AS Population_2024,
    `populationdf`.`Population (2023)` AS Population_2023,
    `populationdf`.`Growth Rate`
FROM 
	`worldcitypopulation`.`populationdf`
ORDER BY 
	`populationdf`.`Growth Rate` ASC;
    
# Country that has the highest growth rate 
SELECT 
    `populationdf`.`Country`,
     SUM(`populationdf`.`Population (2024)`) AS Population_2024,
     SUM(`populationdf`.`Population (2023)`) AS Population_2023,
     round((SUM(`populationdf`.`Population (2024)`)-SUM(`populationdf`.`Population (2023)`))/SUM(`populationdf`.`Population (2023)`), 4) AS Growth_rate 
FROM 
	`worldcitypopulation`.`populationdf`
GROUP BY
	`populationdf`.`Country`
ORDER BY 
	Growth_rate DESC;
    
# Country that has the lowest growth rate 
SELECT 
    `populationdf`.`Country`,
     SUM(`populationdf`.`Population (2024)`) AS Population_2024,
     SUM(`populationdf`.`Population (2023)`) AS Population_2023,
     round((SUM(`populationdf`.`Population (2024)`)-SUM(`populationdf`.`Population (2023)`))/SUM(`populationdf`.`Population (2023)`), 4) AS Growth_rate 
FROM 
	`worldcitypopulation`.`populationdf`
GROUP BY
	`populationdf`.`Country`
ORDER BY 
	Growth_rate ASC;

# Number of citites in each country 
SELECT 
    `populationdf`.`Country`,
    COUNT(DISTINCT(`populationdf`.`City`)) AS number_of_cities
FROM 
	`worldcitypopulation`.`populationdf`
GROUP BY 
	`populationdf`.`Country`
ORDER BY 
	number_of_cities DESC;



    
   