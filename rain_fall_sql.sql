create database Rainfall;
use rainfall;
select count(*) from weatheraus;

-- Average Evaporation 
SELECT AVG(Evaporation) AS Avg_Evaporation FROM weatheraus WHERE Evaporation IS NOT NULL;

-- Rainfall Summary by Location
SELECT Location, SUM(Rainfall) AS Total_Rainfall, AVG(Rainfall) AS Avg_Rainfall
FROM weatheraus
GROUP BY Location
ORDER BY Total_Rainfall DESC;

-- Average Temperature by Location
SELECT Location, AVG(MinTemp) AS Avg_MinTemp, AVG(MaxTemp) AS Avg_MaxTemp
FROM weatheraus
GROUP BY Location
ORDER BY Avg_MaxTemp DESC;

-- Wind Speed Analysis
SELECT Location, AVG(WindSpeed9am) AS Avg_WindSpeed9am, AVG(WindSpeed3pm) AS Avg_WindSpeed3pm
FROM weatheraus
GROUP BY Location ;

--  Monthly Weather Trends
SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, 
       AVG(MaxTemp) AS Avg_MaxTemp, AVG(MinTemp) AS Avg_MinTemp, SUM(Rainfall) AS Total_Rainfall
FROM weatheraus
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;

-- Wind Speed & Direction Analysis
SELECT WindDir3pm, AVG(WindSpeed3pm) AS Avg_WindSpeed
FROM weatheraus
GROUP BY WindDir3pm
ORDER BY Avg_WindSpeed DESC;

-- Monthly Temperature Trends
SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, AVG(Temp3pm) AS Avg_Temp3pm
FROM weatheraus
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;