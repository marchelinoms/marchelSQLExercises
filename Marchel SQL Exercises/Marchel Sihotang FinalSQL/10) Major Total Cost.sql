--- Major Total Cost
Select 
DENSE_RANK() OVER(order by SUM(sub.Cost)desc) as [Rank],
maj.[Name] as [Major Name],
CASE
	WHEN maj.[type] = 'FM' THEN 'Full Major'
	WHEN maj.[type] = 'SM' THEN 'Sub Major'
	WHEN maj.[type] = 'EL' THEN 'Elective'
	ELSE 'N/A'
END AS [Type],
COUNT(sub.Code) as [Jumlah Matkul],
SUM(sub.Cost) as [Total Cost]
From dbo.Major as maj
	Join dbo.[Subject] as sub on sub.MajorID = maj.ID
group by maj.Name,maj.Type
order by [Total Cost] desc