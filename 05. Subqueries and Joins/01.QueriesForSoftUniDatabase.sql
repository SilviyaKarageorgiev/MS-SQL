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


-- Problem 03. Sales Employees

  SELECT [e].[EmployeeID], [e].[FirstName], [e].[LastName], [d].[Name] AS [DepartmentName]
    FROM [Employees] AS [e]
    JOIN [Departments] AS [d] ON [e].[DepartmentID] = [d].[DepartmentID]
   WHERE [d].[Name] = 'Sales'
ORDER BY [e].[EmployeeID]


-- Problem 04. Employee Departments

  SELECT 
	 TOP(5)
	 [e].[EmployeeID],
	 [e].[FirstName],
	 [e].[Salary],
	 [d].[Name] AS [DepartmentName]
    FROM [Employees] AS [e]
    JOIN [Departments] AS [d] ON [e].[DepartmentID] = [d].[DepartmentID]
   WHERE [e].[Salary] > 15000
ORDER BY [e].[DepartmentID]


-- Problem 05. Employees Without Projects

   SELECT 
          TOP(3) 
          [e].[EmployeeID],
	  [e].[FirstName]
     FROM [Employees] AS [e]
LEFT JOIN [EmployeesProjects] AS [ep] ON [e].[EmployeeID] = [ep].[EmployeeID]
    WHERE [ep].[ProjectID] IS NULL
 ORDER BY [e].[EmployeeID]


-- Problem 06. Employees Hired After

  SELECT [e].[FirstName], 
         [e].[LastName], 
	 [e].[HireDate], 
	 [d].[Name] AS [DeptName] 
    FROM [Employees] AS [e]
    JOIN [Departments] AS [d] ON [e].[DepartmentID] = [d].[DepartmentID]
   WHERE [e].[HireDate] > '1999-01-01' 
     AND [d].[Name] IN ('Sales', 'Finance')
ORDER BY [e].[HireDate]

