--- Cost Changes
use Unicorn;
WITH SubjectEnroll (SubjectCode,PriceOnTransaction,TransactionDate) AS(
	Select sub.Code AS [Subject Code]
			,enroll.Fee AS [Price On Transaction]
			,enroll.TransactionDate AS [Transaction Date]
	From dbo.Subject AS sub
			Join dbo.Competency AS com ON sub.ID = com.SubjectID
			Join dbo.[Period] AS prd ON com.ID = prd.CompetencyID
			Join dbo.Enrollment AS enroll ON prd.ID = enroll.PeriodID
	Where enroll.PaymentMethod IS NOT NULL
)
Select 
sub.Code AS [Subject Code],
sub.[Name] AS [Subject Name],
sub.Cost as [Current Price],
FORMAT(se.TransactionDate,'dd MMMM yyyy') as [Transaction Date],
se.PriceOnTransaction as [Price On Transaction],
(sub.Cost - se.PriceOnTransaction) as [Price Difference]
From dbo.Subject as sub
	Join SubjectEnroll as se on sub.Code = se.SubjectCode
Order by se.TransactionDate