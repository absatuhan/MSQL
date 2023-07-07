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
select production.categories.category_name,count(brand_id) from production.products
inner join production.categories on production.products.category_id=production.categories.category_id
group by production.categories.category_name

--sales.order musterilerine gore siparis adetlerini cekelim


--siparis adedine gore en cok satis yapan magazayi cekelim

--siparis adedine gore en cok satis yapan personeli cekelim

--sales.order_items en cok satis yapan 5 urunu ve ilgili urunlerin marka categori isimlerini getirelim

--production.stocks magaza bazinda urunlerin toplam adetlerini cekelim
