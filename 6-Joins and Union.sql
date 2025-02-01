-- INNER JOIN
SELECT Persons.*, Country.*
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;

-- LEFT JOIN
SELECT Persons.*, Country.*
FROM Persons
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

-- RIGHT JOIN
SELECT Persons.*, Country.*
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;
SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;
SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons;

SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rounded_Rating, Country_Id, Country_name
FROM Persons