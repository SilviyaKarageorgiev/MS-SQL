USE [SoftUni]

-- Problem 15. Employees Average Salaries

SELECT * 
  INTO [EmployeesEarnMoreThan30000]
  FROM [Employees]
 WHERE [Salary] > 30000

DELETE 
FROM [EmployeesEarnMoreThan30000]
WHERE [ManagerID] = 42

UPDATE [EmployeesEarnMoreThan30000]
SET [Salary] += 5000
WHERE [DepartmentID] = 1

  SELECT [DepartmentID],
         AVG([Salary]) AS [AverageSalary]
    FROM [EmployeesEarnMoreThan30000]
GROUP BY [DepartmentID]


-- Problem 16. Employees Maximum Salaries

  SELECT [DepartmentID], MAX([Salary]) AS [MaxSalary]
    FROM [Employees]
GROUP BY [DepartmentID]
  HAVING MAX([Salary]) < 30000 OR MAX([Salary]) > 70000


-- Problem 17. Employees Count Salaries

SELECT COUNT(*) AS [Count] 
  FROM [Employees] 
 WHERE [ManagerID] IS NULL


-- Problem 18. *3rd Highest Salary

  SELECT 
DISTINCT [DepartmentID], 
	     [Salary] 
		 AS [ThirdHighestSalary]
FROM
	(
	SELECT [DepartmentID], [Salary],
			DENSE_RANK() OVER(PARTITION BY [DepartmentId] ORDER BY [Salary] DESC)
		AS [SalaryRank]
	  FROM [Employees]
	) AS [SalaryRankingSubquery]
   WHERE [SalaryRank] = 3


-- Problem 19. **Salary Challenge

  SELECT TOP(10) 
         [e].[FirstName], 
         [e].[LastName],
	     [e].[DepartmentID]
    FROM [Employees] AS [e]
   WHERE [Salary] > (
		SELECT AVG([Salary]) AS [AverageSalary]
		  FROM [Employees] AS [eSub]
		 WHERE [eSub].[DepartmentID] = [e].[DepartmentID]
      GROUP BY [DepartmentID]
) 
ORDER BY [e].[DepartmentID]

