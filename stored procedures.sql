-- 1. Stored procedure to add a new worker
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

-- Procedure Call
CALL AddWorker(1, 'John', 'Doe', 50000, '2023-01-15', 'HR');

-- 2. Stored procedure to retrieve salary of a worker
DELIMITER $$

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Procedure Call
CALL GetSalary(1, @salary);
SELECT @salary; -- To check the output

-- 3. Stored procedure to update department of a worker
DELIMITER $$

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Procedure Call
CALL UpdateDepartment(1, 'Finance');

-- 4. Stored procedure to get count of workers in a department
DELIMITER $$

CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount FROM Worker WHERE Department = p_Department;
END $$

DELIMITER ;

-- Procedure Call
CALL GetWorkerCount('Finance', @workerCount);
SELECT @workerCount; -- To check the output

-- 5. Stored procedure to get average salary of a department
DELIMITER $$

CREATE PROCEDURE GetAvgSalary(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary FROM Worker WHERE Department = p_Department;
END $$

DELIMITER ;

-- Procedure Call
CALL GetAvgSalary('Finance', @avgSalary);
SELECT @avgSalary; -- To check the output
