--Store Procedures

--For Customer Table
--Inserting Records
CREATE PROCEDURE sp_InsertCustomers
	@Customer_Name NVARCHAR(20),
	@Customer_Age INT,
	@Customer_Gender VARCHAR(1),
	@Customer_Location NVARCHAR(100)
AS
BEGIN
	INSERT INTO tbl_Customers(Customer_Name, Customer_Age, Customer_Gender, Customer_Location)
	VALUES (@Customer_Name, @Customer_Age, @Customer_Gender, @Customer_Location)

	PRINT('Added Successfully')
END;

--Updating Records
CREATE PROCEDURE sp_UpdateCustomers
	@Customer_ID INT,
	@Customer_Name NVARCHAR(20),
	@Customer_Age INT,
	@Customer_Gender VARCHAR(1),
	@Customer_Location NVARCHAR(100)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM tbl_Customers WHERE Customer_ID = @Customer_ID) 
	BEGIN
		UPDATE tbl_Customers
		SET Customer_Name = @Customer_Name,
			Customer_Age = @Customer_Age,
			Customer_Location = @Customer_Location
		WHERE Customer_ID = @Customer_ID;
	
		PRINT('Updated Successfully')
	END
	ELSE
	BEGIN
		PRINT('Customer Not Found')
	END
END;

--Deleteing Records
CREATE PROCEDURE sp_DeleteCustomer
	@Customer_ID INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM tbl_Customers WHERE Customer_ID = @Customer_ID)
	BEGIN
		DELETE FROM tbl_Sales 
		WHERE Customer_ID =@Customer_ID; --

		DELETE FROM tbl_Customers
		WHERE Customer_ID =@Customer_ID;

		PRINT('Deleted Successfully')
	END
	ELSE
	BEGIN
		PRINT('Customer Not Found')
	END
END;

--For Products Tables
--Inserting Records
CREATE PROCEDURE sp_InsertProducts
	@Product_Name NVARCHAR(100),
	@Product_Category NVARCHAR(50),
	@Product_Price DECIMAL(10,2)
AS
BEGIN
	INSERT INTO tbl_Products(Product_Name, Product_Category, Product_Price)
	VALUES(@Product_Name, @Product_Category, @Product_Price)

	PRINT('Product Added Successfully')
END;

--Updating Record
CREATE PROCEDURE sp_UpdateProducts
	@Product_ID INT,
	@Product_Name NVARCHAR(100),
	@Product_Category NVARCHAR(50),
	@Product_Price DECIMAL(10,2)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM tbl_Products WHERE Product_ID = @Product_ID)
	BEGIN
		UPDATE tbl_Products
		SET Product_Name = @Product_Name,
			Product_Category = @Product_Category,
			Product_Price = @Product_Price
		WHERE Product_ID = @Product_ID;
	
		PRINT('Product Updated Successfully')
	END
	ELSE
	BEGIN
		PRINT ('Product Does Not Exists')
	END
END;

--Deleteing Records
CREATE PROCEDURE sp_DeleteProducts
	@Product_ID INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM tbl_Products WHERE Product_ID = @Product_ID)
	BEGIN
		DELETE FROM tbl_Sales
		WHERE Product_ID = @Product_ID;

		DELETE FROM tbl_Products
		WHERE Product_ID = @Product_ID;

		PRINT('Product Deleted Successfully')
	END
	ELSE
	BEGIN
		PRINT ('Product Does Not Exists')
	END
END;

--For Sales Table
CREATE PROCEDURE sp_InsertSales
    @Customer_ID INT,
    @Product_ID INT,
    @Sales_Date DATE,
    @Sales_Quantity INT
AS
BEGIN
    INSERT INTO tbl_Sales(Customer_ID, Product_ID, Sales_Date, Sales_Quantity)
    VALUES(@Customer_ID, @Product_ID, @Sales_Date, @Sales_Quantity)

    PRINT('Sale Added Successfully') 
END;

--For Total Amount
CREATE PROCEDURE sp_TotalAmount
AS
BEGIN
	UPDATE tbl_Sales
    SET Total_Amount = s.Sales_Quantity * p.Product_Price
    FROM tbl_Sales s
    JOIN tbl_Products p ON s.Product_ID = p.Product_ID
    WHERE s.Total_Amount IS NULL OR s.Total_Amount = 0;
END

--For Rwgion Table
CREATE PROCEDURE sp_InsertRegion
	@Region_Name VARCHAR(50)
AS
BEGIN
	INSERT INTO tbl_Region(Region_Name)
	VALUES(@Region_Name)

	PRINT('Region Addded Succesfully')
END;