USE TestIndex
go

--SET STATISTICS IO ON

SELECT * FROM orders
WHERE price = 70000.00

-- лог. операции 7895
-- предпологаемая стоимость поддерева 9.14