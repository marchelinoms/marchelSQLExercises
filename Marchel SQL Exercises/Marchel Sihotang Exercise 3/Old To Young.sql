--------------------------------
use Northwind
select CONCAT (FirstName,' ',LastName) as [Nama Karyawan],
	   FORMAT (BirthDate,'dd MMMM yyyy','id-ID') as [Tgl Lahir],
	   CONCAT (datediff(year,BirthDate,GETDATE()), ' Tahun') as [Umur]
from dbo.Employees
order by BirthDate;
--------------------------------