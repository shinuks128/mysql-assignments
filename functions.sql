-- 1. Add a new column called DOB in the Persons table with data type as Date.
ALTER TABLE Persons ADD DOB DATE;

-- 2. Create a user-defined function to calculate age using DOB.
DELIMITER //
CREATE FUNCTION CalculateAge(dob DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //
DELIMITER ;

-- 3. Select query to fetch the Age of all persons using the function.
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age FROM Persons;

-- 4. Find the length of each country name in the Country table.
SELECT Country_name, LENGTH(Country_name) AS NameLength FROM Country;

-- 5. Extract the first three characters of each country's name in the Country table.
SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars FROM Country;

-- 6. Convert all country names to uppercase and lowercase in the Country table.
SELECT Country_name, UPPER(Country_name) AS UpperCaseName, LOWER(Country_name) AS LowerCaseName FROM Country;
