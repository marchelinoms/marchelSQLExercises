select top 2
	Cat.CategoryName as [Category],
	sum(pro.UnitsInStock) as [Total Unit In Stock]
from dbo.Products as pro
	join dbo.Categories as cat on cat.CategoryID = pro.CategoryID
group by cat.CategoryName
order by sum(pro.UnitsInStock) asc