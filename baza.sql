create database KnjizaraMISbaza
go

use KnjizaraMISbaza
go

create table Kupac
(
KupacID int identity(1,1) not null,
Ime nvarchar(50) not null,
Prezime nvarchar(50) not null
)

create table Dobavljac
(
DobavljacID int identity(1,1) not null,
Sifra nvarchar(10) not null,
Naziv nvarchar(50) not null,
BrojTelefona nvarchar(20) not null,
Adresa nvarchar(50) not null
)

create table Izdavac
(
IzdavacID int identity(1,1) not null,
Ime nvarchar(50) not null,
Prezime nvarchar(50) not null
)

create table Delatnost
(
DelatnostID int identity(1,1) not null,
NazivDelatnosti nvarchar(50) not null
)

create table Zaposleni
(
ZaposleniID int identity(1,1) not null,
Ime nvarchar(50) not null,
Prezime nvarchar(50) not null,
DelatnostID int not null
)

create table Narudzbenica
(
NarudzbenicaID int identity(1,1) not null,
Sifra nvarchar(10) not null,
Datum date not null,
DobavljacID int not null
)

create table Artikli
(
ArtikliID int identity(1,1) not null,
Naziv nvarchar(50) not null,
Sifra nvarchar(50) not null
)

create table StavkeNarudzbenice
(
StavkeNID int identity(1,1) not null,
NarudzbenicaID int not null,
NazivArtikla nvarchar(50) not null,
Kolicina int not null,
ArtikliID int not null
)

create table Racun
(
RacunID int identity(1,1) not null,
BrojRacuna int not null,
Datum date not null,
Iznos int not null,
KupacID int not null,
ZaposleniID int not null
)

create table StavkeRacuna
(
StavkeRacunaID int identity(1,1) not null,
RacunID int not null,
NazivArtikla nvarchar(50) not null,
SifraArtikla int not null,
Cena int not null,
Kolicina int not null,
ArtikliID int not null
)

create table KancelarijskiMaterijal
(
KancelarijskiMaterijalID int identity(1,1) not null,
ArtikliID int not null,
Oznaka nvarchar(10) not null
)

create table Udzbenik
(
UdzbenikID int identity(1,1) not null,
ArtikliID int not null,
Naslov nvarchar(50) not null
)

create table Izdaje
(
IzdavacID int not null,
UdzbenikID int not null,
ArtikliID int not null,
DatumIzdavanja date not null
)

create table Datum
(
DatumID int identity(1,1) not null,
Dan nvarchar(50) not null,
Mesec nvarchar(50) not null,
Godina nvarchar(50) not null
)

create table VrstaPopisa
(
VrstaPopisaID int identity(1,1) not null,
NazivVrstePopisa nvarchar(50) not null
)

create table Popis
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

Alter table Datum
Add constraint PK_DatumID primary key (DatumID)

Alter table VrstaPopisa
Add constraint PK_VrstaPopisaID primary key (VrstaPopisaID)

Alter table Popis
Add constraint PK_PopisID primary key (PopisID)

Alter table Kupac
Add constraint PK_KupacID primary key (KupacID)

Alter table Dobavljac
Add constraint PK_DobavljacID primary key (DobavljacID)

Alter table Izdavac
Add constraint PK_IzdavacID primary key (IzdavacID)

Alter table Delatnost
Add constraint PK_DelatnostID primary key (DelatnostID)

Alter table Zaposleni
Add constraint PK_ZaposleniID primary key (ZaposleniID)

Alter table Narudzbenica
Add constraint PK_NarudzbenicaID primary key (NarudzbenicaID)

Alter table Artikli
Add constraint PK_ArtikliID primary key (ArtikliID)

Alter table StavkeNarudzbenice
Add constraint PK_StavkeNarudzbeniceID primary key (StavkeNID,NarudzbenicaID)

Alter table Racun
Add constraint PK_RacunID primary key (RacunID)

Alter table StavkeRacuna
Add constraint PK_StavkeRacunaID primary key (StavkeRacunaID,RacunID)

