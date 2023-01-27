USE [SoftUni]

-- Problem 01. Employee Address

  SELECT  
		 e.[EmployeeID],
	     e.[JobTitle], 
	     e.[AddressID], 
	     a.[AddressText] 
    FROM [Employees] AS e 
   INNER JOIN [Addresses] AS a
      ON e.[AddressID] = a.[AddressID]
ORDER BY e.[AddressID]


-- Problem 02. Addresses with Towns

SELECT * FROM [Employees]
SELECT * FROM [Addresses]

  SELECT
         TOP(50)
	     [e].[FirstName],
	     [e].[LastName],
	     [t].[Name] AS [Town],
	     [a].[AddressText]
    FROM [Employees] AS [e]
    JOIN [Addresses] AS [a] ON [e].[AddressID] = [a].[AddressID]
    JOIN [Towns] AS [t] ON [a].[TownID] = [t].[TownID]
ORDER BY [e].[FirstName], [e].[LastName]
