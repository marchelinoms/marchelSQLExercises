--select * from dbo.Employees
--select * from dbo.EmployeeTerritories
--select * from dbo.Territories

select 
	CONCAT(emp.firstname,' ',emp.LastName) as [Employee],
	ter.TerritoryDescription
from dbo.Employees as emp
	join dbo.EmployeeTerritories as empt on empt.EmployeeID = emp.EmployeeID
	full join dbo.Territories as ter on ter.TerritoryID = empt.TerritoryID	 