CREATE DATABASE Sales;
USE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY NOT NULL UNIQUE,
    Customer_name VARCHAR(100),
    Product_Category VARCHAR(50),
    Ordered_item VARCHAR(100), -- Corrected column name
    Contact_No VARCHAR(15)
);

ALTER TABLE Orders
ADD order_quantity INT;

RENAME TABLE Orders TO sales_orders;

INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES
    (1, 'John Doe', 'Electronics', 'Laptop', '1234567890', 1),
    (2, 'Jane Smith', 'Furniture', 'Table', '9876543210', 2),
    (3, 'Alice Brown', 'Electronics', 'Phone', '5678901234', 1),
    (4, 'Bob Johnson', 'Clothing', 'Jacket', '6789012345', 3),
    (5, 'Charlie Lee', 'Books', 'Novel', '3256789012', 1),
    (6, 'Emily Clark', 'Kitchen', 'Mixer', '7890123456', 1),
    (7, 'Daniel Wilson', 'Electronics', 'Tablet', '1230984567', 1),
    (8, 'Sophia Garcia', 'Furniture', 'Chair', '6543217890', 4),
    (9, 'Michael Scott', 'Stationery', 'Pen', '8901234567', 10),
    (10, 'Laura Adams', 'Books', 'Dictionary', '2345678901', 1);

-- Retrieve customer_name and ordered_item
SELECT Customer_name, Ordered_item 
FROM sales_orders;

-- Update ordered_item for Order_Id = 3
UPDATE sales_orders
SET Ordered_item = 'Smartphone'
WHERE Order_Id = 3;

-- Describe and validate table structure and data before deleting
DESCRIBE sales_orders;
SELECT * FROM sales_orders;

-- Drop the table
DROP TABLE sales_orders;

-- Validate database and table structures
SHOW DATABASES;
SHOW TABLES;