Alter table KancelarijskiMaterijal
Add constraint PK_KancelarijskiMaterijalID primary key (KancelarijskiMaterijalID,ArtikliID)

Alter table Udzbenik
Add constraint PK_UdzbenikID primary key (UdzbenikID,ArtikliID)

Alter table Izdaje
Add constraint PK_Kupac primary key (IzdavacID,UdzbenikID,ArtikliID)



Alter table Popis
Add constraint FK_PopisD foreign key (DatumID) 
References Datum(DatumID)

Alter table Popis
Add constraint FK_PopisVP foreign key (VrstaPopisaID) 
References VrstaPopisa(VrstaPopisaID)

Alter table Popis
Add constraint FK_PopisZ foreign key (ZaposleniID) 
References Zaposleni(ZaposleniID)

Alter table Popis
Add constraint FK_PopisA foreign key (ArtikliID) 
References Artikli(ArtikliID)

Alter table Narudzbenica
Add constraint FK_NarudzbenicaD foreign key (DobavljacID) 
References Dobavljac(DobavljacID)

Alter table Racun
Add constraint FK_RacunK foreign key (KupacID) 
References Kupac(KupacID)

Alter table Racun
Add constraint FK_RacunZ foreign key (ZaposleniID) 
References Zaposleni(ZaposleniID)

Alter table StavkeRacuna
Add constraint FK_StavkeRacunaR foreign key (RacunID) 
References Racun(RacunID)

Alter table StavkeRacuna
Add constraint FK_StavkeRacunaA foreign key (ArtikliID) 
References Artikli(ArtikliID)

Alter table StavkeNarudzbenice
Add constraint FK_StavkeNarudzbeniceN foreign key (NarudzbenicaID) 
References Narudzbenica(NarudzbenicaID)

Alter table StavkeNarudzbenice
Add constraint FK_StavkeNarudzbeniceA foreign key (ArtikliID) 
References Artikli(ArtikliID)

Alter table KancelarijskiMaterijal
Add constraint FK_KancelarijskiMaterijalA foreign key (ArtikliID) 
References Artikli(ArtikliID)

Alter table Udzbenik
Add constraint FK_UdzbenikA foreign key (ArtikliID) 
References Artikli(ArtikliID)

Alter table Izdaje
Add constraint FK_IzdajeI foreign key (IzdavacID) 
References Izdavac(IzdavacID)

Alter table Izdaje
Add constraint FK_IzdajeU foreign key (UdzbenikID,ArtikliID) 
References Udzbenik (UdzbenikID,ArtikliID)

Alter table Zaposleni
Add constraint FK_ZaposleniDelatnost foreign key (DelatnostID) 
References Delatnost(DelatnostID)
go

create procedure sp_DelatnostInsert
(
@pNazivDelatnosti nvarchar(50)
)
as 
begin
begin transaction
insert into Delatnost(NazivDelatnosti)
values(@pNazivDelatnosti)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_DatumInsert
(
@pDan nvarchar(50),
@pMesec nvarchar(50),
@pGodina nvarchar(50)
)
as 
begin
begin transaction
insert into Datum(Dan,Mesec,Godina)
values(@pDan,@pMesec,@pGodina)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_VrstaPopisaInsert
(
@pNazivVrstePopisa nvarchar(50)
)
as 
begin
begin transaction
insert into VrstaPopisa(NazivVrstePopisa)
values(@pNazivVrstePopisa)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_PopisInsert
(
@pVrstaPopisaID int,
@pDatumID int,
@pArtikliID int,
@pZaposleniID int,
@pPotrebnoStanje int,
@pTrenutnoStanje int,
@pVisak int,
@pManjak int
)
as 
begin
begin transaction
insert into Popis(VrstaPopisaID,DatumID,ArtikliID,ZaposleniID,PotrebnoStanje,TrenutnoStanje,Visak,Manjak)
values(@pVrstaPopisaID,@pDatumID,@pArtikliID,@pZaposleniID,@pPotrebnoStanje,@pTrenutnoStanje,@pVisak,@pManjak)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_KupacInsert
(
@pIme nvarchar(50),
@pPrezime nvarchar(50)
)
as 
begin
begin transaction
insert into Kupac(Ime,Prezime)
values(@pIme,@pPrezime)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_KupacUpdate
(
@pKupacID int,
@pIme nvarchar(50),
@pPrezime nvarchar(50)
)
as 
begin
begin transaction
update Kupac set Ime=@pIme,Prezime=@pPrezime
where KupacID=@pKupacID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_KupacDelete
(
@pKupacID int
)
as 
begin 
begin transaction
delete from Kupac where KupacID=@pKupacID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go



