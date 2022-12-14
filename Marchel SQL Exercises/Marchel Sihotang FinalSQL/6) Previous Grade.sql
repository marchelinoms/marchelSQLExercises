--- Previous Grade
select 
TRIM(eduhis.Institution) as [Institusi Asal],
--COUNT(distinct stu.StudentNumber) as [Jumlah Siswa],
AVG(eduhis.Grade) as [Rata-Rata Nilai]
from dbo.Student as stu
	join dbo.EducationHistory as eduhis on eduhis.StudentNumber = stu.StudentNumber
group by TRIM(eduhis.Institution)