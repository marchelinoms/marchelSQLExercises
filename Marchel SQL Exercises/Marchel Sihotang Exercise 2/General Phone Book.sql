-- Full Name,Nomor Telpon, Jenis Entitas (Customer,Employee,Supplier)
-- Urutkan secara Desc berdasarkan nama entitas
use Northwind
select ContactName as [Nama],Phone as [Nomor Telpon], 'Supplier' as [Jenis Entitas]
from dbo.Suppliers
UNION
select ContactName as [Nama],Phone as [Nomor Telpon], 'Customer' as [Jenis Entitas]
from dbo.Customers
UNION
select CONCAT(FirstName,' ',LastName) as [Nama],HomePhone as [Nomor Telpon], 'Employee' as [Jenis Entitas]
from dbo.Employees
order by [Nama] desc