create procedure sp_DobavljacInsert
(
@pSifra nvarchar(10),
@pNaziv nvarchar(50),
@pBrojTelefona nvarchar(20),
@pAdresa nvarchar(50)
)
as 
begin
begin transaction
insert into Dobavljac(Sifra,Naziv,BrojTelefona,Adresa)
values(@pSifra,@pNaziv,@pBrojTelefona,@pAdresa)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_DobavljacUpdate
(
@pDobavljacID int,
@pSifra nvarchar(10),
@pNaziv nvarchar(50),
@pBrojTelefona nvarchar(20),
@pAdresa nvarchar(50)
)
as 
begin
begin transaction
update Dobavljac set Sifra=@pSifra,Naziv=@pNaziv,BrojTelefona=@pBrojTelefona,Adresa=@pAdresa
where DobavljacID=@pDobavljacID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_DobavljacDelete
(
@pDobavljacID int
)
as 
begin 
begin transaction
delete from Dobavljac where DobavljacID=@pDobavljacID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_IzdavacInsert
(
@pIme nvarchar(50),
@pPrezime nvarchar(50)
)
as 
begin
begin transaction
insert into Izdavac(Ime,Prezime)
values(@pIme,@pPrezime)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_IzdavacUpdate
(
@pIzdavacID int,
@pIme nvarchar(50),
@pPrezime nvarchar(50)
)
as 
begin
begin transaction
update Izdavac set Ime=@pIme,Prezime=@pPrezime
where IzdavacID=@pIzdavacID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_IzdavacDelete
(
@pIzdavacID int
)
as 
begin 
begin transaction
delete from Izdavac where @pIzdavacID=@pIzdavacID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_ZaposleniInsert
(
@pIme nvarchar(50),
@pPrezime nvarchar(50),
@pDelatnostID int
)
as 
begin
begin transaction
insert into Zaposleni(Ime,Prezime,DelatnostID)
values(@pIme,@pPrezime,@pDelatnostID)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_ZaposleniUpdate
(
@pZaposleniID int,
@pIme nvarchar(50),
@pPrezime nvarchar(50),
@pDelatnostID int
)
as 
begin
begin transaction
update Zaposleni set Ime=@pIme,Prezime=@pPrezime,DelatnostID=@pDelatnostID
where ZaposleniID=@pZaposleniID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_ZaposleniDelete
(
@pZaposleniID int
)
as 
begin 
begin transaction
delete from Zaposleni where ZaposleniID=@pZaposleniID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_NarudzbenicaInsert
(
@pSifra nvarchar(10),
@pDatum date,
@pDobavljacID int
)
as 
begin
begin transaction
insert into Narudzbenica(Sifra,Datum,DobavljacID)
values(@pSifra,@pDatum,@pDobavljacID)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_NarudzbenicaUpdate
(
@pNarudzbenicaID int,
@pSifra nvarchar(10),
@pDatum date,
@pDobavljacID int
)
as 
begin
begin transaction
update Narudzbenica set Sifra=@pSifra,Datum=@pDatum,DobavljacID=@pDobavljacID
where NarudzbenicaID=@pNarudzbenicaID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_NarudzbenicaDelete
(
@pNarudzbenicaID int
)
as 
begin 
begin transaction
delete from Narudzbenica where NarudzbenicaID=@pNarudzbenicaID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_ArtikliInsert
(
@pNaziv nvarchar(50),
@pSifra nvarchar(50)
)
as 
begin
begin transaction
insert into Artikli(Naziv, Sifra)
values(@pNaziv,@pSifra)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_ArtikliUpdate
(
@pArtikliID int,
@pNaziv nvarchar(50),
@pSifra nvarchar(50)
)
as 
begin
begin transaction
update Artikli set Naziv=@pNaziv, Sifra=@pSifra
where ArtikliID=@pArtikliID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_ArtikliDelete
(
@pArtikliID int
)
as 
begin 
begin transaction
delete from Artikli where ArtikliID=@pArtikliID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_StavkeNarudzbeniceInsert
(
@pNarudzbenicaID int,
@pNazivArtikla nvarchar(50),
@pKolicina int,
@pArtikliID int
)
as 
begin
begin transaction
insert into StavkeNarudzbenice(NarudzbenicaID,NazivArtikla,Kolicina,ArtikliID)
values(@pNarudzbenicaID,@pNazivArtikla,@pKolicina,@pArtikliID)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_StavkeNarudzbeniceUpdate
(
@pStavkeNID int,
@pNarudzbenicaID int,
@pNazivArtikla nvarchar(50),
@pKolicina int,
@pArtikliID int
)
as 
begin
begin transaction
update StavkeNarudzbenice set NarudzbenicaID=@pNarudzbenicaID,NazivArtikla=@pNazivArtikla,Kolicina=@pKolicina,ArtikliID=@pArtikliID
where StavkeNID=@pStavkeNID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_StavkeNarudzbeniceDelete
(
@pStavkeNID int
)
as 
begin 
begin transaction
delete from StavkeNarudzbenice where StavkeNID=@pStavkeNID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_RacunInsert
(
@pBrojRacuna int,
@pDatum date,
@pIznos int,
@pKupacID int,
@pZaposleniID int
)
as 
begin
begin transaction
insert into Racun(BrojRacuna,Datum,Iznos,KupacID,ZaposleniID)
values(@pBrojRacuna,@pDatum,@pIznos,@pKupacID,@pZaposleniID)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_RacunUpdate
(
@pRacunID int,
@pBrojRacuna int,
@pDatum date,
@pIznos int,
@pKupacID int,
@pZaposleniID int
)
as 
begin
begin transaction
update Racun set BrojRacuna=@pBrojRacuna,Datum=@pDatum,Iznos=@pIznos,KupacID=@pKupacID,ZaposleniID=@pZaposleniID
where RacunID=@pRacunID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_RacunDelete
(
@pRacunID int
)
as 
begin 
begin transaction
delete from Racun where RacunID=@pRacunID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_StavkeRacunaInsert
(
@pRacunID int,
@pNazivArtikla nvarchar(50),
@pSifraArtikla int,
@pCena int,
@pKolicina int,
@pArtikliID int
)
as 
begin
begin transaction
insert into StavkeRacuna(RacunID,NazivArtikla,SifraArtikla,Cena,Kolicina,ArtikliID)
values(@pRacunID,@pNazivArtikla,@pSifraArtikla,@pCena,@pKolicina,@pArtikliID)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_StavkeRacunaUpdate
(
@pStavkeRacunaID int,
@pRacunID int,
@pNazivArtikla nvarchar(50),
@pSifraArtikla int,
@pCena int,
@pKolicina int,
@pArtikliID int
)
as 
begin
begin transaction
update StavkeRacuna set RacunID=@pRacunID,NazivArtikla=@pNazivArtikla,SifraArtikla=@pSifraArtikla,Cena=@pCena,Kolicina=@pKolicina,ArtikliID=@pArtikliID
where StavkeRacunaID=@pStavkeRacunaID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_StavkeRacunaDelete
(
@pStavkeRacunaID int
)
as 
begin 
begin transaction
delete from StavkeRacuna where StavkeRacunaID=@pStavkeRacunaID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_KancelarijskiMaterijalInsert
(
@pArtikliID int,
@pOznaka nvarchar(10)
)
as 
begin
begin transaction
insert into KancelarijskiMaterijal(ArtikliID,Oznaka)
values(@pArtikliID,@pOznaka)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_KancelarijskiMaterijalUpdate
(
@pKancelarijskiMaterijalID int,
@pArtikliID int,
@pOznaka nvarchar(10)
)
as 
begin
begin transaction
update KancelarijskiMaterijal set ArtikliID=@pArtikliID,Oznaka=@pOznaka
where KancelarijskiMaterijalID=@pKancelarijskiMaterijalID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_KancelarijskiMaterijalDelete
(
@pKancelarijskiMaterijalID int
)
as 
begin 
begin transaction
delete from KancelarijskiMaterijal where KancelarijskiMaterijalID=@pKancelarijskiMaterijalID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_UdzbenikInsert
(
@pArtikliID int,
@pNaslov nvarchar(50)
)
as 
begin
begin transaction
insert into Udzbenik(ArtikliID,Naslov)
values(@pArtikliID,@pNaslov)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_UdzbenikUpdate
(
@pUdzbenikID int,
@pArtikliID int,
@pNaslov nvarchar(50)
)
as 
begin
begin transaction
update Udzbenik set ArtikliID=@pArtikliID,Naslov=@pNaslov
where UdzbenikID=@pUdzbenikID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_UdzbenikDelete
(
@pUdzbenikID int
)
as 
begin 
begin transaction
delete from Udzbenik where UdzbenikID=@pUdzbenikID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

