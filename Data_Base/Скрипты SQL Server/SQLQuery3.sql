USE TestIndex
go 

--CREATE CLUSTERED INDEX ind_1
--ON orders(id)

--CREATE UNIQUE INDEX ind_2
--ON orders(customer_id)

--CREATE UNIQUE INDEX ind_3
--ON orders(product_id)

CREATE INDEX ind_10
ON orders(id)
INCLUDE (price)
