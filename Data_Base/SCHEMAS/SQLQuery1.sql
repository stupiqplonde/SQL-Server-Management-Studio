USE Data_Base_8
go

CREATE PROCEDURE uspDiscount3
	@Discount decimal,
	@Top_level int = 10,
	@RoundCost int
AS
BEGIN
	SELECT TOP (@Top_level) standard_cost * @Discount AS with_discount, standard_cost
	FROM products
	WHERE standard_cost > @RoundCost
RETURN @Top_level
END

DECLARE @Result INT;

EXEC @Result = uspDiscount3 @Discount = 15, @RoundCost = 1500
