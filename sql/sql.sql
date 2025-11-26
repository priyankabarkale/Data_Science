-- Step 1: Create Database : Mydb_ItVedant

# Syntax: Create Database If Not Exists <DatabaseName>;

Create Database If Not Exists Mydb_ItVedant;

# Step 2: Use Database: Mydb_ItVedant

# Synatx: Use <DatabaseName>;

Use Mydb_ItVedant;

# Show Databases

# Synatx: Show Databases;

Show Databases;


# Step 3: Create Tables inside Database: Mydb_ItVedant

# Synatx: Create Table <TableName> (Field1 Datatype, Field2 Datatype); 

CREATE TABLE Employee (
    Id INT,
    Name VARCHAR(20),
    Age INT
); 

# Checking Tables inside Database

Show Tables;

# Using Select Statement: Retrival of Data

# Syntax: Select * From <TableName>;
# Syntax: Select Field1, Field2 From <TableName>;

SELECT 
    *
FROM
    Employee;
    
SELECT 
    Name, Age
FROM
    Employee;
    
# Day 02:

# Insert Statement : Inserting the Values inside Table 

Insert into Employee Values (1,'Modi',30);

Insert into Employee (Id,Name,Age) Values (2,'Rahul',32);

Select * From Employee;

# Using Aggregate Function with Select Statement

SELECT 
    AVG(Age) AS Average_Age
FROM
    Employee;

SELECT 
    COUNT(ID) AS Total_Count
FROM
    Employee;
    
Select Count(Distinct(Age)) As Distinct_Age
From Employee;

SELECT 
    MIN(Age) AS Minimum_Age,
    MAX(Age) AS Maximum_Age,
    AVG(Age) AS Average_Age
FROM
    Employee;
    
SELECT 
    COUNT(*) AS Total_Count
FROM
    Employee;
    
# Insert Multiple Entries in Table

Insert into Employee Values 
(3,'Amit',30),
(4,'Rohan',36),
(5,'Rihan',45),
(6,'Priti',45);

Select * From Employee;

# Using Like Operator: Like Operator is used to get the data based on filter
# Where is used for Condition : Conditional Statement : Where Clause
# 'R%':-> This will gives the output starting with letter 'R'
# '%R':-> This will gives the output ending with letter 'R'
# '[A-R]%':-> This will gives the output start with letter A and ending with letter 'R'

SELECT 
    Name
FROM
    Employee
WHERE
    Name LIKE 'R%'; 

# Exercise:
-- Q1. Calculate Average Age of People 
-- Q2. Calculate Unique Age group of People 
-- Q3. Evaluate the name of the people having age 30 
-- Q4. Calculate Count of people having age greater than 30

-- A1.
SELECT 
    AVG(Age) AS Average_Age
FROM
    Employee;

-- A2.
SELECT 
    COUNT(DISTINCT (Age)) AS Distinct_AgeGroup
FROM
    Employee;

-- A3.
SELECT 
    Name
FROM
    Employee
WHERE
    Age = 30;
    
-- A4. 
SELECT 
    COUNT(*) AS Total_Count
FROM
    Employee
WHERE
    Age > 30;
    
# Day 03:

-- Create Table : Department

Create Table Department (
id int Not Null Unique,
name varchar(20) Not Null,
location varchar(10) Not Null,
mobileno int Not Null);

# Describe Table : Describe <TableName>; or Desc <TableName>;

Describe Department;

Desc Employee;

# Alter Statement

Alter Table Department 
Modify MobileNo BigInt Not Null;

Alter Table Department
Modify Name Varchar(10) Not Null;

Alter Table Department
Modify Location Varchar(8) Not Null;

Insert into Department Values (1,'Raj','Mumbai',9870335690);

Alter Table Department
Add Column Salary Bigint Not null;

Describe Department;

Select * from Department;

Alter Table Department
Rename column Name to Department_Name;

Alter Table Department
Drop Column Salary;

Describe Department;


-- Q1. Create Database: Mydb
-- Q2. Create Table: Student_Info
-- Q3. Add the Entities inside table: Student_info
--     Student_id,Student_Name,Student_Age,Student_MobileNo,Student_Address,Domain
-- Q4. Alter the Datatype of Student id int to Varchar(7)
-- Q5. Rename Column Domain to Student_Domain
-- Q6. Check Description of Table and Insert Five Values 

-- A1. 
Create Database If Not Exists Mydb;

-- A2 & A3.
Create Table Student_info (
Student_ID int not null unique,
Student_Name varchar(10) Not Null,
Student_Age int Not Null,
Student_MobileNo BigInt Not Null,
Student_Address Text Not Null,
Domain Varchar(10) Not Null);

