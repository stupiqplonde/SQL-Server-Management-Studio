--SET STATISTICS IO ON
USE TestIndex
go

CREATE CLUSTERED INDEX cl_index
	on onders2(id)
go

CREATE INDEX ncl_1_index
	on onders2(product_id, customer_id)
go

SELECT *
FROM onders2
WHERE id = ''

SELECT *
FROM onders2
WHERE price = 180000.00

SELECT SUM(price)
FROM onders2
WHERE price = 180000.00

DROP INDEX ncl_1_index
	on onders2