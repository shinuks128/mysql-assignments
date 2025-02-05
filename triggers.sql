-- 1. Create teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

-- Insert 8 rows into teachers table
INSERT INTO teachers (name, subject, experience, salary) VALUES
('John Doe', 'Mathematics', 5, 50000),
('Jane Smith', 'Physics', 12, 70000),
('Alice Johnson', 'Chemistry', 8, 60000),
('Bob Brown', 'Biology', 15, 80000),
('Charlie White', 'English', 3, 40000),
('David Green', 'History', 20, 90000),
('Eva Black', 'Geography', 7, 55000),
('Franklin Adams', 'Computer Science', 10, 75000);

-- 2. Create BEFORE INSERT trigger
DELIMITER $$
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$
DELIMITER ;

-- 3. Create teacher_log table
CREATE TABLE teacher_log (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE CASCADE
);

-- Create AFTER INSERT trigger
DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$
DELIMITER ;

-- 4. Create BEFORE DELETE trigger
DELIMITER $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END $$
DELIMITER ;

-- 5. Create AFTER DELETE trigger
DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$
DELIMITER ;
