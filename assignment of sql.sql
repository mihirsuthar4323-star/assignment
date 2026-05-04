


-- (2)Statement to create the Employee table 
create table employee(employeeid int primary key,firstname varchar(20),lastname varchar(20),salary decimal(10,2),hiredate date,jobtitle varchar(25),email varchar(45),phone varchar(12));

-- (3)Statement to create the ContactEmployee table 
create table contactemployees (contactemployeeid int primary key,contactid int,employeeid int,contactdate date,description varchar(100),
foreign key (contactid) REFERENCES contact(contactid),
foreign key (employeeid) REFERENCES employee(employeeid)
);

-- (4)In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800
update employee set phone ='9911 451 551' where firstname = ' Lesley' and lastname = 'Bland';

-- (5)In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” . 
update company set companyname='Urban Outfitters' where companyname='Urban Outfitters, Inc.'

-- (8)What is the significance of “%” and “_” operators in the LIKE statement? 
% → represents zero or more characters
_ → represents exactly one character

-- (9) Explain normalization in the context of databases. 
Normalization in databases is the process of organizing data into multiple related tables to reduce redundancy 
(duplicate data) and improve data consistency.

-- (10) What does a join in MySQL mean? 
A JOIN in MySQL means combining data from two or more tables based on a related column (usually a key).

-- (11)What do you understand about DDL, DCL, and DML in MySQL? 
DDL (Data Definition Language)
Used to define or change database structure
Examples: CREATE, ALTER, DROP

DML (Data Manipulation Language)
Used to work with data (records)
Examples: INSERT, UPDATE, DELETE, SELECT

DCL (Data Control Language)
Used to control access/permissions
Examples: GRANT, REVOKE

-- (12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
🔹 Role of JOIN:
Connects multiple tables
Retrieves related data in one query
Avoids storing duplicate data
🔹 Common types of JOINs:

INNER JOIN
Returns only matching records from both tables

LEFT JOIN (LEFT OUTER JOIN)
Returns all records from left table + matching from right

RIGHT JOIN (RIGHT OUTER JOIN)
Returns all records from right table + matching from left

FULL JOIN (not directly supported in MySQL)
Returns all records from both tables


