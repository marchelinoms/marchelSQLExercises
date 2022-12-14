--- Income From Fee
CREATE FUNCTION dbo.FeeIncomes (@tanggal as Varchar(50))
RETURNS TABLE AS RETURN
Select 
	FORMAT(TransactionDate,'yyyy-MM-dd') as [TransactionDate],
	SUM(Fee) as [Income]
From dbo.Enrollment 
Where TransactionDate = @tanggal and fee is not null
Group by TransactionDate 