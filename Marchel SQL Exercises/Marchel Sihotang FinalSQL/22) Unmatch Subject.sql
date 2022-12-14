--Unmatch Subject
use Unicorn;
Select 
maj.Name AS [Major Name],
dbo.GetLevel(maj.[Level]) AS [Major Level],
sub.Name AS [Subject Name],
dbo.GetLevel(sub.[Level]) AS [Subject Level]
From dbo.Subject AS sub
	Join dbo.Major AS maj ON sub.MajorID = maj.ID
Where 
(	Select DISTINCT Level 
	From dbo.Major WHERE Level = 'B') = 
(	Select DISTINCT Level 
	From dbo.Subject WHERE Level = 'B') and 
(	Select DISTINCT Level 
	From dbo.Major WHERE Level = 'M') IN 
(	Select DISTINCT Level 
	From dbo.Subject WHERE Level = 'B' OR Level = 'M') and 
(	Select DISTINCT Level 
	From dbo.Major WHERE Level = 'P') IN 
(	Select DISTINCT Level 
	From dbo.Subject WHERE Level = 'B' OR Level = 'M' OR Level = 'P') and sub.NonActiveDate is null