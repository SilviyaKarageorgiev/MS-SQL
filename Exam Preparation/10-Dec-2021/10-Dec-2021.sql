CREATE DATABASE Airport

USE Airport


-- Problem 01

CREATE TABLE Passengers
(
	Id INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(100) UNIQUE NOT NULL,
	Email VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE Pilots
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) UNIQUE NOT NULL,
	LastName VARCHAR(30) UNIQUE NOT NULL,
	Age TINYINT CHECK(Age >= 21 AND Age <= 62) NOT NULL,
	Rating FLOAT CHECK(Rating >= 0.0 AND Rating <= 10.0)
)

CREATE TABLE AircraftTypes
(
	Id INT PRIMARY KEY IDENTITY,
	TypeName VARCHAR(30) UNIQUE NOT NULL
)

CREATE TABLE Aircraft
(
	Id INT PRIMARY KEY IDENTITY,
	Manufacturer VARCHAR(25) NOT NULL,
	Model VARCHAR(30) NOT NULL,
	[Year] INT NOT NULL,
	FlightHours INT,
	Condition CHAR(1) NOT NULL,
	TypeId INT FOREIGN KEY REFERENCES AircraftTypes(Id) NOT NULL
)

CREATE TABLE PilotsAircraft
(
	AircraftId INT FOREIGN KEY REFERENCES Aircraft(Id) NOT NULL,
	PilotId INT FOREIGN KEY REFERENCES Pilots(Id) NOT NULL,
	PRIMARY KEY(AircraftId, PilotId)
)

CREATE TABLE Airports
(
	Id INT PRIMARY KEY IDENTITY,
	AirportName VARCHAR(70) UNIQUE NOT NULL,
	Country VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE FlightDestinations
(
	Id INT PRIMARY KEY IDENTITY,
	AirportId INT FOREIGN KEY REFERENCES Airports(Id) NOT NULL,
	[Start] DATETIME NOT NULL,
	AircraftId INT FOREIGN KEY REFERENCES Aircraft(Id) NOT NULL,
	PassengerId INT FOREIGN KEY REFERENCES Passengers(Id) NOT NULL,
	TicketPrice DECIMAL(18, 2) DEFAULT 15 NOT NULL
)
SELECT * FROM Pilots
SELECT * FROM Aircraft

-- Problem 02

INSERT INTO Passengers(FullName, Email)
	 SELECT CONCAT(p.FirstName, ' ', p.LastName) AS FullName,
	 	    CONCAT(p.FirstName, p.LastName, '@gmail.com') AS Email
	 	    FROM Pilots AS p
	  WHERE p.Id BETWEEN 5 AND 15
   ORDER BY p.Id


-- Problem 03

UPDATE Aircraft
   SET Condition = 'A'
 WHERE (Condition IN ('B', 'C'))
       AND ((FlightHours IS NULL) OR (FlightHours BETWEEN 0 AND 100)) 
	   AND ([Year] >= 2013)


-- Problem 04

DELETE 
  FROM Passengers
 WHERE LEN(FullName) <= 10


-- Problem 05

  SELECT Manufacturer,
         Model,
         FlightHours,
         Condition
    FROM Aircraft
ORDER BY FlightHours DESC


-- Problem 06

  SELECT p.FirstName,
		 p.LastName,
		 a.Manufacturer,
		 a.Model,
		 a.FlightHours
	FROM Pilots AS p
	JOIN PilotsAircraft AS pa
	  ON p.Id = pa.PilotId
	JOIN Aircraft AS a
      ON pa.AircraftId = a.Id
   WHERE a.FlightHours IS NOT NULL AND a.FlightHours <= 304
ORDER BY a.FlightHours DESC,
		 p.FirstName


-- Problem 07

