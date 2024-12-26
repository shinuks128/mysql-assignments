-- 1. Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population BIGINT,
    Area BIGINT
);

-- 2. Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population BIGINT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- 3. Insert 10 rows into the Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9834000),
(2, 'Canada', 38000000, 9985000),
(3, 'UK', 67000000, 243000),
(4, 'India', 1380000000, 3287000),
(5, 'Australia', 25600000, 7692000),
(6, 'China', 1439000000, 9597000),
(7, 'Brazil', 212000000, 8516000),
(8, 'Japan', 126000000, 377975),
(9, 'Russia', 144000000, 17098242),
(10, 'Germany', 83000000, 357022);

-- 4. Insert 10 rows into the Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 100000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 200000, 4.2, 2, 'Canada'),
(3, 'Ali', 'Khan', 500000, 4.8, 3, 'UK'),
(4, 'Emma', 'Johnson', 1000000, 3.9, 4, 'India'),
(5, 'Sophia', 'Brown', 1500000, 4.6, 5, 'Australia'),
(6, 'Michael', 'Davis', 200000, 4.1, NULL, NULL),
(7, 'James', 'Garcia', 300000, 5.0, 1, 'USA'),
(8, 'Isabella', 'Wilson', 400000, 4.3, 3, 'UK'),
(9, 'Ethan', 'Martinez', 600000, 3.7, 2, 'Canada'),
(10, 'Olivia', 'Taylor', 700000, 4.9, 5, 'Australia');

-- Queries:

-- 1. List the distinct country names from the Persons table
SELECT DISTINCT Country_name
FROM Persons;

-- 2. Select first names and last names from the Persons table with aliases
SELECT Fname AS FirstName, Lname AS LastName
FROM Persons;

-- 3. Find all persons with a rating greater than 4.0
SELECT *
FROM Persons
WHERE Rating > 4.0;

-- 4. Find countries with a population greater than 10 lakhs
SELECT *
FROM Country
WHERE Population > 1000000;

-- 5. Find persons who are from 'USA' or have a rating greater than 4.5
SELECT *
FROM Persons
WHERE Country_name = 'USA' OR Rating > 4.5;

-- 6. Find all persons where the country name is NULL
SELECT *
FROM Persons
WHERE Country_name IS NULL;

-- 7. Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT *
FROM Persons
WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 8. Find all persons not from the countries 'Canada' and from the countries 'India' and 'Australia'
SELECT *
FROM Persons
WHERE Country_name IN ('India', 'Australia') AND Country_name != 'Canada';

-- 9. Find all countries with a population between 5 lakhs and 20 lakhs
SELECT *
FROM Country
WHERE Population BETWEEN 500000 AND 2000000;

-- 10. Find all countries whose names do not start with 'C'
SELECT *
FROM Country
WHERE Country_name NOT LIKE 'C%';
