CREATE PROCEDURE dbo.ShipperExperience @Year as int
AS
BEGIN
	DECLARE @input as int = @year;
	WITH CategoryShipper (CategoryID,CompanyName,Quantity,ShippedYear) AS(
		select 
		 pro.CategoryID,
		 ship.CompanyName,
		 orddet.Quantity,
		 YEAR(ord.ShippedDate) as [ShippedYear]	
		from dbo.[Order Details] as orddet
			join dbo.Orders as ord on ord.OrderID = orddet.orderID
			join dbo.Products as pro on pro.ProductID = orddet.ProductID
			join dbo.Shippers as ship on ship.ShipperID = ord.ShipVia
		)
	select pvt.CategoryID,[Speedy Express],[United Package],[Federal Shipping]
	from CategoryShipper as cs
	pivot (SUM(cs.Quantity) for cs.CompanyName in ([Speedy Express],[United Package],[Federal Shipping])) as pvt
	where pvt.ShippedYear = @input
	order by pvt.CategoryID
END