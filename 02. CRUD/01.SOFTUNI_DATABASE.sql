USE [SoftUni]

-- Problem 2. Find All the Information About Departments

SELECT * FROM [Departments]


-- Problem 3. Find all Department Names

SELECT [Name] FROM [Departments]


-- Problem 4. Find Salary of Each Employee

SELECT [FirstName], [LastName], [Salary] FROM [Employees]


-- Problem 5. Find Full Name of Each Employee

SELECT [FirstName], [MiddleName], [LastName] FROM [Employees]


-- Problem 6. Find Email Address of Each Employee

SELECT CONCAT([FirstName], '.', [LastName], '@', 'softuni.bg')
	AS [Full Email Address]
  FROM [Employees]

SELECT * FROM [Employees]


-- Problem 7. Find All Different Employee’s Salaries

SELECT DISTINCT [Salary]
		   FROM [Employees]


-- 8. Find all Information About Employees

SELECT * FROM [Employees]
WHERE [JobTitle] = 'Sales Representative'


-- Problem 9. Find Names of All Employees by Salary in Range

SELECT [FirstName], [LastName], [JobTitle] 
  FROM [Employees]
 WHERE [Salary] BETWEEN 20000 AND 30000


-- Problem 10. Find Names of All Employees

SELECT CONCAT ([FirstName], ' ',[MiddleName], ' ',[LastName])
    AS [Full Name]
  FROM [Employees]
 WHERE [Salary] IN (25000, 14000, 12500, 23600)
 
 -- With CONCAT_WS
SELECT CONCAT_WS(' ', [FirstName], [MiddleName], [LastName])
    AS [Full Name]
  FROM [Employees]
 WHERE [Salary] IN (25000, 14000, 12500, 23600)


-- Problem 11. Find All Employees Without Manager

SELECT [FirstName], [LastName]
  FROM [Employees]
 WHERE [ManagerID] IS NULL


-- Problem 12. Find All Employees with Salary More Than 50000

  SELECT [FirstName], [LastName], [Salary]
    FROM [Employees]
   WHERE [Salary] > 50000
ORDER BY [Salary] DESC


-- Problem 13. Find 5 Best Paid Employees

SELECT TOP(5) [FirstName], [LastName] FROM [Employees]
ORDER BY [Salary] DESC


-- Problem 14. Find All Employees Except Marketing

SELECT [FirstName], [LastName] FROM [Employees]
WHERE NOT ([DepartmentID] = 4)

-- Another solution:
SELECT [FirstName], [LastName] FROM [Employees]
WHERE [DepartmentID] <> 4


-- Problem 15. Sort Employees Table

SELECT * FROM [Employees]
ORDER BY [Salary] DESC, [FirstName] ASC, [LastName] DESC, [MiddleName] ASC


-- Problem 16. Create View Employees with Salaries

CREATE VIEW [V_EmployeesSalaries] AS(
     SELECT [FirstName], [LastName], [Salary]
       FROM [Employees])

SELECT * FROM [V_EmployeesSalaries]


-- Problem 17. Create View Employees with Job Titles

CREATE VIEW [V_EmployeeNameJobTitle] AS(
		SELECT CONCAT([FirstName], ' ', [MiddleName], ' ', [LastName])
		    AS [Full Name], [JobTitle]
		  FROM [Employees])

SELECT * FROM [V_EmployeeNameJobTitle]


-- Problem 18. Distinct Job Titles

SELECT DISTINCT [JobTitle]
		   FROM [Employees]


-- Problem 19. Find First 10 Started Projects

  SELECT TOP(10) * 
    FROM [Projects]
   WHERE [StartDate] IS NOT NULL
ORDER BY [StartDate], [Name]


-- Problem 20. Last 7 Hired Employees

SELECT TOP(7) [FirstName], [LastName], [HireDate] 
         FROM [Employees]
     ORDER BY [HireDate] DESC


-- Problem 21. Increase Salaries

UPDATE [Employees]
   SET [Salary] += 0.12 * [Salary]
 WHERE [DepartmentID] IN (1, 2, 4, 11)

SELECT [Salary] FROM [Employees]


