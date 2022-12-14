--- Subject of Major
use Unicorn;
GO
CREATE PROCEDURE dbo.SubjectOfMajor
@major as Varchar(50)
AS
BEGIN
DECLARE @input as Varchar(50) = @major;
Select 
	sub.[Name],
	ISNULL(sub.[Description],'Ask student call center for this subject information')
	as [Description],
	CASE
		WHEN sub.[Level] = 'B' THEN 'Bachelor'
		WHEN sub.[Level] = 'M' THEN 'Master'
		WHEN sub.[Level] = 'P' THEN 'Ph.D'
		ELSE 'N/A'
	END AS [Level],
	sub.Cost
From dbo.Major as maj
	join dbo.[Subject] as sub on maj.ID = sub.MajorID
Where maj.[Name] like '%' + @input + '%'
END