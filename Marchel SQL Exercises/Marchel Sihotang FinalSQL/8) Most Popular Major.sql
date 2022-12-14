--- Most Popular Major
CREATE PROCEDURE dbo.PopularMajor
@year as int
AS
BEGIN
DECLARE @input as int = @year
Select
	maj.Name as [Major],
	YEAR(stumaj.SetDate) as [Year],
	COUNT(stu.StudentNumber) as [Enrolling Student]
From dbo.StudentMajor as stumaj
	Join dbo.Student as stu on stu.StudentNumber = stumaj.StudentNumber 
	Join dbo.Major as maj on maj.ID = stumaj.MajorID
Where YEAR(stumaj.SetDate) = @input
Group by maj.[Name], YEAR(stumaj.SetDate)
END