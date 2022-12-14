CREATE PROCEDURE dbo.ShowInvoice @orderID as int
AS
BEGIN
	DECLARE @input as int = @orderID;
	WITH Details (OrderID,SubTotal) AS(
		select 
			 OrderID,
			 SUM((Quantity * UnitPrice)*(1-Discount)) as [SubTotal]
		from dbo.[Order Details]
		group by OrderID)
---- Query 1 (Invoice Header)
	Select 
	FORMAT(ord.OrderDate,'dd MMM yyyy') as [Order Date],
	cus.ContactName as [Customer],
	CONCAT(emp.FirstName,' ',emp.LastName) as [Salesman],
	ship.CompanyName as [Shipper],
	FORMAT(ord.ShippedDate,'dd MMM yyyy') as [Ship Date],
	(det.SubTotal + ord.Freight) as [Total Cost]
	From dbo.Orders as ord
		join dbo.Shippers as ship on ship.ShipperID = ord.ShipVia
		join dbo.Customers as cus on cus.CustomerID = ord.CustomerID
		join dbo.Employees as emp on emp.EmployeeID = ord.EmployeeID
		join Details as det on det.OrderID = ord.OrderID
	where ord.OrderID = @input
---- Query 2 (Invoice Details)
	select 
	pro.ProductName as [Product], 
	sup.CompanyName as [Supplier], 
	orddet.Quantity,
	FORMAT(orddet.UnitPrice,'c','en-US') as [Price Per Unit],
	FORMAT(((orddet.Quantity*orddet.UnitPrice)*(1-orddet.Discount)),'c','en-US') as [Total]
	from dbo.Products as pro
		join dbo.Suppliers as sup on sup.SupplierID = pro.SupplierID
		join dbo.[Order Details] as orddet on orddet.ProductID = pro.ProductID
	Where Orddet.OrderID = @input
END