use Data_Base_6
go

CREATE TABLE Warehouses
(
    WarehouseID INT IDENTITY(1,1) PRIMARY KEY,
    WarehouseName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255)
);
GO

CREATE TABLE Suppliers
(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName NVARCHAR(150) NOT NULL,
    Phone NVARCHAR(30),
    WarehouseID INT NOT NULL
        REFERENCES Warehouses(WarehouseID)
);
GO

CREATE TABLE Categories
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    SupplierID INT NOT NULL
        REFERENCES Suppliers(SupplierID)
);
GO

CREATE TABLE Brands
(
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(100) NOT NULL,
    Country NVARCHAR(100),
    CategoryID INT NOT NULL
        REFERENCES Categories(CategoryID)
);
GO

CREATE TABLE Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,

    BrandID INT NOT NULL
        REFERENCES Brands(BrandID),

    CategoryID INT NOT NULL
        REFERENCES Categories(CategoryID),

    SupplierID INT NOT NULL
        REFERENCES Suppliers(SupplierID),

    WarehouseID INT NOT NULL
        REFERENCES Warehouses(WarehouseID)
);
GO


INSERT INTO Warehouses (WarehouseName, Address)
VALUES
('Central Warehouse', 'Amsterdam, Main Street 10'),
('North Warehouse', 'Rotterdam, Harbor Road 25'),
('South Warehouse', 'Eindhoven, Industrial Street 5');

GO


INSERT INTO Suppliers (SupplierName, Phone, WarehouseID)
VALUES
('Tech Supply', '+31 20 111 2233', 1),
('Global Electronics', '+31 10 222 3344', 2),
('Digital World', '+31 40 333 4455', 3);

GO


INSERT INTO Categories (CategoryName, Description, SupplierID)
VALUES
('Smartphones', 'Mobile phones and smartphones', 1),
('Laptops', 'Portable computers and laptops', 2),
('Accessories', 'Computer and phone accessories', 3);

GO

INSERT INTO Brands (BrandName, Country, CategoryID)
VALUES
('Samsung', 'South Korea', 1),
('Apple', 'USA', 1),
('Lenovo', 'China', 2),
('ASUS', 'Taiwan', 2),
('Logitech', 'Switzerland', 3),
('Anker', 'China', 3);

GO

INSERT INTO Products
    (ProductName, Price, Quantity, BrandID, CategoryID, SupplierID, WarehouseID)
VALUES
('Samsung Galaxy S25', 899.99, 25, 1, 1, 1, 1),
('iPhone 16', 999.99, 15, 2, 1, 1, 1),

('Lenovo IdeaPad 5', 749.99, 20, 3, 2, 2, 2),
('ASUS VivoBook 15', 699.99, 18, 4, 2, 2, 2),

('Logitech MX Master 3S', 99.99, 40, 5, 3, 3, 3),
('Anker USB-C Charger', 39.99, 60, 6, 3, 3, 3);

GO

SELECT * FROM Warehouses;
GO

SELECT * FROM Suppliers;
GO

SELECT * FROM Categories;
GO

SELECT * FROM Brands;
GO

SELECT * FROM Products;
GO