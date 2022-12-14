--Manajemen mau table yang bisa nunjukin berapa banyak Job Title di setiap region
use Northwind
select pvt.[Job Title],Northern,Eastern,Southern,Western
from (
	select DISTINCT emp.EmployeeID as [ID], regio.RegionDescription as [Region], emp.Title as [Job Title]
	from dbo.Employees as emp
		join dbo.EmployeeTerritories as empt on empt.EmployeeID = emp.EmployeeID
		join dbo.Territories as ter on ter.TerritoryID = empt.TerritoryID
		join dbo.Region as regio on regio.RegionID = ter.RegionID
) as jobregio
PIVOT (	
		count(jobregio.ID) 
		for jobregio.region in (Northern,Eastern,Southern,Western)
) as pvt
order by [Job Title]