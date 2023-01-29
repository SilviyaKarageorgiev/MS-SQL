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