-- A4.
Alter Table Student_Info
Modify Student_ID Varchar(7) Not Null Unique;

-- A5.
Alter Table Student_Info
Rename Column Domain to Student_Domain;

-- Checking Description of Table: Student_Info
Describe Student_Info;

-- A6.
Insert into Student_Info Values 
('125A001','Raj',34,9000000001,'Mumbai','IT'),
('125A002','Raju',35,9000000002,'Mumbai','Finance'),
('125A003','Biju',36,9000000003,'Delhi','HR'),
('125A004','Jayesh',37,9000000004,'Pune','HR'),
('124A001','Ritesh',38,9000000005,'Pune','IT');

-- To Retrive the Information using Select Statement

Select * From Student_Info;


# Day 04

-- Create a Database for Company : ABC

Create Database If Not Exists ABC;

-- Use Database

Use ABC;

-- Create Three Tables : Drivers,Riders,Transactions

CREATE TABLE Drivers (
    Driver_ID INT PRIMARY KEY NOT NULL UNIQUE,
    DriverName VARCHAR(10) NOT NULL,
    Driver_Age INT NOT NULL,
    Driver_MobileNo INT NOT NULL,
    Driver_Address VARCHAR(10) NOT NULL
);

CREATE TABLE Riders (
    Rider_id INT PRIMARY KEY NOT NULL UNIQUE,
    Rider_name VARCHAR(10) NOT NULL,
    Rider_age INT NOT NULL,
    Rider_address VARCHAR(10) NOT NULL,
    Rider_MobileNo INT NOT NULL,
    Rider_gender ENUM('Male', 'Female', 'Others') );

CREATE TABLE Transactions (
    rider_id INT,
    driver_id INT,
    Transaction_ID INT PRIMARY KEY NOT NULL UNIQUE,
    Transaction_Mode ENUM('UPI', 'Cash', 'Card') DEFAULT 'Cash',
    Transaction_Amount BIGINT NOT NULL,
    Transaction_DistanceKM INT NOT NULL,
    FOREIGN KEY (Rider_ID)
        REFERENCES Riders (Rider_ID),
    FOREIGN KEY (Driver_ID)
        REFERENCES Drivers (Driver_ID)
);

-- Describe <TableName>

Describe Transactions;
Describe Riders;
Describe Drivers;

-- Using Alter Statement to Change the Framework

Alter Table Drivers
Modify Driver_MobileNo BigInt Not Null;

Alter Table Riders
Modify Rider_MobileNo BigInt Not Null;

Alter Table Riders
Modify Rider_Gender ENUM('Male', 'Female', 'Others') Not Null;

-- Using Insert Statement
Insert into Riders Values 
(1,'Raj',23,'Mumbai',9000000001,'Male'),
(2,'Raju',31,'Mumbai',9000000002,'FeMale'),
(3,'Biju',37,'Pune',9000000003,'FeMale'),
(4,'jayesh',35,'Pune',9000000004,'FEMale'),
(5,'Nagesh',45,'Delhi',9000000005,'others');

Insert into Drivers Values 
(11,'Jay',30,9100000001,'Thane'),
(12,'Jayesh',31,9100000002,'Thane'),
(13,'Ajay',34,9100000003,'Kalyan'),
(14,'Vijay',46,9100000004,'Kalyan'),
(15,'Sujay',45,9100000005,'Mumbai');

Insert into Transactions Values
(1,11,111,"UPI",3000,35),
(2,12,112,"UPI",4000,19),
(3,13,113,"Card",5000,15),
(4,14,114,"Cash",3500,25),
(5,15,115,"Cash",5500,45);

-- Using Select Statement

SELECT 
    *
FROM
    Drivers;
    
SELECT 
    *
FROM
    Riders;
    
SELECT 
    *
FROM
    Transactions;
    
    SELECT 
    DriverName, Driver_Age, COUNT(Driver_Age)
FROM
    Drivers
GROUP BY DriverName , Driver_Age
ORDER BY Driver_Age
LIMIT 2;

 SELECT 
    DriverName, Driver_Age, COUNT(Driver_Age)
FROM
    Drivers
GROUP BY DriverName , Driver_Age
ORDER BY DriverName ASC
LIMIT 2;

-- Q1. How many riders are from Address :"Mumbai"

-- A1. 
SELECT 
    COUNT(*) AS Total_Count
FROM
    Riders
WHERE
    Rider_Address = 'Mumbai';

-- Q2. What is the Average age of people having gender = "Male"

-- A2. 
SELECT 
    AVG(Rider_Age) AS Average_Age
FROM
    Riders
WHERE
    Rider_Gender = 'Male';

-- Q3. Calculate the Sum of Transaction_Amount having Transaction_mode = "Cash"

