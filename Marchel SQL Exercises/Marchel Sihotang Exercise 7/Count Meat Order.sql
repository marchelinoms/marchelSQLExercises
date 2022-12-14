CREATE FUNCTION dbo.YearlyMeatOrder(@year as int)
RETURNS INT AS
BEGIN
	DECLARE @meatorder as int;
		select 
			@meatorder =count(distinct(orddet.OrderID))
		from dbo.Orders as ord
			join dbo.[Order Details] as orddet on orddet.OrderID = ord.OrderID
			join (
				select c.CategoryID,p.ProductID, c.CategoryName
				from dbo.Categories as c
					join dbo.Products as p on p.CategoryID = c.CategoryID) as catpro on catpro.ProductID = orddet.ProductID
		where catpro.CategoryID = 6 and @year = YEAR(ord.OrderDate)
		group by catpro.CategoryID, YEAR(ord.OrderDate)
	RETURN @meatorder
END