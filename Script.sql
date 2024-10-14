USE [Projects]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProducts]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_UpdateProducts]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomers]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_UpdateCustomers]
GO
/****** Object:  StoredProcedure [dbo].[sp_TotalAmount]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_TotalAmount]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSales]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_InsertSales]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRegion]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_InsertRegion]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProducts]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_InsertProducts]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomers]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_InsertCustomers]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProducts]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_DeleteProducts]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCustomer]    Script Date: 11-10-2024 02:18:09 ******/
DROP PROCEDURE [dbo].[sp_DeleteCustomer]
GO
ALTER TABLE [dbo].[tbl_Sales] DROP CONSTRAINT [FK__tbl_Sales__Total__4D94879B]
GO
ALTER TABLE [dbo].[tbl_Sales] DROP CONSTRAINT [FK__tbl_Sales__Produ__4E88ABD4]
GO
ALTER TABLE [dbo].[tbl_Customers] DROP CONSTRAINT [FK__tbl_Custo__Regio__5BE2A6F2]
GO
/****** Object:  Table [dbo].[tbl_Sales]    Script Date: 11-10-2024 02:18:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Sales]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_Sales]
GO
/****** Object:  Table [dbo].[tbl_Region]    Script Date: 11-10-2024 02:18:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Region]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_Region]
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 11-10-2024 02:18:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Products]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_Products]
GO
/****** Object:  Table [dbo].[tbl_Customers]    Script Date: 11-10-2024 02:18:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Customers]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_Customers]
GO
USE [master]
GO
/****** Object:  Database [Projects]    Script Date: 11-10-2024 02:18:09 ******/
DROP DATABASE [Projects]
GO
/****** Object:  Database [Projects]    Script Date: 11-10-2024 02:18:09 ******/
CREATE DATABASE [Projects]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projects', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Projects.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projects_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Projects_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Projects] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projects].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projects] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projects] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projects] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projects] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projects] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projects] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Projects] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projects] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projects] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projects] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projects] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projects] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projects] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projects] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projects] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Projects] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projects] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projects] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projects] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projects] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projects] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projects] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projects] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Projects] SET  MULTI_USER 
GO
ALTER DATABASE [Projects] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projects] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projects] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projects] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projects] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Projects] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Projects] SET QUERY_STORE = ON
GO
ALTER DATABASE [Projects] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Projects]
GO
/****** Object:  Table [dbo].[tbl_Customers]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customers](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [nvarchar](20) NULL,
	[Customer_Age] [int] NULL,
	[Customer_Gender] [varchar](1) NULL,
	[Region_ID] [int] NULL,
 CONSTRAINT [PK__tbl_Cust__8CB286B92F300542] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Products](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](100) NULL,
	[Product_Category] [nvarchar](50) NULL,
	[Product_Price] [decimal](10, 2) NULL,
 CONSTRAINT [PK__tbl_Prod__9834FB9A12EF0B84] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Region]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Region](
	[Region_ID] [int] IDENTITY(1,1) NOT NULL,
	[Region_Name] [varchar](50) NULL,
 CONSTRAINT [PK__tbl_Regi__A9EAD51FC30D6D86] PRIMARY KEY CLUSTERED 
(
	[Region_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Sales]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Sales](
	[Sales_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Sales_Date] [date] NULL,
	[Sales_Quantity] [int] NULL,
	[Total_Amount] [decimal](10, 2) NULL,
 CONSTRAINT [PK__tbl_Sale__32123EFAAA3DD273] PRIMARY KEY CLUSTERED 
(
	[Sales_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Customers] ON 

INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (1, N'Aarav Patel', 28, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (2, N'Diya Sharma', 35, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (3, N'Arjun Singh', 42, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (4, N'Ananya Gupta', 31, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (5, N'Vihaan Kumar', 39, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (6, N'Zara Reddy', 26, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (7, N'Advait Chopra', 45, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (8, N'Ishaan Mehta', 33, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (9, N'Riya Desai', 29, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (10, N'Kabir Joshi', 37, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (11, N'Aisha Kapoor', 30, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (12, N'Vivaan Malhotra', 41, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (13, N'Mira Choudhury', 27, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (14, N'Reyansh Verma', 36, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (15, N'Saanvi Rao', 32, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (16, N'Dhruv Saxena', 44, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (17, N'Aditi Banerjee', 25, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (18, N'Arnav Mukherjee', 38, N'M', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (19, N'Myra Agarwal', 34, N'F', NULL)
INSERT [dbo].[tbl_Customers] ([Customer_ID], [Customer_Name], [Customer_Age], [Customer_Gender], [Region_ID]) VALUES (20, N'Yuvan Nair', 40, N'M', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Products] ON 

INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (1, N'Smartphone X', N'Electronics', CAST(45000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (2, N'Leather Wallet', N'Accessories', CAST(3500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (3, N'Running Shoes', N'Footwear', CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (4, N'Coffee Maker', N'Home Appliances', CAST(5500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (5, N'Wireless Earbuds', N'Electronics', CAST(9000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (6, N'Yoga Mat', N'Fitness', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (7, N'Stainless Steel Water Bottle', N'Kitchenware', CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (8, N'Backpack', N'Bags', CAST(4500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (9, N'Wireless Mouse', N'Computer Accessories', CAST(2500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (10, N'Portable Charger', N'Electronics', CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (11, N'Sunglasses', N'Accessories', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (12, N'Blender', N'Home Appliances', CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (13, N'Dress Shirt', N'Clothing', CAST(3500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (14, N'Desk Lamp', N'Home Decor', CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (15, N'Wireless Keyboard', N'Computer Accessories', CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (16, N'Fitness Tracker', N'Electronics', CAST(7000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (17, N'Cookware Set', N'Kitchenware', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (18, N'Bluetooth Speaker', N'Electronics', CAST(5500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (19, N'Hiking Boots', N'Footwear', CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Products] ([Product_ID], [Product_Name], [Product_Category], [Product_Price]) VALUES (20, N'Digital Camera', N'Electronics', CAST(30000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[tbl_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Region] ON 

INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (1, N'North India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (2, N'South India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (3, N'East India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (4, N'West India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (5, N'Central India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (6, N'Northeast India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (7, N'Northwest India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (8, N'Southeast India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (9, N'Southwest India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (10, N'Indo-Gangetic Plain')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (11, N'Deccan Plateau')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (12, N'Western Ghats')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (13, N'Eastern Ghats')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (14, N'Thar Desert')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (15, N'Himalayan Region')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (16, N'Coastal India')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (17, N'Andaman and Nicobar Islands')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (18, N'Lakshadweep Islands')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (19, N'Gujarat Region')
INSERT [dbo].[tbl_Region] ([Region_ID], [Region_Name]) VALUES (20, N'Maharashtra Region')
SET IDENTITY_INSERT [dbo].[tbl_Region] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Sales] ON 

INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (1, 1, 5, CAST(N'2023-05-01' AS Date), 2, CAST(18000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (2, 3, 12, CAST(N'2023-05-02' AS Date), 1, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (3, 7, 8, CAST(N'2023-05-03' AS Date), 3, CAST(13500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (4, 2, 15, CAST(N'2023-05-04' AS Date), 1, CAST(4000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (5, 9, 3, CAST(N'2023-05-05' AS Date), 2, CAST(12000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (6, 14, 7, CAST(N'2023-05-06' AS Date), 1, CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (7, 6, 18, CAST(N'2023-05-07' AS Date), 1, CAST(5500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (8, 11, 1, CAST(N'2023-05-08' AS Date), 1, CAST(45000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (9, 18, 9, CAST(N'2023-05-09' AS Date), 2, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (10, 4, 20, CAST(N'2023-05-10' AS Date), 1, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (11, 13, 6, CAST(N'2023-05-11' AS Date), 3, CAST(6000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (12, 8, 14, CAST(N'2023-05-12' AS Date), 1, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (13, 16, 2, CAST(N'2023-05-13' AS Date), 2, CAST(7000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (14, 5, 17, CAST(N'2023-05-14' AS Date), 1, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (15, 19, 10, CAST(N'2023-05-15' AS Date), 1, CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (16, 10, 13, CAST(N'2023-05-16' AS Date), 2, CAST(7000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (17, 15, 4, CAST(N'2023-05-17' AS Date), 1, CAST(5500.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (18, 20, 11, CAST(N'2023-05-18' AS Date), 1, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (19, 12, 19, CAST(N'2023-05-19' AS Date), 2, CAST(16000.00 AS Decimal(10, 2)))
INSERT [dbo].[tbl_Sales] ([Sales_ID], [Customer_ID], [Product_ID], [Sales_Date], [Sales_Quantity], [Total_Amount]) VALUES (20, 17, 16, CAST(N'2023-05-20' AS Date), 1, CAST(7000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[tbl_Sales] OFF
GO
ALTER TABLE [dbo].[tbl_Customers]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Custo__Regio__5BE2A6F2] FOREIGN KEY([Region_ID])
REFERENCES [dbo].[tbl_Region] ([Region_ID])
GO
ALTER TABLE [dbo].[tbl_Customers] CHECK CONSTRAINT [FK__tbl_Custo__Regio__5BE2A6F2]
GO
ALTER TABLE [dbo].[tbl_Sales]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Sales__Produ__4E88ABD4] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tbl_Products] ([Product_ID])
GO
ALTER TABLE [dbo].[tbl_Sales] CHECK CONSTRAINT [FK__tbl_Sales__Produ__4E88ABD4]
GO
ALTER TABLE [dbo].[tbl_Sales]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Sales__Total__4D94879B] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[tbl_Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[tbl_Sales] CHECK CONSTRAINT [FK__tbl_Sales__Total__4D94879B]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCustomer]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteCustomer]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProducts]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteProducts]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCustomers]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCustomers]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProducts]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertProducts]
	@Product_Name NVARCHAR(100),
	@Product_Category NVARCHAR(50),
	@Product_Price DECIMAL(10,2)
AS
BEGIN
	INSERT INTO tbl_Products(Product_Name, Product_Category, Product_Price)
	VALUES(@Product_Name, @Product_Category, @Product_Price)

	PRINT('Product Added Successfully')
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRegion]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--For Rwgion Table
CREATE PROCEDURE [dbo].[sp_InsertRegion]
	@Region_Name VARCHAR(50)
AS
BEGIN
	INSERT INTO tbl_Region(Region_Name)
	VALUES(@Region_Name)

	PRINT('Region Addded Succesfully')
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSales]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSales]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_TotalAmount]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--For Total Amount
CREATE PROCEDURE [dbo].[sp_TotalAmount]
AS
BEGIN
	UPDATE tbl_Sales
    SET Total_Amount = s.Sales_Quantity * p.Product_Price
    FROM tbl_Sales s
    JOIN tbl_Products p ON s.Product_ID = p.Product_ID
    WHERE s.Total_Amount IS NULL OR s.Total_Amount = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCustomers]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateCustomers]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateProducts]    Script Date: 11-10-2024 02:18:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateProducts]
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
GO
USE [master]
GO
ALTER DATABASE [Projects] SET  READ_WRITE 
GO
