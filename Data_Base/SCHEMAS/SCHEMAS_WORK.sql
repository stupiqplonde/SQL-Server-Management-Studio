USE Data_Base;
GO
CREATE SCHEMA Persons;
GO

CREATE SCHEMA Products;
GO



CREATE TABLE Persons.Dating
(
    id int NULL,
    name varchar(50),
    age int,
    city varchar(50),
    phone varchar(20)
);
GO

CREATE TABLE Persons.Client
(
    id int NULL,
    name varchar(50),
    email varchar(100),
    age int,
    city varchar(50)
);
GO



ALTER TABLE Persons.Dating
DROP COLUMN id;
GO

ALTER TABLE Persons.Dating
ADD id int PRIMARY KEY IDENTITY(1,1) NOT NULL;
GO

ALTER TABLE Persons.Client
DROP COLUMN id;
GO

ALTER TABLE Persons.Client
ADD id int PRIMARY KEY IDENTITY(1,1) NOT NULL;
GO
lkmlklkmj



CREATE TABLE Products.Product
(
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name varchar(100),
    price DECIMAL(10,2)
);
GO

CREATE TABLE Products.Category
(
    id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    name varchar(100),
    description varchar(255)
);
GO



INSERT INTO Products.Product (name, price)
VALUES
    ('Ноутбук', 999.99),
    ('Мышь', 29.99),
    ('Клавиатура', 59.99);
GO

INSERT INTO Products.Category (name, description)
VALUES
    ('Компьютеры', 'Компьютерная техника'),
    ('Аксессуары', 'Аксессуары для компьютеров');
GO




ALTER SCHEMA Persons
TRANSFER Products.Product;
GO

ALTER SCHEMA Persons
TRANSFER Products.Category;
GO