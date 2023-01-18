CREATE DATABASE [SoftUni]

USE [SoftUni]

CREATE TABLE [Towns](
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL,
)

CREATE TABLE [Addresses](
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[AddressText] NVARCHAR(50),
	[TownId] INT FOREIGN KEY REFERENCES [Towns]([Id]) NOT NULL
)

CREATE TABLE [Departments](
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(20)
)

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY IDENTITY(1, 1),
	[FirstName] NVARCHAR(20) NOT NULL,
	[MiddleName] NVARCHAR(20) NOT NULL,
	[LastName] NVARCHAR(20) NOT NULL,
	[JobTitle] NVARCHAR(20) NOT NULL,
	[DepartmentId] INT FOREIGN KEY REFERENCES [Departments]([Id]) NOT NULL,
	[HireDate] DATE NOT NULL,
	[Salary] DECIMAL(6, 2) NOT NULL,
	[AddressId] INT FOREIGN KEY REFERENCES [Addresses]([Id]) NOT NULL
)
