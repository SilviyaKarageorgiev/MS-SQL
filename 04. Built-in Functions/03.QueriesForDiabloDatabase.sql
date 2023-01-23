USE [Diablo]

-- Problem 14. Games From 2011 and 2012 Year

SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [StartDate]
FROM [Games]
WHERE YEAR([Start]) IN (2011, 2012)
ORDER BY [StartDate], [Name]

