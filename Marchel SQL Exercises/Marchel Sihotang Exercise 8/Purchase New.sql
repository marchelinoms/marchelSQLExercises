--- User Defined Table Type untuk Keranjang
CREATE TYPE dbo.Cart AS TABLE
(
	Quantity INT NOT NULL,
	ProductID INT NOT NULL
);
GO
--- Stored Procedure Check Out Belanjaan dalam Keranjang
CREATE PROCEDURE dbo.CheckOut
@customerID as Varchar(10),
@employeeID as int,
@shipperID as int,
@cart as dbo.Cart READONLY
AS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO dbo.Orders(CustomerID,EmployeeID,OrderDate,ShipVia)
	VALUES (@customerID,@employeeID,GETDATE(),@shipperID);
	
	DECLARE @orderID AS INT = SCOPE_IDENTITY();
	
	INSERT INTO dbo.[Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
	SELECT @orderID,crt.ProductID,pro.UnitPrice, crt.Quantity, 0
	FROM @cart as crt
		JOIN dbo.Products as pro on crt.ProductID = pro.ProductID;

	UPDATE dbo.Products
		SET UnitsInStock = UnitsInStock - crt.Quantity
		FROM @cart as crt 
		WHERE dbo.Products.ProductID = crt.ProductID

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH
END 