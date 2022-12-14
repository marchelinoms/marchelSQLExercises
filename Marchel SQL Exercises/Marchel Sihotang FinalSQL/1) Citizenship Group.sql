--- Citizenship Group
use Unicorn;
select ctr.[Name] as [Asal Negara]  , COUNT(stu.CitizenshipID) as [Jumlah Mahasiswa]
from dbo.Student as stu
	join dbo.Country as ctr on ctr.ID = stu.CitizenshipID
group by ctr.[Name]