create procedure sp_IzdajeInsert
(
@pIzdavacID int,
@pUdzbenikID int,
@pArtikliID int,
@pDatumIzdavanja date
)
as 
begin
begin transaction
insert into Izdaje(IzdavacID,UdzbenikID,ArtikliID,DatumIzdavanja)
values(@pIzdavacID,@pUdzbenikID,@pArtikliID,@pDatumIzdavanja)
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_IzdajeUpdate
(
@pIzdavacID int,
@pUdzbenikID int,
@pArtikliID int,
@pDatumIzdavanja date
)
as 
begin
begin transaction
update Izdaje set DatumIzdavanja=@pDatumIzdavanja
where IzdavacID=@pIzdavacID and UdzbenikID=@pUdzbenikID and ArtikliID=@pArtikliID
if @@ERROR <> 0
begin
rollback
end
else 
begin
commit
end
end
go

create procedure sp_IzdajeDelete
(
@pIzdavacID int,
@pUdzbenikID int,
@pArtikliID int
)
as 
begin 
begin transaction
delete from Izdaje where IzdavacID=@pIzdavacID and UdzbenikID=@pUdzbenikID and ArtikliID=@pArtikliID
if @@ERROR <> 0
begin
rollback
end
else
begin
commit
end
end
go

exec sp_ArtikliInsert 'Sveska','B32'
exec sp_ArtikliInsert 'Olovka','A43'
exec sp_ArtikliInsert 'Rezac','C23'
exec sp_ArtikliInsert 'Fizika II godina','D46'
exec sp_ArtikliInsert 'Latniski Jezik I godina','E78'
exec sp_ArtikliInsert 'Vezbanka','D25'
exec sp_ArtikliInsert 'Flomasteri','M55'
exec sp_ArtikliInsert 'Korektor','P44'
exec sp_ArtikliInsert 'Ruski Jezik IV godina','E55'
exec sp_ArtikliInsert 'Hemija I godina','S34'

