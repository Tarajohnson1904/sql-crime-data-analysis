-- Crime Data Analysis using SQL
-- Author: Tara Johnson

-- 1. Retrieve all theft-related crimes
SELECT * 
FROM crime_data
WHERE Category = 'Theft';


-- 2. Count total number of crimes
SELECT COUNT(*) AS total_crimes
FROM crime_data;


-- 3. Count crimes by category
SELECT Category, COUNT(*) AS crime_count
FROM crime_data
GROUP BY Category;


-- 4. Number of arrested offenders
SELECT COUNT(*) AS arrested_count
FROM crime_data
WHERE Offender_Status = 'ARRESTED';


-- 5. Crimes involving male offenders
SELECT *
FROM crime_data
WHERE Offender_Gender = 'MALE';


-- 6. Average offender age by gender
SELECT Offender_Gender, AVG(Offender_Age) AS avg_age
FROM crime_data
GROUP BY Offender_Gender;


-- 7. Crimes where victim is female
SELECT *
FROM crime_data
WHERE Victim_Gender = 'FEMALE';


-- 8. Crimes with non-fatal victims
SELECT *
FROM crime_data
WHERE Victim_Fatal_Status = 'Non-fatal';


-- 9. Crimes reported as supplemental reports
SELECT *
FROM crime_data
WHERE Report_Type = 'Supplemental Report';


-- 10. Insert a sample record
INSERT INTO crime_data (
    Disposition,
    Offender_Status,
    Offender_Race,
    Offender_Gender,
    Offender_Age,
    Person_Type,
    Victim_Race,
    Victim_Gender,
    Victim_Age,
    Victim_Fatal_Status,
    Report_Type,
    Category
)
VALUES (
    'CLOSED',
    'ARRESTED',
    'WHITE',
    'MALE',
    32,
    'OFFENDER',
    'BLACK',
    'FEMALE',
    28,
    'Non-fatal',
    'Initial Report',
    'Theft'
);


-- 11. Crimes where offender age is above 40
SELECT *
FROM crime_data
WHERE Offender_Age > 40;


-- 12. Victims younger than 18
SELECT *
FROM crime_data
WHERE Victim_Age < 18;


-- 13. Category-wise average offender age
SELECT Category, AVG(Offender_Age) AS avg_offender_age
FROM crime_data
GROUP BY Category;


-- 14. Top 3 most common crime categories
SELECT Category, COUNT(*) AS total
FROM crime_data
GROUP BY Category
ORDER BY total DESC
LIMIT 3;


-- 15. Crimes where offender and victim race are the same
SELECT *
FROM crime_data
WHERE Offender_Race = Victim_Race;


-- 16. Arrested offenders with non-fatal victims
SELECT *
FROM crime_data
WHERE Offender_Status = 'ARRESTED'
AND Victim_Fatal_Status = 'Non-fatal';


-- 17. Crimes where offender age is between 25 and 40
SELECT *
FROM crime_data
WHERE Offender_Age BETWEEN 25 AND 40;


-- 18. Crimes where victim age is above average
SELECT *
FROM crime_data
WHERE Victim_Age >
(
    SELECT AVG(Victim_Age)
    FROM crime_data
);


-- 19. Delete a specific row
DELETE FROM crime_data
WHERE Offender_Status = 'ARRESTED'
AND Offender_Age = 45;


-- 20. Sum of offender ages for theft crimes
SELECT SUM(Offender_Age) AS theft_offender_age_sum
FROM crime_data
WHERE Category = 'Theft';


-- 21. Self join example (same crime category)
SELECT A.Category, A.Offender_Age, B.Victim_Age
FROM crime_data A
JOIN crime_data B
ON A.Category = B.Category;


-- 22. Self join based on race
SELECT A.Category, A.Offender_Race, B.Victim_Race
FROM crime_data A
JOIN crime_data B
ON A.Offender_Race = B.Victim_Race;


-- 23. Categories with more than 50 crimes
SELECT Category, COUNT(*) AS total_cases
FROM crime_data
GROUP BY Category
HAVING COUNT(*) > 50;


-- 24. Offender races with more than 30 cases
SELECT Offender_Race, COUNT(*) AS total_cases
FROM crime_data
GROUP BY Offender_Race
HAVING COUNT(*) > 30;


-- 25. Category-wise sum of offender ages where age is even
SELECT Category, SUM(Offender_Age) AS total_even_age
FROM crime_data
WHERE MOD(Offender_Age,2) = 0
GROUP BY Category;


-- 26. Crimes where offender age is odd
SELECT *
FROM crime_data
WHERE MOD(Offender_Age,2) = 1;


-- 27. Crimes classified as theft or robbery
SELECT *
FROM crime_data
WHERE Category = 'Theft'
OR Category = 'Robbery';


-- 28. Offender races not containing letter 'A'
SELECT *
FROM crime_data
WHERE Offender_Race NOT LIKE '%A%';


-- 29. Replace a row
REPLACE INTO crime_data (Category, Offender_Age)
VALUES ('Theft', 30);
