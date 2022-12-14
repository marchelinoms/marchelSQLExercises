--select * from dbo.Products

select 
	 pro.ProductName     as  [Nama Produk],
	 sup.CompanyName     as  [Nama Supplier],
	 cat.CategoryName    as  [Kategori],
	 pro.QuantityPerUnit as  [Satuan Kemasan],
	 pro.UnitsInStock	 as	 [Stok Barang]
from dbo.Products as pro
	 join dbo.Suppliers as sup on sup.SupplierID = pro.SupplierID
	 join dbo.Categories as cat on cat.CategoryID = pro.CategoryID
where pro.QuantityPerUnit like '%bottle%' or pro.QuantityPerUnit like '%glasses%' or pro.QuantityPerUnit like '%jars%'