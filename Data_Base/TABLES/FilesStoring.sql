USE TestFileGroupe
go

CREATE TABLE users
(id int , name text)
ON fast_tables

CREATE TABLE products
(id int , name text)
ON slow_tables


WHILE 1 = 1
	INSERT INTO users(id)
	VALUES (DatePart(MINUTE, GetDate())
go 

INSERT INTO products(id)
VALUES (DatePart(MINUTE, GetDate())
