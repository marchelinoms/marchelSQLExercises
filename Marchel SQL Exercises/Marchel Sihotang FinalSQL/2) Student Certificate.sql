--- Student Certificate
use Unicorn;
select 
CONCAT(stud.FirstName,' ',stud.MiddleName,' ',stud.LastName) as [Full Name],
CONCAT(cty.[Name],',',FORMAT(stud.BirthDate,'dd MMMM yyyy','id-ID')) as [Place/Birth Date],
ctr.[Name] as Citizenship,
dbo.GetLevel(certif.[Level]) as [Level],
Certif.AcademicTitle,
CASE
	WHEN  Certif.Grade = 'PAS'  THEN 'PASS'
	WHEN  Certif.Grade = 'CRE'  THEN 'CREDIT'
	WHEN  Certif.Grade = 'DIS'  THEN 'DISTINCTION'
	ELSE 'HIGH DISTINCTION'
END AS [Grade],
FORMAT(Certif.GraduateDate,'dd MMMM yyyy','id-ID') as [Graduate Date]
from dbo.Student as stud
	join dbo.[Certificate] as certif on certif.StudentNumber = stud.StudentNumber
	join dbo.City as cty on cty.ID = stud.BirthCityID
	join dbo.Country as ctr on ctr.ID = stud.CitizenshipID