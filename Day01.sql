--DDL - DATA DEFINITION LANG.
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar kullanilir
kayit_tarih date	

);
--VAR OLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
as --benzer tablodaki basliklarla ve data tipleritle yeni bir tablo olusturmak icin
--normal tablo olustururkenki parantezler yerine as kullanip select komutuyla almak istedigimiz verileri aliriz
select isim,soyisim,not_ort FROM ogrenciler1;
--DML - DATA MANUPILATION LANGUAGE
--INSERT (database e veri ekleme)
INSERT INTO ogrenciler VALUES('1234567','Said','Ilhan',85.5,now()); --now bugunun tarihidir
INSERT INTO ogrenciler VALUES('1234567','Said','Ilhan',85.5,'2020-12-11');
--BIR TABLOYA PARCALI VERI EKLEME
INSERT INTO ogrenciler(isim,soyisim) VALUES('erol','Evren');

--DQL - DATA QURY LANGUAGE
--SELECT

select *from ogrenciler;--* hersey anlamindadir








