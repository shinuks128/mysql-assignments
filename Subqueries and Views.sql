-- 1. Find the number of persons in each country.
SELECT c.Country_name, COUNT(p.Id) AS NumberOfPersons
FROM Country c
JOIN Persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name;

-- 2. Find the number of persons in each country sorted from high to low.
SELECT c.Country_name, COUNT(p.Id) AS NumberOfPersons
FROM Country c
JOIN Persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name
ORDER BY NumberOfPersons DESC;

-- 3. Find the average rating for Persons in respective countries if the average is greater than 3.0.
SELECT c.Country_name, AVG(p.Rating) AS AvgRating
FROM Country c
JOIN Persons p ON c.Id = p.Country_Id
GROUP BY c.Country_name
HAVING AvgRating > 3.0;

-- 4. Find the countries with the same rating as the USA. (Using Subqueries)
SELECT Country_name
FROM Country
WHERE Rating = (SELECT Rating FROM Country WHERE Country_name = 'USA');

-- 5. Select all countries whose population is greater than the average population of all nations.
SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);
-- Create Product Database
CREATE DATABASE Product;

-- Use Product Database
USE Product;

-- Create Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
-- 1. Create a view named customer_info for the Customer table that displays Full Name and Email Address.
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email 
FROM Customer;

-- Perform SELECT operation on customer_info view.
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US.
CREATE VIEW US_Customers AS
SELECT * FROM Customer WHERE Country = 'USA';

-- 3. Create another view named Customer_details with columns Full Name, Email, Phone_no, and State.
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

-- 4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer 
SET Phone_no = '123-456-7890'  -- Example phone number
WHERE State = 'California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers.
SELECT State, COUNT(Customer_Id) AS NumCustomers
FROM Customer
GROUP BY State
HAVING COUNT(Customer_Id) > 5;

-- 6. Count the number of customers in each state based on the "Customer_details" view.
SELECT State, COUNT(*) AS NumCustomers
FROM Customer_details
GROUP BY State;

-- 7. Return all columns from the "Customer_details" view, sorted by the "State" column in ascending order.
SELECT * FROM Customer_details ORDER BY State ASC;
