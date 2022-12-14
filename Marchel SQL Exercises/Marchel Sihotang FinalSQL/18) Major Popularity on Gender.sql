--- Major Popularity on Gender
Select pvt.Name, [Male], [Female]
From(
	Select 
		maj.[Name],
		stumaj.StudentNumber,
		IIF(stu.Gender ='M','Male','Female') as [Gender]
	From dbo.Student as stu
		Join dbo.StudentMajor as stumaj on stumaj.StudentNumber = stu.StudentNumber
		Join dbo.Major as maj on maj.ID = stumaj.MajorID
) as majgen
PIVOT(COUNT(majgen.StudentNumber) for majgen.Gender in([Male],[Female])) as pvt