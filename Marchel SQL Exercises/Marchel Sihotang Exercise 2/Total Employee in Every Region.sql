-- Hitung Jumlah Karyawan di Setiap Region
-- Tampilkan Region dan Jumlah Karyawan yang kerja disana, kalau ada yang sama urutkan dari region secara desc
use Northwind
select regio.RegionDescription as [Region],count(distinct emp.EmployeeID) as [Jumlah Karyawan]
from dbo.Employees as emp
	join dbo.EmployeeTerritories as empt on empt.EmployeeID = emp.EmployeeID
	join dbo.Territories as ter on ter.TerritoryID = empt.TerritoryID
	join dbo.Region as regio on regio.RegionID = ter.RegionID
group by regio.RegionDescription
order by [Jumlah Karyawan] desc , [Region] desc