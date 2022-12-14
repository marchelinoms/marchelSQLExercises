--Supplier mau lihat product paling mahalnya
--List(NamaPerusahaan,NamaProduk,Harga) 
--Harus harga termahal (Rank 1), 
--kalau ada yang lebih dari  1 maka dimunculkan juga
select 
Rank() OVER (ORDER BY RankDalamPerusahaan.UnitPrice DESC) as [RankAntarPerusahaan],
RankDalamPerusahaan.ProductName,RankDalamPerusahaan.UnitPrice
from(
	select Rank() OVER(partition by sup.SupplierID order by pro.unitPrice desc) as [Rank],sup.SupplierID,pro.ProductName,pro.UnitPrice
	from dbo.Products as pro
		join dbo.Suppliers as sup on sup.SupplierID = pro.SupplierID) as RankDalamPerusahaan
where RankDalamPerusahaan.[Rank] = 1
order by RankDalamPerusahaan.UnitPrice DESC, RankDalamPerusahaan.ProductName ASC