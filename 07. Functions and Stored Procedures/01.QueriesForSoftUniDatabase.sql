USE [SoftUni]

GO


-- Problem 01. Employees with Salary Above 35000

CREATE PROCEDURE [usp_GetEmployeesSalaryAbove35000]
AS
	BEGIN
		SELECT [FirstName], [LastName]
		  FROM [Employees]
		 WHERE [Salary] > 35000
	END

EXEC [usp_GetEmployeesSalaryAbove35000]

GO


-- Problem 02. Employees with Salary Above Number

CREATE PROCEDURE [usp_GetEmployeesSalaryAboveNumber] @minSalary DECIMAL(18, 4)
AS
	BEGIN
		SELECT [FirstName], [LastName]
		  FROM [Employees]
		 WHERE [Salary] >= @minSalary
	END

EXEC [usp_GetEmployeesSalaryAboveNumber] 48100

GO


-- Problem 03. Town Names Starting With

CREATE PROCEDURE [usp_GetTownsStartingWith] @firstLetter VARCHAR(50)
AS
	BEGIN
		SELECT [Name] AS [Town]
		  FROM [Towns]
		 WHERE [Name] LIKE @firstLetter + '%'
	END

EXEC [usp_GetTownsStartingWith] 'b'

GO

-- Another solution

CREATE PROC usp_GetTownsStartingWith(@StartingWith NVARCHAR(50))
AS
	SELECT t.[Name] AS Town
  	  FROM Towns AS t
   	 WHERE LEFT(t.[Name], LEN(@StartingWith)) = @StartingWith


-- Problem 04. Employees from Town

CREATE PROCEDURE [usp_GetEmployeesFromTown] @town VARCHAR(50)
AS
	BEGIN
		SELECT [FirstName] AS [First Name],
		       [LastName] AS [Last Name]
		  FROM [Employees] AS [e]
		  JOIN [Addresses] AS [a]
		    ON [e].[AddressID] = [a].AddressID
		  JOIN [Towns] AS [t]
		    ON [a].[TownID] = [t].[TownID]
		 WHERE [t].[Name] = @town
	END

EXEC [usp_GetEmployeesFromTown] 'Sofia'

GO


-- Problem 05. Salary Level Function

CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS
	BEGIN
		 DECLARE @salaryLevel VARCHAR(10) = 'Average'
		     IF (@salary < 30000)
		     SET @salaryLevel = 'Low'
		ELSE IF (@salary > 50000)
		     SET @salaryLevel = 'High'

		  RETURN @salaryLevel
	END

GO

SELECT [Salary],
dbo.ufn_GetSalaryLevel([Salary]) AS [Salary Level]
FROM [Employees]

GO

-- Problem 06. Employees by Salary Level

CREATE PROCEDURE usp_EmployeesBySalaryLevel @level VARCHAR(10)
AS
	BEGIN
		SELECT [FirstName], [LastName]
		  FROM [Employees]
		 WHERE dbo.ufn_GetSalaryLevel([Salary]) = @level
	END

GO

EXEC dbo.usp_EmployeesBySalaryLevel 'High'

