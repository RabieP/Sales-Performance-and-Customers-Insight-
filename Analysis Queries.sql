--Analysis Queries

--Top Performing Products
SELECT TOP 10
	p.Product_ID,
	p.Product_Name,
	SUM(s.Sales_Quantity) AS TotalSalesVolume
FROM 
	tbl_Products p
INNER JOIN tbl_Sales s
ON p.Product_ID = s.Product_ID

GROUP BY 
	p.Product_ID, p.Product_Name
Order By
	TotalSalesVolume DESC

--Customer Segmentation

--By Age Group
SELECT 
	CASE
		WHEN Customer_Age < 18 THEN 'Under 18'
		WHEN Customer_Age BETWEEN 18 AND 24 THEN '18-24'
		WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
		WHEN Customer_Age BETWEEN 35 AND 48 THEN '35-48'
		WHEN Customer_Age BETWEEN 49 AND 64 THEN '49-64'
		ELSE '65 and Above'
	END AS Age_Group,
	COUNT(*) AS CustomerCount
FROM
	tbl_Customers

GROUP BY
	CASE
		WHEN Customer_Age < 18 THEN 'Under 18'
		WHEN Customer_Age BETWEEN 18 AND 24 THEN '18-24'
		WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
		WHEN Customer_Age BETWEEN 35 AND 48 THEN '35-48'
		WHEN Customer_Age BETWEEN 49 AND 64 THEN '49-64'
		ELSE '65 and Above'
	END
ORDER BY
	Age_Group


--By Gender
SELECT 
	Customer_Gender,
	COUNT(*) AS CustomerCount
FROM
	tbl_Customers
GROUP BY 
	Customer_Gender


--Purchase Pattern
SELECT
	c.Customer_ID,
	c.Customer_Name,
	COUNT(s.Sales_ID) AS Total_Purchase,
	SUM(S.Total_Amount) AS Total_Spent,
	AVG(s.Total_Amount) AS Average_PurchaseAmount,
	CASE
		WHEN COUNT(S.Sales_ID) > 10 OR SUM(s.Total_Amount) > 10000 THEN 'High Value'
		WHEN COUNT(S.Sales_ID) > 5 OR SUM(s.Total_Amount) > 5000 THEN 'Medium Value'
		ELSE 'Low Value'
	END AS CustomerSegment
FROM
	tbl_Customers c
LEFT JOIN
	tbl_Sales s
ON
	c.Customer_ID = s.Customer_ID
GROUP BY
	c.Customer_ID, c.Customer_Name
ORDER BY
	Total_Spent DESC


--Regional Sales Trends
SELECT
	r.Region_Name,
	p.Product_Category,
	COUNT(s.Sales_ID) AS TotalSales,
	SUM(s.Total_Amount) AS TotalRevenue,
	RANK() OVER (PARTITION BY r.Region_Name ORDER BY SUM(s.Total_Amount) DESC) AS ProductRank
FROM
	tbl_Sales s
	JOIN tbl_Customers c ON s.Customer_ID = c.Customer_ID
	JOIN tbl_Region r ON c.Customer_ID = r.Region_ID
	JOIN tbl_Products p ON s.Product_ID = p.Product_ID
GROUP BY
	r.Region_Name, p.Product_Category
HAVING 
	COUNT(s.Sales_ID) > 0
ORDER BY
	r.Region_Name, TotalRevenue


--Monthly/Quarterly Sales Trends
SELECT 
	FORMAT(s.Sales_Date, 'MM-yyyy') AS SaleMonth,
	COUNT(s.Sales_ID) AS TotalSales,
	SUM(s.Total_Amount) AS TotalRevenue,
	AVG(s.Total_Amount) AS AverageSaleAmount
FROM
	tbl_Sales s
GROUP BY
	FORMAT(s.Sales_Date, 'MM-yyyy')
ORDER BY
	SaleMonth

--For Quarterly Sales
SELECT 
	YEAR(s.Sales_Date) AS SaleYear,
	DATEPART(QUARTER, s.Sales_Date) AS SaleQuarter,
	COUNT(s.Sales_ID) AS TotalSales,
	SUM(s.Total_Amount) AS TotalRevenue,
	AVG(s.Total_Amount) AS AverageSaleAmount
FROM
	tbl_Sales s
GROUP BY
	YEAR(s.Sales_Date),
	DATEPART(QUARTER, s.Sales_Date)
ORDER BY
	SaleYear, SaleQuarter

--Customer Lifetime Value
SELECT
	c.Customer_ID,
	c.Customer_Name,
	SUM(s.Total_Amount) AS TotalRevenue,
	COUNT(s.Sales_ID) AS TotalsSales,
	AVG(s.Total_Amount) AS AverageSaleAmount
FROM
	tbl_Customers C
	LEFT JOIN
		tbl_Sales s
	ON c.Customer_ID = s.Customer_ID
GROUP BY
	c.Customer_ID, c.Customer_Name
ORDER BY
	TotalRevenue DESC


--Average Order Value
SELECT
	c.Customer_ID,
	c.Customer_Name,
	AVG(s.Total_Amount) AS AverageSaleAmount
FROM
	tbl_Customers C
	LEFT JOIN
		tbl_Sales s
	ON c.Customer_ID = s.Customer_ID
GROUP BY
	c.Customer_ID, c.Customer_Name
ORDER BY
	AverageSaleAmount DESC