--[production].[product] tablosunda bulunan kolonlari turkcelestirin
select *from production.products
select product_id as urunNumarasi, product_name urun_ismi, brand_id marka_numarasi,category_id kategori_numarasi, model_year model_yili,list_price liste_fiyati from production.products

--[production].[products] tablosunda model yili 2016 olan urunleri sorgulayin
select *from production.products
where 
model_year=2016

--[sales].[costumers] email adresi yahoo.com olan ve state NY ve CA olan kayitlari sorgulayin
select *from sales.customers
where 
email like '%yahoo.com%' and
state in ('NY','CA')


--[sales].[costumers] ismi D ile baslayan veya soyadi s ile biten musterileri sorgulayin
select *from sales.customers
where 
first_name like 'D%' or
last_name like '%s'

--production.product brand_id, category_id liste olarak cekelim
select 
pp.product_id,
pp.product_name,
pb.brand_name,
pc.category_id
from production.products pp
inner join production.brands pb on pp.brand_id=pb.brand_id
inner join production.categories pc on pp.category_id=pc.category_id
order by pc.category_name,pb.brand_name

--production.product  category_id degerlerine gore kac marka var
select production.categories.category_name,count(brand_id) as markaSayisi from production.products
inner join production.categories on production.products.category_id=production.categories.category_id
group by production.categories.category_name

--sales.order musterilerine gore siparis adetlerini cekelim
select 
concat (sc.first_name, ' ',sc.last_name) as FullName  , count(so.order_id) as siparisAdedi
from sales.orders so
inner join sales.customers sc on so.customer_id=sc.customer_id
group by concat (sc.first_name, ' ',sc.last_name)

--siparis adedine gore en cok satis yapan magazayi cekelim
select 
top 1
ss.store_name,count(so.order_id) as SatisAdedi
from sales.orders so
inner join sales.stores ss on so.store_id=ss.store_id
group by ss.store_name
order by SatisAdedi desc
--siparis adedine gore en cok satis yapan personeli cekelim

select top 1
CONCAT(ss.first_name, ' ',ss.last_name) as FullName, count(so.order_id) as SatisAdedi
from sales.orders so
inner join sales.staffs ss on ss.staff_id=so.staff_id
group by concat (ss.first_name, ' ',ss.last_name)
order by SatisAdedi desc

--sales.order_items en cok satis yapan 5 urunu ve ilgili urunlerin marka categori isimlerini getirelim
select top 5 
pb.brand_name,
pc.category_name,
count(soi.order_id)
from sales.order_items soi
inner join production.products pp on soi.product_id=pp.product_id
inner join production.categories pc on pp.category_id=pc.category_id
inner join production.brands pb on pp.brand_id=pb.brand_id
group by
pb.brand_name, 
pc.category_name
order by count (soi.order_id) desc

--production.stocks magaza bazinda urunlerin toplam adetlerini cekelim
select 
ss.store_name, sum(ps.quantity) as ToplamUrunAdedi
from production.stocks ps
inner join sales.stores ss on ss.store_id=ps.store_id
group by store_name


