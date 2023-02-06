CREATE DATABASE Zoo

USE Zoo


--Problem 01

CREATE TABLE Owners
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	[Address] VARCHAR(50)
)

CREATE TABLE AnimalTypes
(
	Id INT PRIMARY KEY IDENTITY,
	AnimalType VARCHAR(30) NOT NULL
)

CREATE TABLE Cages
(
	Id INT PRIMARY KEY IDENTITY,
	AnimalTypeId INT FOREIGN KEY REFERENCES AnimalTypes(Id) NOT NULL
)

CREATE TABLE Animals
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(30) NOT NULL,
	BirthDate DATE NOT NULL,
	OwnerId INT FOREIGN KEY REFERENCES Owners(Id),
	AnimalTypeId INT FOREIGN KEY REFERENCES AnimalTypes(Id) NOT NULL
)

CREATE TABLE AnimalsCages
(
	CageId INT FOREIGN KEY REFERENCES Cages(Id),
	AnimalId INT FOREIGN KEY REFERENCES Animals(Id),
	PRIMARY KEY(CageId, AnimalId)
)

CREATE TABLE VolunteersDepartments
(
	Id INT PRIMARY KEY IDENTITY,
	DepartmentName VARCHAR(30) NOT NULL
)

CREATE TABLE Volunteers
(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	[Address] VARCHAR(50),
	AnimalId INT FOREIGN KEY REFERENCES Animals(Id),
	DepartmentId INT FOREIGN KEY REFERENCES VolunteersDepartments(Id) NOT NULL
)


-- Problem 02

INSERT INTO Animals([Name], BirthDate, OwnerId, AnimalTypeId)
VALUES 
	('Giraffe', '2018-09-21', 21, 1),
	('Harpy Eagle', '2015-04-17', 15, 3),
	('Hamadryas Baboon', '2017-11-02', NULL, 1),
	('Tuatara', '2021-06-30', 2, 4)

INSERT INTO Volunteers([Name], PhoneNumber, [Address], AnimalId, DepartmentId)
VALUES
	('Anita Kostova', '0896365412', 'Sofia, 5 Rosa str.', 15, 1),
	('Dimitur Stoev', '0877564223', NULL, 42, 4),
	('Kalina Evtimova', '0896321112', 'Silistra, 21 Breza str.', 9, 7),
	('Stoyan Tomov', '0898564100', 'Montana, 1 Bor str.', 18, 8),
	('Boryana Mileva', '0888112233', NULL, 31, 5)


-- Problem 03

UPDATE Animals
   SET OwnerId = (
     SELECT Id
	   FROM Owners
	  WHERE [Name] = 'Kaloqn Stoqnov'
)
  WHERE OwnerId IS NULL


-- Problem 04

DELETE 
  FROM Volunteers
 WHERE DepartmentId = (
	SELECT Id
	  FROM VolunteersDepartments
	 WHERE DepartmentName = 'Education program assistant'
	)

DELETE
  FROM VolunteersDepartments
 WHERE DepartmentName = 'Education program assistant'


-- Problem 05

  SELECT [Name],
         PhoneNumber, 
		 [Address],
		 AnimalId, 
		 DepartmentId
    FROM Volunteers
ORDER BY [Name], AnimalId, DepartmentId


-- Problem 06

  SELECT a.[Name],
		 at.AnimalType,
		 FORMAT(a.BirthDate, 'dd.MM.yyyy')
      AS BirthDate
	FROM Animals AS a
	JOIN AnimalTypes AS [at]
	  ON a.AnimalTypeId = [at].Id
ORDER BY a.[Name]


-- Problem 07
    
   SELECT TOP(5)
          o.[Name] AS [Owner],
          COUNT(a.Id) AS CountOfAnimals
     FROM Owners AS o
LEFT JOIN Animals AS a
       ON o.Id = a.OwnerId
 GROUP BY o.[Name]
 ORDER BY CountOfAnimals DESC, [Owner]


-- Problem 08

  SELECT CONCAT(o.[Name], '-', a.[Name]) AS OwnerAnimals,
		 o.PhoneNumber,
		 ac.CageId
	FROM Owners AS o
	JOIN Animals AS a
	  ON o.Id = a.OwnerId
	JOIN AnimalTypes AS [at]
	  ON a.AnimalTypeId = [at].Id
    JOIN AnimalsCages AS ac
	  ON a.Id = ac.AnimalId
   WHERE [at].AnimalType = 'Mammals'
ORDER BY o.[Name],
		 a.[Name] DESC


-- Problem 09


