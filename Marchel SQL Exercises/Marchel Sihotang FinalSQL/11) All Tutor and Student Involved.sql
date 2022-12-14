--- All Tutor And Student Involved
CREATE PROCEDURE dbo.TutorandStudent
@subjectCode as Varchar(10)
@tanggal as Varchar (30)
AS
BEGIN
DECLARE @inputSubject as Varchar(10) = @subjectCode;
DECLARE @inputTanggal as Varchar (30) = @tanggal;
select
CONCAT(stu.FirstName,' ',stu.MiddleName,' ',stu.LastName) as [Students],
CONCAT(tut.FirstName,' ',tut.MiddleName,' ',tut.LastName) as [Tutor]
from dbo.Competency as comp
	join dbo.Tutor as tut on tut.StaffNumber = comp.StaffNumber
	join dbo.Subject as sub on sub.ID = comp.SubjectID
	join dbo.Major as maj on maj.ID = sub.MajorID
	join dbo.StudentMajor as stumaj on stumaj.MajorID = maj.ID
	join dbo.Student as stu on stu.StudentNumber = stumaj.StudentNumber
	join dbo.Period as prd on prd.CompetencyID = comp.ID
where sub.Code = @inputSubject and prd.StartDate <= @inputTanggal and @inputTanggal <= prd.EndDate
END