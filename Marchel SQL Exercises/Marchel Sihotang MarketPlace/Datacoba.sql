use MarketPlace;
insert into dbo.KotaLayanan(CityName,PostalCode)
Values ('Medan',10234),('Jakarta',10334)

select * from dbo.KotaLayanan
select * from dbo.Ekspedisi
select * from dbo.Shipper
insert into dbo.Shipper (NamaEkspedisi)
Values ('JNE')
insert into dbo.Ekspedisi([IdEkspedisi],[From],[To],FreightCost)
Values(1,2,1,14000)
