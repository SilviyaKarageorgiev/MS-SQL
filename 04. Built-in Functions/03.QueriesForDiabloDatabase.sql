USE [Diablo]

-- Problem 14. Games From 2011 and 2012 Year

SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [StartDate]
FROM [Games]
WHERE YEAR([Start]) IN (2011, 2012)
ORDER BY [StartDate], [Name]


-- Problem 15. User Email Providers

  SELECT [Username], SUBSTRING([Email], CHARINDEX('@', [Email], 1) + 1, LEN([Email]))
      AS [EmailProvider]
    FROM [Users]
ORDER BY [EmailProvider], [Username]


-- Problem 16. Get Users with IP Address Like Pattern

SELECT [Username], [IpAddress] AS [IP Address]
FROM [Users]
WHERE [IpAddress] LIKE '___.1_%._%.___'
ORDER BY [Username]

