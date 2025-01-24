-- Creating Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(255),
    Population INT,
    Area INT
);

-- Creating Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(255),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
-- Inserting data into Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES 
(1, 'USA', 331002651, 9833520),
(2, 'India', 1393409038, 3287263),
(3, 'China', 1444216107, 9596961),
(4, 'Brazil', 213993437, 8515767),
(5, 'Russia', 145912025, 17098242),
(6, 'Japan', 126476461, 377975),
(7, 'Germany', 83783942, 357022),
(8, 'Canada', 38005238, 9984670),
(9, 'Australia', 25687041, 7692024),
(10, 'Mexico', 126014024, 1964375);

-- Inserting data into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 100000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 50000, 3.8, 2, 'India'),
(3, 'Liu', 'Wang', 80000, 4.7, 3, 'China'),
(4, 'Carlos', 'Santos', 20000, 3.6, 4, 'Brazil'),
(5, 'Igor', 'Ivanov', 75000, 4.0, 5, 'Russia'),
(6, 'Hiro', 'Tanaka', 55000, 4.8, 6, 'Japan'),
(7, 'Hans', 'Schmidt', 67000, 4.2, 7, 'Germany'),
(8, 'Emma', 'Brown', 45000, 3.9, 8, 'Canada'),
(9, 'Liam', 'Johnson', 60000, 4.4, 9, 'Australia'),
(10, 'Sophia', 'Garcia', 30000, 4.1, 10, 'Mexico');
SELECT LEFT(Country_name, 3) AS Short_Name FROM Country;
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;
SELECT COUNT(DISTINCT Country_name) AS Unique_Countries FROM Persons;
SELECT MAX(Population) AS Max_Population FROM Country;
SELECT MIN(Population) AS Min_Population FROM Persons;
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'Alex', NULL, 40000, 3.5, 1, 'USA'),
(12, 'Mia', NULL, 50000, 4.0, 2, 'India');

SELECT COUNT(Lname) AS Count_Lname FROM Persons WHERE Lname IS NOT NULL;
SELECT COUNT(*) AS Total_Rows FROM Persons;
SELECT Population FROM Country LIMIT 3;
SELECT * FROM Country ORDER BY RAND() LIMIT 3;
SELECT * FROM Persons ORDER BY Rating DESC;
SELECT Country_name, SUM(Population) AS Total_Population 
FROM Persons 
GROUP BY Country_name;
SELECT Country_name 
FROM Persons 
GROUP BY Country_name 
HAVING SUM(Population) > 50000;
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Average_Rating ASC;
