--------------------------------
use Northwind
select ProductName as [Nama Produk],
	   UnitPrice as [Harga],
	   UnitsInStock as [Stok],
	   FORMAT ((UnitsInStock*UnitPrice),'C','en-US') as [Total Asset]
from dbo.Products 
where Discontinued = 0
order by [Total Asset] desc
--------------------------------