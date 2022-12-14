-- Negara (Dimana Supplier = Employee) , Nama Supplier, Employee, Phonee

select 
	emp.Karyawan,
	emp.[Nomor Telepon],
	emp.Negara,	
	sup.Supplier,
	sup.[Nomor Telepon],
	sup.Negara
from (
	select CompanyName as [Supplier],Phone as [Nomor Telepon],Country as [Negara]
	from dbo.Suppliers
)as sup,
	(
	select concat(FirstName,' ',LastName) as [Karyawan],HomePhone as [Nomor Telepon],Country as [Negara]
	from dbo.Employees
	) as emp
where sup.Negara = emp.Negara
