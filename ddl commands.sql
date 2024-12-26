-- 1. Create the Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    DOB DATE,
    Age INT,
    Last_update DATE NOT NULL,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_gender CHECK (Gender IN ('Male', 'Female', 'Other'))
);

-- 2. Insert 10 rows into the Managers table
INSERT INTO Managers (Manager_Id, First_name, Last_name, DOB, Age, Last_update, Gender, Department, Salary)
VALUES
(1, 'John', 'Doe', '1980-01-15', 44, '2024-12-01', 'Male', 'IT', 30000),
(2, 'Aliya', 'Khan', '1985-02-20', 39, '2024-12-01', 'Female', 'HR', 25000),
(3, 'David', 'Smith', '1990-03-10', 34, '2024-12-01', 'Male', 'IT', 40000),
(4, 'Emma', 'Johnson', '1995-04-25', 29, '2024-12-01', 'Female', 'Finance', 20000),
(5, 'Sophia', 'Brown', '1992-05-30', 32, '2024-12-01', 'Female', 'IT', 35000),
(6, 'Michael', 'Garcia', '1978-06-15', 46, '2024-12-01', 'Male', 'Sales', 15000),
(7, 'James', 'Miller', '1982-07-10', 42, '2024-12-01', 'Male', 'Marketing', 12000),
(8, 'Isabella', 'Davis', '1993-08-25', 31, '2024-12-01', 'Female', 'IT', 45000),
(9, 'Ethan', 'Wilson', '1998-09-05', 26, '2024-12-01', 'Male', 'Finance', 10000),
(10, 'Olivia', 'Martinez', '1987-10-12', 37, '2024-12-01', 'Female', 'HR', 35000);

-- 3. Retrieve the name and DOB of the manager with Manager_Id = 1
SELECT First_name, Last_name, DOB
FROM Managers
WHERE Manager_Id = 1;

-- 4. Display the annual income of all managers
SELECT Manager_Id, First_name, Last_name, (Salary * 12) AS Annual_Income
FROM Managers;

-- 5. Display records of all managers except 'Aliya'
SELECT *
FROM Managers
WHERE First_name != 'Aliya';

-- 6. Display details of managers whose department is IT and earns more than 25000 per month
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

-- 7. Display details of managers whose salary is between 10000 and 35000
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;
