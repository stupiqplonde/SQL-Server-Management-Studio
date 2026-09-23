USE TestIndex
go

CREATE COLUMNSTORE INDEX ind
	ON onders2(price)
	WHERE price < 10000
	AND price > 1000