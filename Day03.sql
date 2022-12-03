--Day03
CREATE TABLE ogrenciler8
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler8 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler8 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler8 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler8 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler8 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler8 VALUES(127, 'Mustafa Bak', 'Ali', 99);
SELECT * FROM ogrenciler8
-- İsmi Mustafa Bak veya Nesibe Yılmaz olan kayıtları silelim
DELETE FROM ogrenciler8 WHERE isim='Mustafa Bak' OR isim='Nesibe Yilmaz'
-- Veli İsmi Hasan olan datayı silelim
DELETE FROM ogrenciler8 WHERE veli_isim='Hasan'
-- Bir tablodaki tüm verileri geri almaksızın silme -- Şartsız silme -- TRUNCATE
TRUNCATE TABLE ogrenciler8
-- ON DELETE CASCADE
/*
CREATE TABLE talebeler1
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
YAPMAK YERİNE
*/
DROP TABLE IF EXISTS talebeler -- TABLE VARSA TABLE'I SİLER.
CREATE TABLE talebeler
(
	id CHAR(3) primary key,
	isim VARCHAR(50),
	veli_isim VARCHAR(50),
	yazili_notu int
);
CREATE TABLE notlar
(
	talebe_id CHAR(3),
	ders_adi VARCHAR(30),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler1(id)
	ON DELETE CASCADE
);
INSERT INTO talebeler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler1 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler1 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler1 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler1 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);
SELECT * FROM talebeler
SELECT * FROM notlar
-- NOTLAR TABLOSUNDAN ID'Sİ 123 OLAN DATA'YI SİLİN
DELETE FROM notlar WHERE talebe_id='123'
-- TALEBELER TABLE'INDAN ID'Sİ 126 OLAN DATA'YI SİLİN -- ON DELETE CASCADE OLMADIĞI İÇİN HATA VERDİ.
DELETE FROM talebeler1 WHERE id='126'
-- ON DELETE CASCADE OLDUĞU İÇİN ÇALIŞTI. VE ARTIK CHILD'TA (NOTLAR) DA 126 SİLİNDİ.
DELETE FROM talebeler WHERE id='126'
-- IN CONDITION
DROP TABLE IF EXISTS musteriler
CREATE TABLE musteriler (
	urun_id int,
	musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
SELECT * FROM musteriler
-- Musteriler table'ından ürün ismi Orange, Apple veya Apricot olan data'ları listeleyiniz
SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot'
SELECT * FROM musteriler WHERE urun_isim='Orange' AND urun_id=10
-- IN CONDITION -- Parantez içindekilerin dahil olduğu
SELECT * FROM musteriler WHERE urun_isim IN('Orange', 'Apple', 'Apricot')
-- NOT IN -- Parantez içindekilerin dışındakiler, dahil olmayanlar
SELECT * FROM musteriler WHERE urun_isim NOT IN('Orange', 'Apple', 'Apricot')
-- BETWEEN -- ARASINDA
-- Musteriler tablosundan id'si 20 ile 40 arasında olan verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_id>=20 AND urun_id<=40
--DAHA İYİSİ,
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40
-- NOT BETWEEN -- ARASININ DIŞINDAKİLER
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40


-- 		SUBQUERIES
--SUBQUERY baska bir SORGU(query)'nun icinde calisan SORGU'dur
CREATE TABLE calisanlar2 (
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar2
select * from markalar
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isim,maas,isyeri from calisanlar2
where isyeri IN (select marka_isim from markalar where calisan_sayisi > 15000);

--marka_id si 

SELECT isim,maas,sehir FROM calisanlar2 WHERE ISYERI IN (SELECT marka_isim FROM markalar WHERE marka_id>101);
--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.


--AGGREGATE METHOD KULLANIMI

SELECT max (maas) AS  maksimum_maas FROM calisanlar2
/*
eger bir sutuna gecici olarak bir isim vermek istersek AS komutunu yazdiktan sonra
vermek istedigimiz ismi yazariz.
*/
SELECT max (maas) AS  maksimum_maas FROM calisanlar2
SELECT min (maas) AS  min_maas FROM calisanlar2
-- calisanlar tablosundaki maaslarin toplamini listeleyiniz
SELECT sum (maas)FROM calisanlar2
--maaslarin ortalamasini listeleyin
SELECT avg (maas)FROM calisanlar2
-- ortalamayi yuvarlamak icin
SELECT round (avg (maas),2) FROM calisanlar2
--saydirma count
--calisanlar tablosunda kac kisi var
SELECT count (maas) FROM calisanlar2 --ile asagidaki aynidir ama null olursa maas o zaman * satirlari saydigi icin 
--yanlis sonuc cikabilir
SELECT count * FROM calisanlar2
/*
eger count da * kullanirsak tablodaki tum satirlarin sayisini verir 
sutun adi kullanirsak o sutundakiu sayilari verir
*/
---AGGREGATE METHODLARDA SUBQUERY
--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz
SELECT marka_id,marka_isim, 
(SELECT count(sehir) as sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri)
FROM markalar;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi, (select  sum(maas) from calisanlar2 where isyeri=marka_isim) as maas_toplam
from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve
--minumum maaşini listeleyen bir Sorgu yaziniz.
CREATE VIEW toplamMAAS
AS
SELECT marka_isim,calisan_sayisi, 
(SELECT MAX(maas) FROM calisanlar2 WHERE isyeri=marka_isim) AS en_yuksek_maas,
(SELECT MIN(maas) FROM calisanlar2 WHERE isyeri=marka_isim) AS en_dusuk_maas
FROM markalar
--VIEW KULLANIMI
CREATE VIEW  maxminmaas
AS 
SELECT marka_isim,calisan_sayisi, 
(SELECT MAX(maas) FROM calisanlar2 WHERE isyeri=marka_isim) AS en_yuksek_maas,
(SELECT MIN(maas) FROM calisanlar2 WHERE isyeri=marka_isim) AS en_dusuk_maas
FROM markalar;
SELECT * FROM maxminmaas;
SELECT * FROM toplamMAAS;
/*
YAPTIGIMIZ SORGULARI HAFIZAYA ALIR VE TEKRAR BIZDEN ISTENEN SORGULAMA YERINE VIEW E ATADIGIMIZ ISMI 
SELECT KOMUTUYLA CAGIRIRIZ
*/
--	exist condition


CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
 select * from mart
 select * from nisan

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
-- URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
SELECT urun_id,musteri_isim FROM mart 
where exists (SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id)

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

SELECT urun_isim,musteri_isim FROM nisan
WHERE exists (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim)
----Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
 --NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
 
--TABLODAKI DATANIN UPDATE EDILMESI 
--DML -->UPDATE
 CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
 
 CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
SELECT * FROM tedarikciler
SELECT * FROM urunler
--vergi nosu 102 olan tedarikcini  firma ismini vestel olarak guncelle
--UPDATE tablo_adi
--SET sutun_ismi='istenen veri' WHERE SUTUN_ISMI='istenen veri'
UPDATE tedarikciler
SET firma_ismi='Vestel' where vergi_no=102;
---- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikci
set firma_ismi ='Casper', irtibat_ismi='Ali Veli' where vergi_no=101

---- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler 
SET urun_isim='Telefon' WHERE urun_isim='Phone'

---- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
 update urunler 
 set urun_id=urun_id+1 WHERE urun_id>1500
select * from urunler
-- urunler tablosundaki tüm ürünlerin urun_id değerini 
--ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler
set urun_id=urun_id+ted_vergino
DELETE FROM tedarikciler
---- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz
update urunler 
set urun_isim=(SELECT firma_ismi FROM tedarikciler WHERE IRTIBAT_ISMI='Adam Eva')
where musteri_isim='Ali Bak'
--* Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin

UPDATE urunler 
SET musteri_isim=(SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')
WHERE MUSTERI_ISIM='Laptop'



























