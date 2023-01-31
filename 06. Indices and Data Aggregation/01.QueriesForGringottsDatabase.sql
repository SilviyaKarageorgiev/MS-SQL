USE [Gringotts]

-- Problem 01. Records’ Count

  SELECT COUNT(*) AS [Count]
    FROM [WizzardDeposits]


-- Problem 02. Longest Magic Wand

SELECT MAX([MagicWandSize]) AS [LongestMagicWand]
  FROM [WizzardDeposits]


-- Problem 03. Longest Magic Wand per Deposit Groups

  SELECT [w].[DepositGroup], 
         MAX([w].[MagicWandSize]) AS [LongestMagicWand]
    FROM [WizzardDeposits] AS [w]
GROUP BY [w].[DepositGroup]


-- Problem 04. Smallest Deposit Group per Magic Wand Size

  SELECT TOP(2)
	 [w].[DepositGroup]       
    FROM [WizzardDeposits] AS [w]
GROUP BY [w].[DepositGroup]
ORDER BY AVG([w].[MagicWandSize])


-- Problem 05. Deposits Sum

  SELECT [w].[DepositGroup], 
         SUM([w].[DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits] AS [w]
GROUP BY [w].[DepositGroup]


-- Problem 06. Deposits Sum for Ollivander Family

  SELECT [w].[DepositGroup], 
         SUM([w].[DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits] AS [w]
   WHERE [w].[MagicWandCreator] = 'Ollivander family'
GROUP BY [w].[DepositGroup]


-- Problem 07. Deposits Filter

  SELECT [w].[DepositGroup], 
         SUM([w].[DepositAmount]) AS [TotalSum]
    FROM [WizzardDeposits] AS [w]
   WHERE [w].[MagicWandCreator] = 'Ollivander family'
GROUP BY [w].[DepositGroup]
  HAVING SUM([w].[DepositAmount]) < 150000
ORDER BY [TotalSum] DESC


-- Problem 08. Deposit Charge

  SELECT [w].[DepositGroup], 
         [w].[MagicWandCreator],
	 MIN([w].[DepositCharge]) AS [MinDepositCharge]
    FROM [WizzardDeposits] AS [w]
GROUP BY [w].[DepositGroup], [w].[MagicWandCreator]
ORDER BY [w].[MagicWandCreator], [w].[DepositGroup]


-- Problem 09. Age Groups

     SELECT [AgeGroup],
COUNT(*) AS [WizardCount]
FROM 
	(
	    SELECT 
	    CASE
		WHEN [Age] BETWEEN 0 AND 10 THEN '[0-10]'
		WHEN [Age] BETWEEN 11 AND 20 THEN '[11-20]'
		WHEN [Age] BETWEEN 21 AND 30 THEN '[21-30]'
		WHEN [Age] BETWEEN 31 AND 40 THEN '[31-40]'
		WHEN [Age] BETWEEN 41 AND 50 THEN '[41-50]'
		WHEN [Age] BETWEEN 51 AND 60 THEN '[51-60]'
		ELSE '[61+]'
  	    END
	     AS [AgeGroup]
	   FROM [WizzardDeposits]
	)
         AS [AgeGroupSubquery]
   GROUP BY [AgeGroup]
   
   
-- Problem 10. First Letter

  SELECT LEFT([FirstName], 1) AS [FirstLetter]
    FROM [WizzardDeposits]
   WHERE [DepositGroup] = 'Troll Chest'
GROUP BY SUBSTRING([FirstName], 1, 1)
ORDER BY [FirstLetter]


-- 11. Average Interest

  SELECT [DepositGroup], [IsDepositExpired],
   	 AVG([DepositInterest]) AS [AverageInterest]
    FROM [WizzardDeposits]
   WHERE [DepositStartDate] > '01/01/1985'
GROUP BY [DepositGroup], [IsDepositExpired]
ORDER BY [DepositGroup] DESC, [IsDepositExpired]


-- Problem 12. *Rich Wizard, Poor Wizard

SELECT SUM([Difference])  AS [SumDifference]
  FROM 
	(
SELECT [FirstName] AS [Host Wizard], 
	   [DepositAmount] AS [Host Wizard Deposit],
       LEAD([FirstName]) OVER(ORDER BY [Id])
    AS [Guest Wizard],
       LEAD([DepositAmount]) OVER(ORDER BY [Id])
    AS [Guest Wizard Deposit],
       [DepositAmount] - LEAD([DepositAmount]) OVER(ORDER BY [Id])
    AS [Difference]
  FROM [WizzardDeposits]
	)  AS [DifferenceSubquery]

