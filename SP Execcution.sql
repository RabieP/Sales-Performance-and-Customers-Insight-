--Store Prcedure Execution

--Inserting Records into Customer Table
EXEC sp_InsertCustomers  @Customer_Name = 'Aarav Patel', @Customer_Age = 28, @Customer_Gender = 'M', @Customer_Location = 'Mumbai'
EXEC sp_InsertCustomers  @Customer_Name = 'Diya Sharma', @Customer_Age = 35, @Customer_Gender = 'F', @Customer_Location = 'Delhi'
EXEC sp_InsertCustomers  @Customer_Name = 'Arjun Singh', @Customer_Age = 42, @Customer_Gender = 'M', @Customer_Location = 'Bangalore'
EXEC sp_InsertCustomers  @Customer_Name = 'Ananya Gupta', @Customer_Age = 31, @Customer_Gender = 'F', @Customer_Location = 'Hyderabad'
EXEC sp_InsertCustomers  @Customer_Name = 'Vihaan Kumar', @Customer_Age = 39, @Customer_Gender = 'M', @Customer_Location = 'Chennai'
EXEC sp_InsertCustomers  @Customer_Name = 'Zara Reddy', @Customer_Age = 26, @Customer_Gender = 'F', @Customer_Location = 'Kolkata'
EXEC sp_InsertCustomers  @Customer_Name = 'Advait Chopra', @Customer_Age = 45, @Customer_Gender = 'M', @Customer_Location = 'Pune'
EXEC sp_InsertCustomers  @Customer_Name = 'Ishaan Mehta', @Customer_Age = 33, @Customer_Gender = 'M', @Customer_Location = 'Ahmedabad'
EXEC sp_InsertCustomers  @Customer_Name = 'Riya Desai', @Customer_Age = 29, @Customer_Gender = 'F', @Customer_Location = 'Jaipur'
EXEC sp_InsertCustomers  @Customer_Name = 'Kabir Joshi', @Customer_Age = 37, @Customer_Gender = 'M', @Customer_Location = 'Lucknow'
EXEC sp_InsertCustomers  @Customer_Name = 'Aisha Kapoor', @Customer_Age = 30, @Customer_Gender = 'F', @Customer_Location = 'Mumbai'
EXEC sp_InsertCustomers  @Customer_Name = 'Vivaan Malhotra', @Customer_Age = 41, @Customer_Gender = 'M', @Customer_Location = 'Delhi'
EXEC sp_InsertCustomers  @Customer_Name = 'Mira Choudhury', @Customer_Age = 27, @Customer_Gender = 'F', @Customer_Location = 'Bangalore'
EXEC sp_InsertCustomers  @Customer_Name = 'Reyansh Verma', @Customer_Age = 36, @Customer_Gender = 'M', @Customer_Location = 'Hyderabad'
EXEC sp_InsertCustomers  @Customer_Name = 'Saanvi Rao', @Customer_Age = 32, @Customer_Gender = 'F', @Customer_Location = 'Chennai'
EXEC sp_InsertCustomers  @Customer_Name = 'Dhruv Saxena', @Customer_Age = 44, @Customer_Gender = 'M', @Customer_Location = 'Kolkata'
EXEC sp_InsertCustomers  @Customer_Name = 'Aditi Banerjee', @Customer_Age = 25, @Customer_Gender = 'F', @Customer_Location = 'Pune'
EXEC sp_InsertCustomers  @Customer_Name = 'Arnav Mukherjee', @Customer_Age = 38, @Customer_Gender = 'M', @Customer_Location = 'Ahmedabad'
EXEC sp_InsertCustomers  @Customer_Name = 'Myra Agarwal', @Customer_Age = 34, @Customer_Gender = 'F', @Customer_Location = 'Jaipur'
EXEC sp_InsertCustomers  @Customer_Name = 'Yuvan Nair', @Customer_Age = 40, @Customer_Gender = 'M', @Customer_Location = 'Lucknow'

--Inserting Records Into Product Table
EXEC sp_InsertProducts @Product_Name = 'Smartphone X', @Product_Category = 'Electronics', @Product_Price = 45000.00
EXEC sp_InsertProducts @Product_Name = 'Leather Wallet', @Product_Category = 'Accessories', @Product_Price = 3500.00
EXEC sp_InsertProducts @Product_Name = 'Running Shoes', @Product_Category = 'Footwear', @Product_Price = 6000.00
EXEC sp_InsertProducts @Product_Name = 'Coffee Maker', @Product_Category = 'Home Appliances', @Product_Price = 5500.00
EXEC sp_InsertProducts @Product_Name = 'Wireless Earbuds', @Product_Category = 'Electronics', @Product_Price = 9000.00
EXEC sp_InsertProducts @Product_Name = 'Yoga Mat', @Product_Category = 'Fitness', @Product_Price = 2000.00
EXEC sp_InsertProducts @Product_Name = 'Stainless Steel Water Bottle', @Product_Category = 'Kitchenware', @Product_Price = 1500.00
EXEC sp_InsertProducts @Product_Name = 'Backpack', @Product_Category = 'Bags', @Product_Price = 4500.00
EXEC sp_InsertProducts @Product_Name = 'Wireless Mouse', @Product_Category = 'Computer Accessories', @Product_Price = 2500.00
EXEC sp_InsertProducts @Product_Name = 'Portable Charger', @Product_Category = 'Electronics', @Product_Price = 3000.00
EXEC sp_InsertProducts @Product_Name = 'Sunglasses', @Product_Category = 'Accessories', @Product_Price = 5000.00
EXEC sp_InsertProducts @Product_Name = 'Blender', @Product_Category = 'Home Appliances', @Product_Price = 4000.00
EXEC sp_InsertProducts @Product_Name = 'Dress Shirt', @Product_Category = 'Clothing', @Product_Price = 3500.00
EXEC sp_InsertProducts @Product_Name = 'Desk Lamp', @Product_Category = 'Home Decor', @Product_Price = 2000.00
EXEC sp_InsertProducts @Product_Name = 'Wireless Keyboard', @Product_Category = 'Computer Accessories', @Product_Price = 4000.00
EXEC sp_InsertProducts @Product_Name = 'Fitness Tracker', @Product_Category = 'Electronics', @Product_Price = 7000.00
EXEC sp_InsertProducts @Product_Name = 'Cookware Set', @Product_Category = 'Kitchenware', @Product_Price = 10000.00
EXEC sp_InsertProducts @Product_Name = 'Bluetooth Speaker', @Product_Category = 'Electronics', @Product_Price = 5500.00
EXEC sp_InsertProducts @Product_Name = 'Hiking Boots', @Product_Category = 'Footwear', @Product_Price = 8000.00
EXEC sp_InsertProducts @Product_Name = 'Digital Camera', @Product_Category = 'Electronics', @Product_Price = 30000.00

