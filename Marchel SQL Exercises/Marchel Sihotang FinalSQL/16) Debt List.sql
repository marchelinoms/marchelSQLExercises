select 
stu.StudentNumber,
CONCAT(stu.FirstName,' ', stu.MiddleName,' ',stu.LastName) as [Name],
SUM(sub.Cost) as [Debt]
from dbo.Enrollment as enroll 
	join dbo.Student as stu on enroll.StudentNumber = stu.StudentNumber
	join dbo.StudentMajor as stumaj on stumaj.StudentNumber = stu.StudentNumber
	join dbo.Major as maj on maj.ID = stumaj.MajorID
	join dbo.Subject as sub on maj.ID = sub.MajorID
where enroll.[Status] = 'PEN'  
group by stu.StudentNumber,
CONCAT(stu.FirstName,' ', stu.MiddleName,' ',stu.LastName)