exec sp_DelatnostInsert 'Prodavac'
exec sp_DelatnostInsert 'Prijem artikala'
exec sp_DelatnostInsert 'Skladistenje'

exec sp_ZaposleniInsert 'Milan','Babic',1
exec sp_ZaposleniInsert 'Ivana','Tadic',1
exec sp_ZaposleniInsert 'Ana','Korac',1
exec sp_ZaposleniInsert 'Petar','Dudic',1
exec sp_ZaposleniInsert 'Marko','Radovic',2
exec sp_ZaposleniInsert 'Sanja','Jokic',3

exec sp_VrstaPopisaInsert 'MESECNI'
exec sp_VrstaPopisaInsert 'POLUGODISNJI'
exec sp_VrstaPopisaInsert 'GODISNJI'

exec sp_DatumInsert '02','02','2020'
exec sp_DatumInsert '03','03','2020'
exec sp_DatumInsert '04','06','2020'

exec sp_PopisInsert 1,1,1,1,47,47,0,0
exec sp_PopisInsert 1,1,2,2,35,35,0,0
exec sp_PopisInsert 1,1,3,1,52,52,0,0
exec sp_PopisInsert 1,1,4,2,55,53,0,2
exec sp_PopisInsert 1,1,5,1,58,60,2,0
exec sp_PopisInsert 2,2,6,3,78,78,0,0
exec sp_PopisInsert 2,2,7,4,44,44,0,0
exec sp_PopisInsert 2,2,8,3,45,40,0,5
exec sp_PopisInsert 2,2,9,4,102,105,3,0
exec sp_PopisInsert 2,2,10,3,57,57,0,0
exec sp_PopisInsert 3,3,1,5,105,105,0,0
exec sp_PopisInsert 3,3,2,6,43,40,0,3
exec sp_PopisInsert 3,3,3,5,105,100,5,0
exec sp_PopisInsert 3,3,4,6,43,43,0,0
exec sp_PopisInsert 3,3,5,5,105,107,2,0

