CREATE FUNCTION dbo.TotalQtyProductSold(@productID as int,@month as int,@year as int)
RETURNS INT AS
BEGIN
DECLARE @jumlahProduk as int;
select 
@jumlahProduk = SUM(orddet.Quantity) 
from dbo.[Order Details] as orddet
	join dbo.Orders as ord on ord.OrderID =orddet.OrderID 
where @productID = (orddet.ProductID) and @year = YEAR(ord.OrderDate) and @month = MONTH(ord.OrderDate)
RETURN @jumlahProduk
END