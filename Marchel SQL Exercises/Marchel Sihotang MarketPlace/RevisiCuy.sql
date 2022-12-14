Create database MarketPlace;
GO
Use MarketPlace;

create table dbo.[Admin](
	IdAdmin int Primary Key identity (1,1),
	Username Varchar (10) not null unique,
	[Password] Varchar (8) not null,
	Email Varchar (30) not null,
	PhoneNumber Varchar (20) not null unique,
	FirstName Varchar (50) not null,
	LastName Varchar (50) not null,
	Sex Char(1) not null check(Sex = 'M' or Sex ='F'),
	KTP Varchar(50) not null unique,
	HiredDate	Date,
	RegisterDate Datetime
);

create table dbo.Pembeli(
	IdPembeli int Primary Key identity (1,1),
	Username Varchar (10) not null unique,
	[Password] Varchar (8) not null,
	Email Varchar (30) not null,
	PhoneNumber Varchar (20) not null unique,
	FirstName Varchar (50) not null,
	LastName Varchar (50) not null,
	Sex Char(1) not null check(Sex = 'M' or Sex ='F'),
	KTP Varchar(50) not null unique,
	RegisterDate Datetime,
	AccBalance Money Default 0
);

create table dbo.Penjual(
	IdPenjual int Primary Key identity (1,1),
	Username Varchar (10) not null unique,
	[Password] Varchar (8) not null,
	Email Varchar (30) not null,
	PhoneNumber Varchar (20) not null unique,
	FirstName Varchar (50) not null,
	LastName Varchar (50) not null,
	Sex Char(1) not null check(Sex = 'M' or Sex ='F'),
	KTP Varchar(50) not null unique,
	RegisterDate Datetime,
	AccBalance Money Default 0
);

create table dbo.KotaLayanan(
	IdKota int Primary Key identity (1,1),
	CityName Varchar (30) not null,
	PostalCode Varchar (15) not null unique,
);

create table dbo.Toko(
	IdToko int Primary Key identity (1,1),
	IdPenjual int not null Foreign Key References dbo.Penjual (IdPenjual),
	ShopName Varchar (50) not null
);

create table dbo.AlamatToko(
	IdAlamatToko int Primary Key identity (1,1),
	IdToko int not null Foreign Key References dbo.Toko (IdToko),
	IdKota int not null Foreign Key References dbo.KotaLayanan(IdKota),
	District Varchar (30) not null,
	[Address] Varchar (100) not null 
);

create table dbo.AlamatPembeli(
	IdAlamatPembeli int Primary Key identity (1,1),
	IdPembeli int not null Foreign Key References dbo.Pembeli (IdPembeli),
	IdKota int not null Foreign Key References dbo.KotaLayanan(IdKota),
	District Varchar (30) not null,
	PostalCode Varchar (15) not null,
	[Address] Varchar (100) not null 
);
create table dbo.Shipper(
	IdShipper int Primary Key identity (1,1),
	NamaEkspedisi Varchar (50) not null Unique,
	RegisteredDate Datetime 
);

create table dbo.Ekspedisi(
	IdEkspedisi int Foreign Key References dbo.Shipper(IdShipper),
	[From] int not null Foreign Key References dbo.KotaLayanan (IdKota),
	[To] int not null Foreign Key References dbo.KotaLayanan(IdKota),
	FreightCost money,
	constraint ass_ship_eksp Primary Key (IdEkspedisi,[From],[To])
);

create table dbo.KategoriProduk(
	IdKategoriProduk int Primary Key identity (1,1),
	NamaKategori Varchar (30) not null unique
);

create table dbo.Produk(
	IdProduk int Primary Key identity (1,1),
	IdKategoriProduk int not null Foreign Key References dbo.KategoriProduk (IdKategoriProduk),
	IdToko int not null Foreign Key References dbo.Toko (IdToko),
	Price money not null,
	ProductStock int not null,
	MinQtyPurchase int not null,
	PostingDate Datetime
);

create table dbo.KeranjangBelanja(
	IdKeranjang int Primary Key identity (1,1),
	IdPembeli int not null Foreign Key References dbo.Pembeli(IdPembeli),
	IdProduk int not null Foreign Key References dbo.Produk (IdProduk),
	IdToko int not null Foreign Key References dbo.Toko(IdToko),
	StoreLocation int not null Foreign Key References dbo.AlamatToko(IdAlamatToko),
	QuantityOrder int not null,
);

create table dbo.PenyelesaianTransaksi(
	IdPembelian int Primary Key identity (1,1),
	IdKeranjang int not null Foreign Key References dbo.KeranjangBelanja(IdKeranjang),
	IdProduk int not null Foreign Key References dbo.Produk (IdProduk),
	UnitPrice int not null,
	Quantity int not null Foreign Key References dbo.KeranjangBelanja(IdKeranjang),
	Discount decimal (3,2),
	IdEkspedisi int not null,
	[From] int not null,
	[To] int not null,
	constraint FK_PenTrans_Eksp Foreign Key (IdEkspedisi,[From],[To]) References dbo.Ekspedisi(IdEkspedisi,[From],[To]),
	PaymentDate Datetime,
	ShippingDate Datetime,
	ShippedDate Datetime
);

create table dbo.Review(
	IdReview int Primary Key identity (1,1),
	IdPembeli int not null Foreign Key References dbo.Pembeli(IdPembeli),
	IdProduk int not null Foreign Key References dbo.Produk (IdProduk),
	Rating  int,
	Comment Varchar (300),
	CommentDate Datetime
);

create table  dbo.TanyaPenjual(
	IdTanya int Primary Key identity (1,1),
	IdPembeli int not null Foreign Key References dbo.Pembeli (IdPembeli),
	IdProduk int not null Foreign Key References dbo.Produk (IdProduk),
	CustChat Varchar (300),
	ChatDate Datetime
);

create table dbo.JawabanPenjual(
	IdJawab int Primary Key identity (1,1),
	IdTanya int not null Foreign Key References dbo.TanyaPenjual(IdTanya),
	IdPenjual int not null Foreign Key References dbo.Penjual(IdPenjual),
	SellerReply Varchar (300),
	ReplyDate Datetime
);