-- A3.
SELECT 
    SUM(Transaction_Amount) AS Transaction_Sum
FROM
    Transactions
WHERE
    Transaction_Mode = 'Cash';
    
    SELECT * FROM Riders;
    
    UPDATE Riders 
SET 
    Rider_Age = 32
WHERE
    Rider_id = 1;
    
    SELECT * FROM Transactions;
    
   UPDATE Transactions 
SET 
    Transaction_DistanceKM = 25
WHERE
    Transaction_ID = 114; 
    
    SELECT * FROM Drivers;
    
    DELETE FROM Drivers 
WHERE
    Driver_ID = 14;
    
-- Q1. Create Database: XYZ
-- Q2. Create Schema for company Domain : Mozila
-- Q3. Create Tables: Employee,HR,Performance
-- Q4. Apply Insert statment, Update statment and alter tables
-- Q5. Create ER Diagram for company : Mozila

CREATE DATABASE XYZ;

CREATE SCHEMA Mozila;

USE Mozila;

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY UNIQUE NOT NULL,
    Employee_name VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Department VARCHAR(40) NOT NULL,
    MobileNo INT NOT NULL,
    Employee_Gender ENUM('Male', 'Female', 'Others') NOT NULL
);

CREATE TABLE HR (
    HR_ID INT NOT NULL UNIQUE,
    HR_Name VARCHAR(50) NOT NULL,
    HR_Salary VARCHAR(40) NOT NULL,
    HR_MobileNo BIGINT NOT NULL,
    HR_Gender ENUM('Male', 'Female', 'Others') NOT NULL
);
    
CREATE TABLE Performance (
    Performance_ID INT PRIMARY KEY UNIQUE NOT NULL,
    Rating VARCHAR(20) NOT NULL,
    Goal_Achived TEXT NOT NULL,
    Review_date DATE NOT NULL,
   Employee_ID INT,
   FOREIGN KEY (Employee_ID)
        REFERENCES Employee (Employee_ID)
);



Alter Table Emnployee
Modify MobileNo BigInt Not Null;

INSERT INTO Employee (Employee_ID,Employee_name,Position,Department,MobileNo, Employee_Gender) VALUES 
(1,'PRIYA','Software Engineer','Engineering','9090','Female'),
(2,'DUHITA','Chemical Engineer','Engineering','5050','Female'),
(3,'Virat','Data Engineer','Computer Science','6060','Male'),
(4,'Raj','Product Manager','Product','9080','Male'),
(5,'Riya','HR Manager','HR','9055','Female'),
(6,'Sujal','Electrical Engineer','Engineering','9070','Male'),
(7,'Kumar','HR Manager','HR','8080','Male'),
(8,'Pratik','Mechanical Engineer','Engineering','9990','Male'),
(9,'Varun','HR Manager','HR','6052','Male'),
(10,'Priya','Data Engineer','Computer Science','9050','Female');


INSERT INTO HR (HR_ID,HR_Name,HR_Salary,HR_MobileNO,HR_Gender) VALUES
(1,'Amit','20000','9000000001','Male'),
(2,'Anil','30000','9000000002','Male'),
(3,'Avita','35000','9000000003','Female'),
(4,'Sakshi','45000','9000000004','Female'),
(5,'Dattu','29000','9000000005','Male'),
(6,'Anil','20000','9000000006','Male'),
(7,'Akanksha','25000','9000000007','Female'),
(8,'Raj','25600','9000000008','Male'),
(9,'Pratham','60000','9000000009','Male'),
(10,'Vaishali','35000','9000000023','Female');


INSERT INTO Performance (Performance_ID,Rating, Goal_Achived,Review_Date,Employee_ID) VALUES
(1,'Good','Complete Project X','2025-9-10',1),
(2,'Very Good','Complete Task Y','2025-9-11',2),
(3,'Good','Complete Data cleaning','2025-9-12',3),
(4,'Excellent','Successfully handle employee relations cases','2025-9-13',4),
(5,'Average','Complete Project Z','2025-9-14',5),
(6,'Good','Complete Project F by 50%','2025-9-14',5),
(7,'Very Good','Complete Project Z','2025-9-14',5),
(8,'Excellent','Successfully handle HR relations cases','2025-9-14',5),
(9,'Average','Complete Project Z by 60%','2025-9-14',5),
(10,'Good','Complete Project xyz','2025-9-14',5);

UPDATE Employee 
SET 
    Position = Engineering
WHERE
    Employee_ID = 3;
    
    SELECT 
    *
FROM
    Employee;
    
    SELECT 
    *
FROM
    HR;
    
    SELECT 
    *
FROM
    Performance;
    

    

    
    
    

    
    
    