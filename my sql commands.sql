  CREATE DATABASE School;
USE School;
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade)
VALUES
(1, 'Alice', 85, 'A'),
(2, 'Bob', 72, 'B'),
(3, 'Charlie', 90, 'A'),
(4, 'Diana', 65, 'C');
SELECT * FROM STUDENT;
ALTER TABLE STUDENT ADD Contact VARCHAR(15);
ALTER TABLE STUDENT DROP COLUMN Grade;
RENAME TABLE STUDENT TO CLASSTEN;
TRUNCATE TABLE CLASSTEN;
DROP TABLE CLASSTEN;
SHOW CREATE TABLE STUDENT;
