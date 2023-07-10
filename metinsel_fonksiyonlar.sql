--Sayisal Functionlar

--min(coloum)
--max(coloum)

select *from Production.Product

select
Color,
max(SafetyStockLevel) EnBuyukDeger,
min(SafetyStockLevel) EnKucukDeger
from Production.product
group by Color

--Count Kullanimi

select count(*)from Production.Product


select count(*)from Person.Person -- sorgu varmi diye kontrol edilirken
where 
PersonType='EM' and BusinessEntityID=88

select Color,
Count(*) as ToplamMiktar
from Production.Product
where Color is not null
group by color

--Sum Kullanimi
select *from Sales.SalesOrderHeader
select *from Sales.SalesOrderDetail


select sum(SafetyStockLevel)ToplamDeger from production.Product
select count(SafetyStockLevel) deger from Production.Product
select avg(SafetyStockLevel) ortalamasi from Production.Product


select 
ssoh.SalesPersonID,
CONCAT(pp.FirstName,' ',pp.LastName) as NameSurname,
sum(ssod.LineTotal) as Toplam
from Sales.SalesOrderHeader ssoh
inner join Sales.SalesOrderDetail ssod
on ssoh.SalesOrderID=ssod.SalesOrderID
inner join Person.Person pp
on ssoh.SalesPersonID=pp.BusinessEntityID
where 
ssoh.OrderDate='2011-05-31 00:00:00.000'
group by CONCAT(pp.FirstName,' ',pp.LastName)