--Inserting Records Into Sales Table
EXEC sp_InsertSales @Customer_ID = 1, @Product_ID = 5, @Sales_Date = '2023-05-01', @Sales_Quantity = 2
EXEC sp_InsertSales @Customer_ID = 3, @Product_ID = 12, @Sales_Date = '2023-05-02', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 7, @Product_ID = 8, @Sales_Date = '2023-05-03', @Sales_Quantity = 3
EXEC sp_InsertSales @Customer_ID = 2, @Product_ID = 15, @Sales_Date = '2023-05-04', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 9, @Product_ID = 3, @Sales_Date = '2023-05-05', @Sales_Quantity = 2
EXEC sp_InsertSales @Customer_ID = 14, @Product_ID = 7, @Sales_Date = '2023-05-06', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 6, @Product_ID = 18, @Sales_Date = '2023-05-07', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 11, @Product_ID = 1, @Sales_Date = '2023-05-08', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 18, @Product_ID = 9, @Sales_Date = '2023-05-09', @Sales_Quantity = 2
EXEC sp_InsertSales @Customer_ID = 4, @Product_ID = 20, @Sales_Date = '2023-05-10', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 13, @Product_ID = 6, @Sales_Date = '2023-05-11', @Sales_Quantity = 3
EXEC sp_InsertSales @Customer_ID = 8, @Product_ID = 14, @Sales_Date = '2023-05-12', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 16, @Product_ID = 2, @Sales_Date = '2023-05-13', @Sales_Quantity = 2
EXEC sp_InsertSales @Customer_ID = 5, @Product_ID = 17, @Sales_Date = '2023-05-14', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 19, @Product_ID = 10, @Sales_Date = '2023-05-15', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 10, @Product_ID = 13, @Sales_Date = '2023-05-16', @Sales_Quantity = 2
EXEC sp_InsertSales @Customer_ID = 15, @Product_ID = 4, @Sales_Date = '2023-05-17', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 20, @Product_ID = 11, @Sales_Date = '2023-05-18', @Sales_Quantity = 1
EXEC sp_InsertSales @Customer_ID = 12, @Product_ID = 19, @Sales_Date = '2023-05-19', @Sales_Quantity = 2
EXEC sp_InsertSales @Customer_ID = 17, @Product_ID = 16, @Sales_Date = '2023-05-20', @Sales_Quantity = 1

--Inserting Region Records
EXEC sp_InsertRegion @Region_Name = 'North India'
EXEC sp_InsertRegion @Region_Name = 'South India'
EXEC sp_InsertRegion @Region_Name = 'East India'
EXEC sp_InsertRegion @Region_Name = 'West India'
EXEC sp_InsertRegion @Region_Name = 'Central India'
EXEC sp_InsertRegion @Region_Name = 'Northeast India'
EXEC sp_InsertRegion @Region_Name = 'Northwest India'
EXEC sp_InsertRegion @Region_Name = 'Southeast India'
EXEC sp_InsertRegion @Region_Name = 'Southwest India'
EXEC sp_InsertRegion @Region_Name = 'Indo-Gangetic Plain'
EXEC sp_InsertRegion @Region_Name = 'Deccan Plateau'
EXEC sp_InsertRegion @Region_Name = 'Western Ghats'
EXEC sp_InsertRegion @Region_Name = 'Eastern Ghats'
EXEC sp_InsertRegion @Region_Name = 'Thar Desert'
EXEC sp_InsertRegion @Region_Name = 'Himalayan Region'
EXEC sp_InsertRegion @Region_Name = 'Coastal India'
EXEC sp_InsertRegion @Region_Name = 'Andaman and Nicobar Islands'
EXEC sp_InsertRegion @Region_Name = 'Lakshadweep Islands'
EXEC sp_InsertRegion @Region_Name = 'Gujarat Region'
EXEC sp_InsertRegion @Region_Name = 'Maharashtra Region'

--Total AMount
EXEC sp_TotalAmount