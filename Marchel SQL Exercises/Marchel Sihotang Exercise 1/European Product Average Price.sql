select sup.Country, avg(pro.UnitPrice) as [Harga Rata-rata]
from dbo.products as pro
	 join dbo.Suppliers as sup on sup.SupplierID  = pro.SupplierID
	 join dbo.Categories as cat on cat.CategoryID = pro.CategoryID
where sup.Country in ('Germany', 'Spain', 'Sweden','Italy','Norway','Denmark','Netherlands','Finland','France')
group by sup.Country
having avg(pro.unitprice) <= 50
order by avg(pro.unitprice) desc