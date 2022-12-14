--- All Avaiable Subject
CREATE PROCEDURE dbo.availableSubject
@tanggal as Varchar (50)
AS
BEGIN
DECLARE @input as Varchar(50) = @tanggal;
select distinct
	FORMAT(prd.StartDate,'yyyy-MM-dd') as [Start Date],
	FORMAT(prd.EndDate,'yyyy-MM-dd') as [End Date],
	sub.[Name],
	sub.[Description],
	FORMAT(sub.Cost,'C','en-US') as [Cost]
from dbo.Subject as sub
	join dbo.Competency as comp on comp.SubjectID = sub.ID
	join dbo.[Period] as prd on prd.CompetencyID = comp.ID 
where prd.StartDate = @input
END
