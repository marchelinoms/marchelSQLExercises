WITH PendapatanHarian(OrderDate,Pendapatan) AS(
select 
ord.OrderDate,
SUM(ost.SubTotal) as [Pendapatan]
from dbo.Orders as ord
	join(
	 select 
	 SUM((Quantity * UnitPrice)*(1-Discount)) as [SubTotal],
	 OrderID
	 from dbo.[Order Details]
	 group by OrderID) as ost on ord.OrderID = ost.OrderID
group by ord.OrderDate
)

Select 
FORMAT(OrderDate,'dd MMMM yyyy') as [Tanggal], 
Pendapatan,
(Pendapatan- LAG(Pendapatan)OVER(ORDER BY OrderDate)) as [Perubahan Pendapatan]
From PendapatanHarian
Order by OrderDate