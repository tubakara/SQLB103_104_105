--ALIASES
drop table if exists calisanlar
CREATE TABLE calisanlar4  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar4 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar4 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar4 VALUES(345678901, 'Mine Bulut', 'Izmir');
select * from calisanlar4
-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar4
--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar4
-- IS NULL CONDITIOn
drop table if exists insanlar
CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
select * from insanlar
-- Name sutununda null olan değerleri listeleyelim
SELECT name FROM insanlar WHERE name IS NULL
-- Insanlar taplosunda sadece null olmayan değerleri listeleyiniz
SELECT name FROM insanlar WHERE name IS NOT NULL
-- Insanlar toplasunda null değer almış verileri no name olarak değiştiriniz
UPDATE insanlar
SET name='No Name'
WHERE name is null;
drop table if exists insanlar
-- ORDER BY KOMUTU
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar (ASC)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
CREATE TABLE insanlar4
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar4 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar4 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar4 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar4 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar4 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar4 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
select * from insanlar4
--Insanlar tablosundaki datalari adres’e gore siralayin  
SELECT * FROM insanlar4 ORDER BY adres;
SELECT * FROM insanlar4 ORDER BY soyisim;
--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar4 WHERE isim='Mine' ORDER BY ssn
--NOT : Order By komutundan sonra field(sutun) ismi yerine field(sutun) numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin 
SELECT * FROM insanlar4 WHERE soyisim='Bulut' ORDER BY 2
-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar4 ORDER BY ssn DESC;
-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar4 ORDER BY isim ASC, soyisim DESC;
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız 
Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz
*/
SELECT isim,soyisim FROM insanlar4 ORDER BY LENGTH (soyisim) DESC;
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim||' '||soyisim AS isim_soyisim FROM insanlar4 order by length(isim||soyisim)
select isim||' '||soyisim AS isim_soyisim FROM insanlar4 order by length(isim)+length (soyisim)
select concat(isim,' ',soyisim) AS isim_soyisim FROM insanlar4 order by length(isim||soyisim)
select isim||' '||soyisim AS isim_soyisim FROM insanlar4 order by length(concat(isim,soyisim))

---- 									GROUP BY CLAUSE
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
-- komutuyla birlikte kullanılır
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( ‘Ali', ‘Elma', 5);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
--isme gore alinan toplam urunleri bul ve bu urunleri buyukten kucuge sirala

select isim, sum (urun_miktar) as aldigi_toplam_urun from manav
group by isim
order by aldigi_toplam_urun desc

-- Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim)from manav 
group by urun_adi;

