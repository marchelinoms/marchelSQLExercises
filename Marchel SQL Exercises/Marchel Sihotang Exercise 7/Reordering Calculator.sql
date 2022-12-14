CREATE FUNCTION dbo.ReorderingCalculator ()
RETURNS MONEY AS
BEGIN
	DECLARE @reorderPrice as money;
	select @reorderPrice = SUM(ReorderLevel*UnitPrice)
	from dbo.Products
	where ReorderLevel > 0
	RETURN @reorderPrice
END