exec sp_KupacInsert 'Marija','Lazic'
exec sp_KupacInsert 'Darko','Rodic'
exec sp_KupacInsert 'Janko','Kovacevic'
exec sp_KupacInsert 'Dimitrije','Tomic'
exec sp_KupacInsert 'Marko','Jokic'
exec sp_KupacInsert 'Ana','Petrovic'
exec sp_KupacInsert 'Dejana','Andjelkovic'

exec sp_RacunInsert 1,'2020-05-12',700,1,1
exec sp_RacunInsert 1,'2020-05-14',750,2,2

exec sp_StavkeRacunaInsert 1,'Sveska',20,100,2,1
exec sp_StavkeRacunaInsert 1,'Fizika II godina',21,500,1,4
exec sp_StavkeRacunaInsert 2,'Vezbanka',30,50,1,6
exec sp_StavkeRacunaInsert 2,'Korektor',31,100,2,8
exec sp_StavkeRacunaInsert 2,'Hemija I godina',32,500,1,10

exec sp_DobavljacInsert '38493','Dobavljac 1','0642334322','Vojislava Ilica 8'
exec sp_DobavljacInsert '45345','Dobavljac 2','0635475948','Kataniceva 12'

exec sp_NarudzbenicaInsert '233','2020-05-15',1
exec sp_NarudzbenicaInsert '234','2020-05-16',1

exec sp_StavkeNarudzbeniceInsert 1,'Sveska',25,1
exec sp_StavkeNarudzbeniceInsert 1,'Rezac',20,3
exec sp_StavkeNarudzbeniceInsert 2,'Vezbanka',30,6
exec sp_StavkeNarudzbeniceInsert 2,'Flomasteri',15,7

exec sp_KancelarijskiMaterijalInsert 1,'Sveska'
exec sp_KancelarijskiMaterijalInsert 2,'Olovka'
exec sp_KancelarijskiMaterijalInsert 3,'Rezac'
exec sp_KancelarijskiMaterijalInsert 6,'Vezbanka'
exec sp_KancelarijskiMaterijalInsert 7,'Flomasteri'
exec sp_KancelarijskiMaterijalInsert 8,'Korektor'

exec sp_UdzbenikInsert 4,'Fizika II godina'
exec sp_UdzbenikInsert 5,'Latniski Jezik I godina'
exec sp_UdzbenikInsert 9,'Ruski Jezik IV godina'
exec sp_UdzbenikInsert 10,'Hemija I godina'

exec sp_IzdavacInsert 'Pera','Todorovic'
exec sp_IzdavacInsert 'Mira','Rokvic'
exec sp_IzdavacInsert 'Dejan','Petrovic'
exec sp_IzdavacInsert 'Ninoslav','Bandic'
exec sp_IzdavacInsert 'Jovana','Stanimirovic'

exec sp_IzdajeInsert 1,1,4,'2018-05-18'
exec sp_IzdajeInsert 2,1,4,'2018-03-17'
exec sp_IzdajeInsert 3,2,5,'2017-02-25'
exec sp_IzdajeInsert 4,3,9,'2018-09-16'
exec sp_IzdajeInsert 5,4,10,'2017-05-14'