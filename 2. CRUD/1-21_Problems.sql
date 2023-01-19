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

-- CREATE VIEW V_EmployeesSalaries AS
SELECT [FirstName] + ' ' + [MiddleName] + ' ' + [LastName] AS [Full Name],
	   [JobTitle] AS [Job Title]
  FROM [Employees]
 WHERE [MiddleName] IS NULL

-- SELECT * FROM V_EmployeesSalaries