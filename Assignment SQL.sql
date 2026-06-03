create database assignment;
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10)
);

INSERT INTO Company VALUES
(1, 'Urban Outfitters, Inc.', '123 Main St', 'Philadelphia', 'PA', '19103'),
(2, 'Toll Brothers', '250 Gibraltar Rd', 'Horsham', 'PA', '19044'),
(3, 'ABC Technologies', '45 Tech Park', 'Austin', 'TX', '73301'),
(4, 'XYZ Solutions', '78 Business Ave', 'Dallas', 'TX', '75001'),
(5, 'Global Corp', '90 Market St', 'New York', 'NY', '10001');


CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

INSERT INTO Contact VALUES
(1, 1, 'Dianne', 'Connor', '123 Main St', 'Philadelphia', 'PA', '19103', TRUE, 'dianne@urban.com', '215-555-1001'),
(2, 2, 'John', 'Smith', '250 Gibraltar Rd', 'Horsham', 'PA', '19044', TRUE, 'john@toll.com', '215-555-1002'),
(3, 3, 'Sarah', 'Jones', '45 Tech Park', 'Austin', 'TX', '73301', FALSE, 'sarah@abc.com', '512-555-1003'),
(4, 4, 'Mike', 'Brown', '78 Business Ave', 'Dallas', 'TX', '75001', TRUE, 'mike@xyz.com', '972-555-1004'),
(5, 5, 'Emma', 'Wilson', '90 Market St', 'New York', 'NY', '10001', FALSE, 'emma@global.com', '212-555-1005');


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

INSERT INTO Employee VALUES
(1, 'Jack', 'Lee', 55000.00, '2020-01-15', 'Manager', 'jack@company.com', '215-555-2001'),
(2, 'Lesley', 'Bland', 48000.00, '2021-03-20', 'Sales Rep', 'lesley@company.com', '215-555-2002'),
(3, 'Robert', 'King', 62000.00, '2019-06-10', 'Engineer', 'robert@company.com', '215-555-2003'),
(4, 'Linda', 'White', 50000.00, '2022-02-05', 'Analyst', 'linda@company.com', '215-555-2004'),
(5, 'David', 'Green', 70000.00, '2018-09-01', 'Director', 'david@company.com', '215-555-2005');


CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

INSERT INTO ContactEmployee VALUES
(1, 1, 1, '2024-01-10', 'Initial Meeting'),
(2, 2, 2, '2024-01-15', 'Sales Discussion'),
(3, 3, 3, '2024-02-01', 'Project Review'),
(4, 4, 4, '2024-02-10', 'Contract Negotiation'),
(5, 5, 5, '2024-03-01', 'Follow-up Meeting');

-- 4.Change Lesley Bland's Phone Number to 215-555-8800
UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley'
AND LastName = 'Bland';

-- 5.Change Company Name from "Urban Outfitters, Inc." to "Urban Outfitters"
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';

-- 6.Remove Dianne Connor's contact event with Jack 
SELECT ce.ContactEmployeeID
FROM ContactEmployee ce
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
WHERE c.FirstName = 'Dianne'
  AND c.LastName = 'Connor'
  AND e.FirstName = 'Jack'
  AND e.LastName = 'Lee';
  
DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 1;

-- 7.Employees who have contacted Toll Brothers
SELECT DISTINCT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

-- 8.Significance of % and _ in LIKE
% → Zero ya multiple characters represent karta hai.
_ → Exactly one character represent karta hai.

-- 9.Normalization in Databases
Normalization ek process hai jisme database ko organize kiya jata hai taaki.

-- 10.What is a JOIN in MySQL?
JOIN ka use multiple tables ke related data ko combine karne ke liye kiya jata hai.

-- 11.DDL, DML, and DCL in MySQL
DDL (Data Definition Language)
Database structure define ya modify karne ke liye.

DML (Data Manipulation Language)
Data ko insert, update, delete karne ke liye.

DCL (Data Control Language)
Permissions aur security manage karne ke liye.

-- 12.Role of MySQL JOIN Clause and Types of JOINs
JOIN clause multiple tables ke records ko related columns ke basis par combine karta hai.
1. INNER JOIN
Sirf matching records return karta hai.
2. LEFT JOIN
Left table ke saare records aur matching right table records.
3. RIGHT JOIN
Right table ke saare records aur matching left table records.
4. CROSS JOIN
Dono tables ka Cartesian Product.