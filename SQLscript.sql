-- count the number of athletes for each country:
SELECT TOP 20 Country, 
    Count(*) AS TotalAthletes
FROM athletes
GROUP BY Country
ORDER BY TotalAthletes DESC 

-- calculate the total medals won by each country:
SELECT TOP 20 TeamCountry,
    SUM(Gold) AS TotalGold,
    SUM(Silver) AS TotalSilver,
    SUM(Bronze) AS TotalBronze
FROM medals
GROUP BY TeamCountry
ORDER BY TotalGold DESC, TotalSilver DESC, TotalBronze DESC




-- Find the top 20 countries with the highest total medal count
SELECT TOP 20 TeamCountry, Total
FROM medals
ORDER BY Total DESC;


-- Calculate the average number of athletes per discipline
SELECT TOP 20 Discipline, AVG(TotalAthletes) AS AvgAthletes
FROM (
    SELECT Discipline, COUNT(*) AS TotalAthletes
    FROM athletes
    GROUP BY Discipline
) AS subquery
GROUP BY Discipline
ORDER BY AvgAthletes DESC;



-- Calculate the top 40 entry counts by gender for each discipline
SELECT TOP 40 Discipline,
     Female, 
     Male 
FROM entriesGender
ORDER BY Female DESC , Male DESC



-- Top 10 countries with the most coaches:

SELECT TOP 10 Country, COUNT(*) AS TotalCoaches
FROM coaches
GROUP BY Country
ORDER BY TotalCoaches DESC;

-- Top 10 disciplines with the most coaches:

SELECT TOP 10 Discipline, COUNT(*) AS TotalCoaches
FROM coaches
GROUP BY Discipline
ORDER BY TotalCoaches DESC;



