-- DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.
CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');
--musteri urun tablosundan urun isimlerini tekrarsiz listele/grupla
--group by cozumu
select urun_isim from musteri_urun
group by urun_isim
--distinc ile cozumu
select distinct(urun_isim)from musteri_urun
-- tabloda kac farkli meyve vardir
select count(Distinct urun_isim)from musteri_urun

-- FETCH NEXT (SAYI) ROW ONLY- OFFSET/LIMIT
-- 1) Tabloyu urun_id ye gore siralayiniz
-- 2) musteri urun tablosundan ilk 3 kaydi listeleyin
select * from musteri_urun order by urun_id fetch next 3 row only-- ilk ucu verir
select * musteri_urun order by urun_id limit 3
-- musteri urun tablosundan ilk kaydi listeler
select * musteri_urun order by urun_id limit 1
--musteri urun tablosundan son uc kaydi listele
select * from musteri_urun order by urun_id desc limit 

CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);

INSERT INTO maas VALUES (10, 'Ali', 5000);
INSERT INTO maas VALUES (10, 'Ali', 7500);
INSERT INTO maas VALUES (20, 'Veli', 10000);
INSERT INTO maas VALUES (30, 'Ayse', 9000);
INSERT INTO maas VALUES (20, 'Ali', 6500);
INSERT INTO maas VALUES (10, 'Adem', 8000);
INSERT INTO maas VALUES (40, 'Veli', 8500);
INSERT INTO maas VALUES (20, 'Elif', 5500);
--offset satir atlamak istedigimizde offset komutunu kullaniriz
-- en yuksek 2. maasi getir
select * from maas order by maas desc offset 1 limit 1 
select * from maas order by maas desc offset 1
fetch next 1 row only
--maas tablosundan en dusuk 4. maasi alalim
select maas from maas order by maas offset 3 limit 1--ilk satiri getirir//limit 2 ilk iki satirir getirir.
--ALTER
--1) ADD default deger ile tabloya bir field ekleme

DROP TABLE IF EXISTS personel
CREATE TABLE personel  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

alter table personel 
add ulke varchar (30)ulke;

alter table personel
add adres varchar (50) default 'Turkiye'-- default olarak yazarsak olusturdugumuz sutuna belirttigimiz veriyi  tum satirlara girer
--DROP TABLODAN SUTUN SILME
alter table personel drop column ulke ;
-- ikili sutun silme
alter table personel drop adres, drop sirket
--RENAME COLUMN SUTUN ADI DEGISTIRME
ALTER TABLE personel
rename column sehir to il
-- TABLO ADI DEGISTIRME
alter table  personel
rename to isci 

--TYPE /SET SUTUNLARIN OZELLIKLERINI DEGISTIRME
alter table isci 
alter column il type varchar(30),
alter column maas set not null
-- eger numerik data turune sahip bir sutunundata turunu string bir data  turune atamak istersek
--type varchar(30)using (maas::varchar(30)) bu formati kulla
alter column maas
type varchar(30) using (maas::varchar(30))


CREATE TABLE ogrenciler2
(
id serial,--serial data turu otomatik olarak  1 den baslayarak sirali olaraksayi atamasi yapar
	       -- insert into ile tabloya veri eklerken serial data turunu kullandigim veri degeri yerine default yazariz
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to x;
COMMIT;--transection dan cikmak icin
select*from ogrenciler2



