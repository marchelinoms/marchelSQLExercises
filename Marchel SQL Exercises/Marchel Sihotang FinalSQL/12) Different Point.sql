--- Different Point
select
maj.Name,maj.TotalCreditPoint,
SUM(sub.CreditPoint)-maj.TotalCreditPoint as[Different with subject]
from dbo.Major as maj
	join dbo.Subject as sub on sub.MajorID = maj.ID
group by maj.Name, maj.TotalCreditPoint