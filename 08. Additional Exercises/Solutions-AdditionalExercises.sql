USE Diablo

GO

-- Problem 01. Number of Users for Email Provider

  SELECT SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email))
      AS [Email Provider],
         COUNT(Id) AS [Number Of Users]
    FROM Users
GROUP BY SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email))
ORDER BY [Number Of Users] DESC,
         [Email Provider]


-- Problem 02. All Users in Games

   SELECT g.[Name] AS [Name],
          gt.[Name] AS [Game Type],
          u.Username,
          ug.[Level],
          ug.Cash,
          c.[Name]
     FROM Users AS u
LEFT JOIN UsersGames AS ug ON u.Id = ug.UserId
LEFT JOIN Games AS g ON ug.GameId = g.Id
LEFT JOIN GameTypes AS gt ON g.GameTypeId = gt.Id
LEFT JOIN Characters AS c ON c.Id = ug.CharacterId
 ORDER BY ug.[Level] DESC,
          u.Username,
          g.[Name]


-- Problem 03. Users in Games with Their Items

  SELECT u.Username,
         g.[Name],
         COUNT(i.Id) AS [Items Count],
         SUM(i.Price) AS [Items Price]
    FROM Users AS u
    JOIN UsersGames AS ug ON u.Id = ug.UserId
    JOIN Games AS g ON ug.GameId = g.Id
    JOIN UserGameItems AS ugi ON ug.Id = ugi.UserGameId
    JOIN Items AS i ON i.Id = ugi.ItemId
GROUP BY g.[Name], u.Username
  HAVING COUNT(i.Id) >= 10
ORDER BY [Items Count] DESC, [Items Price] DESC, u.Username
