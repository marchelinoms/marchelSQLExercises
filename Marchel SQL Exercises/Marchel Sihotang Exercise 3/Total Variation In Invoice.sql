use Northwind
select ord.OrderID as [ID],
	   FORMAT(ord.OrderDate,'dd MMMM yyyy','id-ID') as [Tanggal Order],
	   count(ordDet.ProductID) as [Total Produk]
from dbo.Orders as ord
	join dbo.[Order Details] as ordDet on ord.OrderID = ordDet.OrderID
	group by ord.OrderID,ord.OrderDate
	order by ord.OrderDate

