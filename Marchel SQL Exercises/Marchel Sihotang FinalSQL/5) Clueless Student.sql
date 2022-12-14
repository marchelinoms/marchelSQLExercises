Select 
	CONCAT(stu.FirstName,' ',stu.MiddleName,' ',stu.LastName) as [Full Name],
	stu.[Address]
From dbo.Student as stu
Where stu.StudentNumber NOT IN( 
	Select distinct enroll.StudentNumber 
	From dbo.Enrollment as enroll
)