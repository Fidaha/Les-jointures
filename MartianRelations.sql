
CREATE DATABASE MartianRelations;


USE MartianRelations;


-- la table des humains (terriens)
CREATE TABLE Human (
  ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Continent VARCHAR(50) NOT NULL
);
GO

-- Insertion de données
INSERT INTO Human (ID, Name, Continent)
VALUES (1, 'John Doe', 'Amérique'),
       (2, 'Jane Smith', 'Europe'),
       (3, 'Alice Johnson', 'Asie');


--la table des martiens
CREATE TABLE Martian (
  ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Base VARCHAR(50) NOT NULL,
  SuperiorMartianID INT,
  HumanID INT,
  FOREIGN KEY (SuperiorMartianID) REFERENCES Martian(ID),
  FOREIGN KEY (HumanID) REFERENCES Human(ID)
);


-- Insertion de données de test pour les martiens
INSERT INTO Martian (ID, Name, Base, SuperiorMartianID, HumanID)
VALUES (1, 'Martian1', 'Base1', NULL, 1),
       (2, 'Martian2', 'Base2', 1, 2),
       (3, 'Martian3', 'Base3', 2, 3),
       (4, 'Martian4', 'Base4', 3, 1);


-- Requête pour récupérer l'affiliation de chaque martien à son terrien de référence
SELECT m.Name AS MartianName, h.Name AS HumanName, h.Continent, m.Base
FROM Martian m
JOIN Human h ON m.HumanID = h.ID;
