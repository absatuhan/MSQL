-- Select kullanimi
select * from Person.Person
select Title,FirstName,LastName from Person.Person
select FirstName from Person.Person
-- Kolon Adi Degistirme
select FirstName as Isim from Person.Person
select FirstName as [Isim SoyIsim] from Person.Person
select FirstName as Isim, LastName as SoyIsim from Person.Person
-- Ilk 10 satiri getirme
select * from Production.Product
select top 10 * from Production.Product
select top 10 percent *from Production.Product
-- Where kullanimi
select *from Production.Product
where MakeFlag=1
-- Her iki sartin saglanmis olan datayi cekmek
select * from Production.Product
where MakeFlag=1 and SafetyStockLevel=800
-- Her iki sarttan en az birini saglayan datayi cekmek
select *from Production.Product
where color='Black' or SafetyStockLevel=800
select *from Production.Product
where SafetyStockLevel>800 or SafetyStockLevel<1000
select *from Production.Product
where SafetyStockLevel>=800 or SafetyStockLevel<=1000

select*from HumanResources.Employee
where 
JobTitle='Design Engineer' or 
JobTitle='Tool Designer'
--Farkli yontemi
select *from HumanResources.Employee
where JobTitle in ('Design Engineer', 'Tool Designer')
--icermiyorsa
select *from HumanResources.Employee
where JobTitle not in ('Design Engineer', 'Tool Designer')
--Between kullanimi
select * from Production.Product
where 
SafetyStockLevel>=800 and 
SafetyStockLevel<=1000
--Farkli kullanimi
select *from Production.Product
where SafetyStockLevel between 800 and 1000 -- Between komutu sinirlari da dahil eder
order by Name desc-- Tersten siralama yapacaksak sonuna desc ekliyoruz. Normal siralamada desc kullanmiyoruz

--Where kriteri ile like kullanimi
select *from Production.Product
where 
ProductNumber like 'A%' -- A ile baslayan gerisinde ne olursa olsun gosterimi icin yuzde ifadesi kullanilir

select *from Production.Product
where 
ProductNumber like '%1' -- Sonu 1 ile biten

select *from Production.Product
where
ProductNumber like '%4%'-- icerisinde 4 varmi sorgular

select *from Person.Person
where
FirstName like 'R_b' -- Baslangic ve son elemanini yazarsa

--Group by
select Color, sum(1) from Production.Product
where color is not null
group by Color

select PersonType, sum(1) from Person.Person
group by PersonType

select Class, sum(1) from Production.Product
group by Class

select Suffix, sum(1) from Person.Person
where Suffix is not null
group by Suffix


--Distinct kullanimi
select distinct PersonType from Person.Person -- Tekrar edenleri 1 kere yazar

--Inner Join
select ProductID, Name,ProductSubcategoryID from Production.Product
where ProductSubcategoryID is not null

select *from Production.ProductSubcategory
select *from Production.Product


select 
Production.Product.ProductID,
Production.Product.Name,
Production.ProductSubcategory.Name as ProductionSubCategoryName

from Production.Product inner join Production.ProductSubcategory on 
Production.Product.ProductSubcategoryID=Production.ProductSubcategory.ProductSubcategoryID

-- farkli ornek-- siparis veren kullanicilari siparis numaralariyla listelemek istiyorum
select 
top 20
C.AccountNumber,
count (SOH.SalesOrderNumber) as TotalOrderAmount
from Sales.SalesOrderHeader SOH inner join Sales.Customer C
on SOH.CustomerID=C.CustomerID
group by C.AccountNumber
order by TotalOrderAmount desc

--farkli ornek
select * from Sales.SalesOrderHeader
select *from sales.SalesOrderDetail

select
SOH.AccountNumber,
SOH.SalesOrderNumber,
PP.Name,
PC.Name ProductCategoryName,
PSC.Name ProductSubcategoryName,
SOD.UnitPrice

from Sales.SalesOrderDetail SOD 
inner join Sales.SalesOrderHeader SOH on SOD.SalesOrderID=SOH.SalesOrderID
inner join Production.Product PP on SOD.ProductID=PP.ProductID
inner join Production.ProductSubcategory PSC on PP.ProductSubcategoryID=PSC.ProductSubcategoryID
inner join Production.ProductCategory PC on PSC.ProductCategoryID=PC.ProductCategoryID

--Left Join  & Right Join & Full Join
select *from Production.Product pp inner join Production.ProductSubcategory ppsc
on pp.ProductSubcategoryID=ppsc.ProductSubcategoryID --295 records

select *from Production.Product pp left join Production.ProductSubcategory ppsc
on pp.ProductSubcategoryID=ppsc.ProductSubcategoryID -- 504 records

select *from Production.Product pp right join Production.ProductSubcategory ppsc
on pp.ProductSubcategoryID=ppsc.ProductSubcategoryID -- 295 records

select *from Production.Product pp full join Production.ProductSubcategory ppsc
on pp.ProductSubcategoryID=ppsc.ProductSubcategoryID -- 504records





















