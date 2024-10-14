--Advanced Analysis

--Top Customer Based Spendinng
WITH RankedCustomer AS(
	SELECT
		c.Customer_ID,
		c.Customer_Name,
		SUM(s.Total_Amount) AS TotalSpending,
		DENSE_RANK() OVER (ORDER BY SUM(s.Total_Amount) DESC) AS SpendingRank
	FROM
		tbl_Customers c
		LEFT JOIN
			tbl_Sales s 
		ON
			c.Customer_ID = s.Customer_ID
	GROUP BY
		c.Customer_ID, c.Customer_Name
)
SELECT
	Customer_ID,
	Customer_Name,
	TotalSpending,
	SpendingRank
FROM	
	RankedCustomer
WHERE 
	SpendingRank <= 10;

--Product Performence
WITH ProductSales AS(
	SELECT
		p.Product_ID,
		p.Product_Name,
		FORMAT(s.Sales_Date, 'MM - yyyy') AS SaleMonth,
		SUM(s.Total_Amount) AS TotalSales
	FROM 
		tbl_Products p
	JOIN
		tbl_Sales s
	ON
		p.Product_ID = s.Product_ID
	GROUP BY
		p.Product_ID, p.Product_Name, FORMAT(s.Sales_Date, 'MM - yyyy')
),
MonthlyGrowth AS(
	SELECT
		Product_ID,
		Product_Name,
		SaleMonth,
		TotalSales,
		LAG(TOtalSales) OVER (PARTITION BY Product_ID ORDER BY SaleMonth) AS PreviousMonthSales,
		(TotalSales - LAG(TotalSales) OVER (PARTITION BY Product_ID ORDER BY SaleMonth)) AS MonthlyGrowth

	FROM
		ProductSales
)

SELECT
	Product_ID
	Product_Name,
	SaleMonth,
	TotalSales,
	MonthlyGrowth
FROM
	MonthlyGrowth
WHERE 
	MonthlyGrowth IS NOT NULL --Single month records so no output will be show


-- Identify Sales Outliers
WITH SalesData AS(
SELECT 
	Sales_ID,
	Sales_Date,
	Total_Amount,
	AVG(Total_Amount) OVER () AS AverageSales,
	STDEV(Total_Amount) OVER () AS StandardDeviation,
	CASE
		WHEN Total_Amount > AVG(Total_Amount) OVER() + 2 * STDEV(Total_Amount) OVER() THEN 'High Outlier'
		WHEN Total_Amount < AVG(Total_Amount) OVER() - 2 * STDEV(Total_Amount) OVER() THEN 'Low Outlier'
		ELSE 'Normal'
	END AS SaleStatus
FROM
	tbl_Sales
)
SELECT
	Sales_ID,
	Sales_Date,
	AverageSales,
	StandardDeviation,
	SaleStatus
FROM
	SalesData
WHERE 
	SaleStatus IN ('High Outlier', 'Low Outlier')