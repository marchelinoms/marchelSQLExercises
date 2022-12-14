CREATE FUNCTION dbo.SalesmanPerformance(@employeeID as int,@year as int)
RETURNS MONEY AS
BEGIN
	DECLARE @bonus as MONEY;
	select 
		@bonus = (SUM(orddet.Quantity*orddet.UnitPrice))* 0.1
	from dbo.Orders as ord
		join dbo.[Order Details] as orddet on ord.OrderID = orddet.OrderID
		join dbo.Employees as emp on ord.EmployeeID = emp.EmployeeID
	where Year(ord.OrderDate) = @year and emp.EmployeeID = @employeeID
	group by emp.EmployeeID
	RETURN @bonus
END