use [DataBase]
go

--DROP TABLE Orders
--go
--DROP TABLE Products
--go
--DROP TABLE Brands
--go
--DROP TABLE Categories
--go
--DROP TABLE Suppliers
--go
--DROP TABLE Warehouses
--go

CREATE TABLE Warehouses
(
	WarehouseID int PRIMARY KEY IDENTITY(1, 1),
	WarehouseName nvarchar(100) NOT NULL,
	Country nvarchar(3) NOT NULL,
	GroupName nvarchar(50) NOT NULL,
	SalesYTD money NOT NULL,
	SalesLastYear money NOT NULL,
	ModifiedDate datetime NOT NULL
)
ON fast_tables
go

CREATE TABLE Suppliers
(
	SupplierID int PRIMARY KEY IDENTITY(1, 1),
	SupplierName nvarchar(100) NOT NULL,
	Phone nvarchar(30),
	Email nvarchar(50),
	City nvarchar(50),
	WarehouseID int NOT NULL
		REFERENCES Warehouses(WarehouseID),
	ModifiedDate datetime NOT NULL
)
ON fast_tables
go

CREATE TABLE Categories
(
	CategoryID int PRIMARY KEY IDENTITY(1, 1),
	CategoryName nvarchar(100) NOT NULL,
	Description nvarchar(100),
	Code nvarchar(20),
	IsActive int NOT NULL,
	SupplierID int NOT NULL
		REFERENCES Suppliers(SupplierID),
	ModifiedDate datetime NOT NULL
)
ON fast_tables
go

CREATE TABLE Brands
(
	BrandID int PRIMARY KEY IDENTITY(1, 1),
	BrandName nvarchar(100) NOT NULL,
	Country nvarchar(50),
	Code nvarchar(20),
	IsActive int NOT NULL,
	CategoryID int NOT NULL
		REFERENCES Categories(CategoryID),
	ModifiedDate datetime NOT NULL
)
ON slow_tables
go

CREATE TABLE Products
(
	ProductID int PRIMARY KEY IDENTITY(1, 1),
	ProductName nvarchar(100) NOT NULL,
	ProductNumber nvarchar(40) NOT NULL,
	StandardCost money NOT NULL,
	ListPrice money NOT NULL,
	Color nvarchar(20),
	BrandID int NOT NULL
		REFERENCES Brands(BrandID)
)
ON slow_tables
go

CREATE TABLE Orders
(
	OrderID int PRIMARY KEY IDENTITY(1, 1),
	OrderNumber nvarchar(25) NOT NULL,
	OrderDate datetime NOT NULL,
	Status tinyint NOT NULL,
	SubTotal money NOT NULL,
	TaxAmt money NOT NULL,
	ProductID int NOT NULL
		REFERENCES Products(ProductID)
)
ON slow_tables
go

INSERT INTO Warehouses (WarehouseName, Country, GroupName, SalesYTD, SalesLastYear, ModifiedDate)
SELECT Name, 'US', 'Store', 0, 0, ModifiedDate
FROM AdventureWorks2019.Sales.Store
go

INSERT INTO Suppliers (SupplierName, Phone, Email, City, WarehouseID, ModifiedDate)
SELECT Name, AccountNumber, AccountNumber, Name, 1, ModifiedDate
FROM AdventureWorks2019.Purchasing.Vendor
go

INSERT INTO Categories (CategoryName, Description, Code, IsActive, SupplierID, ModifiedDate)
SELECT Name, Name, Name, 1, 1, ModifiedDate
FROM AdventureWorks2019.Production.ProductSubcategory
go

INSERT INTO Brands (BrandName, Country, Code, IsActive, CategoryID, ModifiedDate)
SELECT Name, Name, ProductNumber, 1, 1, ModifiedDate
FROM AdventureWorks2019.Production.Product
go

INSERT INTO Products (ProductName, ProductNumber, StandardCost, ListPrice, Color, BrandID)
SELECT Name, ProductNumber, StandardCost, ListPrice, Color, 1
FROM AdventureWorks2019.Production.Product
go

INSERT INTO Orders (OrderNumber, OrderDate, Status, SubTotal, TaxAmt, ProductID)
SELECT SalesOrderNumber, OrderDate, Status, SubTotal, TaxAmt, 1
FROM AdventureWorks2019.Sales.SalesOrderHeader
go

SELECT * FROM Warehouses
go

SELECT * FROM Suppliers
go

SELECT * FROM Categories
go

SELECT * FROM Brands
go

SELECT * FROM Products
go

SELECT * FROM Orders
go
