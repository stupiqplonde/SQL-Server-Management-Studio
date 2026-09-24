USE Data_Base_8
go

CREATE TABLE products(
	id int Primary Key IDENTITY(1, 1),
	name varchar(100),
	product_number varchar(40),
	standard_cost money,
	list_price money
)

--SELECT COUNT(*) AS Size
--FROM Production.Product

--SELECT COUNT(*) AS Size
--FROM Production.Product
--WHERE Size IS NOT NULL

INSERT products(name, product_number, standard_cost, list_price)
SELECT Name, ProductNumber, StandardCost, ListPrice
FROM AdventureWorks2019.Production.Product

--SELECT *
--FROM AdventureWorks2019.Production.Product