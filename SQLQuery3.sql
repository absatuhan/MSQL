create database Udemy
use Udemy
--Asagidaki parametrelere gore tablo olusturma
--Personeller
--id int primary
--isim nvarchar(50) zorunlu
--soyisim nvarchar(50) zorunlu
--emailAdress nvarchar(200) zorunlu ve benzersiz
--cinsiyet nvarchar(1)
--olusturmaTarihi zorunlu
--durum bool default true

create table Personeller
(
id int primary key,
isim nvarchar(50) not null,
soyIsim nvarchar (50) not null,
emailAdress nvarchar(200) not null unique,
cinsiyet nvarchar(1),
olusturmaTarihi datetime not null,
durum bit default 'true'
)


--olusturdugumu tabloya data cekmek
insert into Personeller(id,isim,soyIsim,emailAdress,olusturmaTarihi)
select  
pp.BusinessEntityID,
pp.FirstName,
pp.LastName,
pp.FirstName+'.'+pp.Lastname+'@abc.com',
GETDATE()
from AdventureWorks2019.Person.Person as pp
inner join AdventureWorks2019.Sales.SalesPerson ssp on
pp.BusinessEntityID=ssp.BusinessEntityID

select *from Personeller



--PersonelKayitEkle Proceduru olusturma
create proc PersonelKayitEkle
(
@id int,
@isim nvarchar(50),
@soyIsim nvarchar(50),
@emailAdress nvarchar(100),
@cinsiyet nvarchar(1),
@olusturmaTarihi datetime,
@durum bit
)
as begin 
insert into Personeller(id,isim,soyIsim,emailAdress,cinsiyet,olusturmaTarihi,durum) 
values (@id,@isim,@soyIsim,@emailAdress,@cinsiyet,@olusturmaTarihi,@durum)
return @@rowcount 
end

exec PersonelKayitEkle @id=4562154,@isim='dilara',@soyIsim='doganlar',@emailAdress='dilaradoganlar81@abc.com',@cinsiyet='F',
@olusturmaTarihi='2023-07-12',@durum=1
end
--PersonelDuzenle
create proc PersonelDuzenle
(
@id int,
@isim nvarchar(50),
@soyIsim nvarchar(50),
@emailAdress nvarchar(100),
@cinsiyet nvarchar(1),
@olusturmaTarihi datetime,
@durum bit
)
as begin update Personeller
set
isim=@isim, soyIsim=@soyIsim,emailAdress=@emailAdress,cinsiyet=@cinsiyet, olusturmaTarihi=@olusturmaTarihi, durum=durum
where id=@id
end 

exec PersonelDuzenle @id=4562154,@isim='Batuhan',@soyIsim='Sofu',@emailAdress='absatuhan@gmail.com',@cinsiyet='M',
@olusturmaTarihi='2016-07-06',@durum=1


--PersonelSil

create proc PersonelSilme
(
@id int
)
as begin delete from Personeller
where @id=id
end
exec PersonelSilme @id=4562154

--PersonelListe Tum listeyi getircek (Parametre almayan)
create proc personelGetir
as 
begin 
select * from Personeller
end
exec personelGetir

--PersonelGetirID ID ye gore personel getircek (ID alan sp eger deger girisi olmazsa id default olarak 0 gelecek)
create proc PersonelGetirID
(
@id int =0
)
as begin
select *from Personeller
where
id=@id
end
exec PersonelGetirID @id=274

--PersonelAraEmailAdress (email adresi alacak zorunlu)
create proc PersonelAraEmailAdress
(
@emailAdress nvarchar(100) 
)
as begin
select *from Personeller
where emailAdress=@emailAdress
end
exec PersonelAraEmailAdress @emailAdress='StephenJiangabc.com'


