USE Data_Base_8
go

CREATE VIEW dbo.v_Products_select2
AS
SELECT diff_price
FROM products
go

SELECT *
FROM dbo.v_Products_select2

CREATE VIEW dbo.v_Products_select3
WITH SCHEMABINDING
AS
SELECT diff_price
FROM products
go
