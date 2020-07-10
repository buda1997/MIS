create database KnjizaraMISskladiste
go

use KnjizaraMISskladiste
go

create table dimZaposleni
(
ZaposleniID int identity(1,1) not null,
Ime nvarchar(50) not null,
Prezime nvarchar(50) not null,
NazivDelatnosti nvarchar(50) not null
)

create table dimArtikli
(
ArtikliID int identity(1,1) not null,
Naziv nvarchar(50) not null,
Sifra char(50) not null
)

create table dimDatum
(
DatumID int identity(1,1) not null,
Dan nvarchar(50) not null,
Mesec nvarchar(50) not null,
Godina nvarchar(50) not null
)

create table dimVrstaPopisa
(
VrstaPopisaID int identity(1,1) not null,
NazivVrstePopisa nvarchar(50) not null
)

create table faktPopis
(
PopisID int identity(1,1) not null,
VrstaPopisaID int not null,
DatumID int not null,
ArtikliID int not null,
ZaposleniID int not null,
PotrebnoStanje int not null,
TrenutnoStanje int not null,
Visak int not null,
Manjak int not null
)

Alter table dimVrstaPopisa
Add constraint PK_VrstaPopisaID primary key (VrstaPopisaID)

Alter table dimDatum
Add constraint PK_DatumID primary key (DatumID)

Alter table dimArtikli
Add constraint PK_ArtikliID primary key (ArtikliID)

Alter table dimZaposleni
Add constraint PK_ZaposleniID primary key (ZaposleniID)

Alter table faktPopis
Add constraint PK_PopisID primary key (PopisID)



Alter table faktPopis
Add constraint FK_PopisD foreign key (DatumID) 
References dimDatum(DatumID)

Alter table faktPopis
Add constraint FK_PopisVP foreign key (VrstaPopisaID) 
References dimVrstaPopisa(VrstaPopisaID)

Alter table faktPopis
Add constraint FK_PopisZ foreign key (ZaposleniID) 
References dimZaposleni(ZaposleniID)

Alter table faktPopis
Add constraint FK_PopisA foreign key (ArtikliID) 
References dimArtikli(ArtikliID)
go