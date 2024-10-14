--DB CREATE
CREATE DATABASE Projects

--Use DB
USE Projects

--Customers Table
CREATE TABLE tbl_Customers(
	Customer_ID INT PRIMARY KEY IDENTITY(1,1),
	Customer_Name NVARCHAR(20),
	Customer_Age INT,
	Customer_Gender VARCHAR(1),
	Customer_Location NVARCHAR(100),
);
SELECT * FROM tbl_Customers


ALTER TABLE tbl_Customers
ALTER COLUMN Customer_Location NVARCHAR(100);
EXEC sp_rename 'tbl_Customers.Customer_Location', 'Customer_Region', 'COLUMN';

ALTER TABLE tbl_Customers
ADD Region_ID INT
FOREIGN KEY (Region_ID) REFERENCES tbl_Region(Region_ID) 



--Product Table
CREATE TABLE tbl_Products(
	Product_ID INT PRIMARY KEY IDENTITY(1,1),
	Product_Name NVARCHAR(100),
	Product_Category NVARCHAR(50),
	Product_Price DECIMAL(10,2)
);

SELECT * FROM tbl_Products
--Sales Table
CREATE TABLE tbl_Sales(
	Sales_ID INT PRIMARY KEY IDENTITY(1,1),
	Customer_ID INT,
	Product_ID INT,
	Sales_Date DATE,
	Sales_Quantity INT,
	Total_Amount DECIMAL(10,2)

	FOREIGN KEY (Customer_ID) REFERENCES tbl_Customers(Customer_ID),
	FOREIGN KEY (Product_ID) REFERENCES tbl_Products(Product_ID) 
);

SELECT * FROM tbl_Sales

--Region Table
CREATE TABLE tbl_Region(
	Region_ID INT PRIMARY KEY IDENTITY (1,1),
	Region_Name VARCHAR(50)
);
SELECT * FROM tbl_Region


--Delete Dupes Records
WITH CTE_Duplicates AS (
    SELECT 
        Sales_ID,
        ROW_NUMBER() OVER (
            PARTITION BY Customer_ID, Product_ID, Sales_Date, Sales_Quantity, Total_Amount 
            ORDER BY Sales_ID
        ) AS RowNum
    FROM tbl_Sales
)
DELETE FROM CTE_Duplicates
WHERE RowNum > 1;
