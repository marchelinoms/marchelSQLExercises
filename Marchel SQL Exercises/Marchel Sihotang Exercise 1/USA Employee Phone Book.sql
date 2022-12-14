select 
	concat(Firstname,' ',LastName) as [Nama Karyawan],
	TitleOfCourtesy as [Sapaan],
	HomePhone as [Nomor Telpon]
from dbo.Employees
where Country like '%USA%';

--select firstname,country
--from dbo.Employees