--- In Progress
SELECT
CONCAT(stu.FirstName,' ',stu.MiddleName, ' ' ,stu.LastName) as [Full Name],
CONCAT(cty.[Name],',',FORMAT(stu.BirthDate,'dd MMMM yyyy')) as [Place/Birth Date],
maj.Name as [Major Name]
FROM dbo.Student as stu
	join dbo.City as cty on cty.ID = stu.BirthCityID
	join dbo.StudentMajor as stumaj on stumaj.StudentNumber = stu.StudentNumber
	join dbo.Major as maj on maj.ID = stumaj.MajorID
where stu.StudentNumber NOT IN(
	 Select distinct stu.StudentNumber
	 From dbo.Student
		Join dbo.Certificate as certif on stu.StudentNumber = certif.StudentNumber)