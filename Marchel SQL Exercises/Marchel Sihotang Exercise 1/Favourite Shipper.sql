select top 1
	 ship.companyname as [Perusahaan Shipper],
	 count(distinct ord.OrderID) as [Total Pengiriman]
from dbo.Orders as ord
	 join dbo.customers as cus on cus.customerid = ord.customerid
	 join dbo.shippers as ship on ship.ShipperID = ord.ShipVia
where ord.ShippedDate is not null
group by ship.CompanyName
order by count(distinct ord.OrderID) desc