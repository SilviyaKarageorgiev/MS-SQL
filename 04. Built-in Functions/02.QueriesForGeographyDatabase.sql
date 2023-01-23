USE [Geography]

-- Problem 12. Countries Holding 'A' 3 or More Times

  SELECT [CountryName] AS [Country Name],
  	     [IsoCode] AS [ISO Code]
    FROM [Countries]
   WHERE [CountryName] LIKE '%a%a%a%'
ORDER BY [IsoCode]


-- Problem 13. Mix of Peak and River Names

SELECT [PeakName],
	   [RiverName],
	   CONCAT(LOWER([PeakName]), LOWER(SUBSTRING([RiverName], 2, LEN([RiverName])))) AS [Mix]
FROM [Peaks], [Rivers]
WHERE RIGHT([PeakName], 1) = LEFT([RiverName], 1)
ORDER BY [Mix]
