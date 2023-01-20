-- Problem 22. All Mountain Peaks

SELECT [PeakName] FROM [Peaks]
ORDER BY [PeakName]


-- Problem 23. Biggest Countries by Population

SELECT TOP(30) [CountryName], [Population] FROM [Countries]
WHERE [ContinentCode] IN 
(
SELECT [ContinentCode] FROM [Continents] WHERE [ContinentName] IN ('Europe')
)
ORDER BY [Population] DESC, [CountryName]


-- Problem 24. Countries and Currency (Euro / Not Euro)

  SELECT [CountryName],
         [CountryCode], 
		 CASE [CurrencyCode]
	     WHEN 'EUR' THEN 'Euro'
         ELSE 'Not Euro'
	     END
	  AS [Currency]
    FROM [Countries]
ORDER BY [CountryName]
