CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar kullanilir
kayit_tarih date);

--varolan tablodan yeni bir tablo
create table notlar01
as select isim,not_ort from ogrenciler2;
select *from notlar

--insert - tablo icine veri ekleme
create  table talebeler
(
isim varchar (10),
notlar real
);
insert into talebeler values('tugba',100);
insert into talebeler values('zeliha',80);
insert into talebeler values('fatma',70);
insert into talebeler values('mehmet',70);
select notlar from talebeler;
--CONSTRAINT
--UNIQUE
--NOT NULL
CREATE TABLE ogrenciler3
(
ogrenci_no char(7) UNIQUE,
isim varchar(20) NOT NULL,
soyisim varchar(25),
not_ort real,--ondalikli sayilar kullanilir
kayit_tarih date);
select *from ogrenciler3;
INSERT INTO ogrenciler3 values('1234567','tugba','kara',99.9,now());
INSERT INTO ogrenciler3 values('1234568','ali','veli',99.9,now());
insert into ogrenciler3 (ogrenci_no,soyisim,not_ort) values(2345678,'evren',85.5)--isim e not null kisitlamasi var 
-- bu yuzden isim kismi bos gecemez

--PRIMARY KEY OLUSTURMA
CREATE TABLE ogrenciler4
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar kullanilir
kayit_tarih date);
--PRIMARY KEY 2. YOL
CREATE TABLE ogrenciler5
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar kullanilir
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)
);
--3. yol
CREATE TABLE ogrenciler6
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar kullanilir
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
);
--Practice 4:
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
----“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.

create table tedarikciler3
(
tedarikci_id char(10) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);
create table URUNLER
(
	tedarikci_id char(5),
	urun_id char(5),
	Foreign Key(tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
);
SELECT * FROM URUNLER;
SELECT * FROM TEDARIKCILER3;
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun
*/
CREATE TABLE CALISANLAR
(
	id varchar(5)PRIMARY KEY,
	isim varchar(20) UNIQUE,
	maas int NOT NULL,
	ise_baslama date
);
CREATE TABLE adresler
(
adres_id char(5),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),
	FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
SELECT * FROM CALISANLAR;
SELECT * FROM ADRESLER;

CREATE TABLE CALISANLAR01
(
	id varchar(5)PRIMARY KEY,
	isim varchar(20) UNIQUE,
	maas int CHECK(maas>10000),
	ise_baslama date
);
INSERT INTO CALISANLAR01 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');
--DQL --WHERE KULLANIMI
SELECT *FROM calisanlar;
SELECT *FROM adresler;
SELECT isim FROM calisanlar;
--calisanlar tablosundan maasi 5000 den buyuk olanlarin isimlerini listele
SELECT isim,maas  FROM calisanlar WHERE maas>5000;
--calisnalar tablosundan ismi veli han olan tum veriyi getir.

SELECT * FROM calisanlar WHERE isim='Veli Han';

-- calisanlar tablosondan maasi 5000 olab tum bilgileri verinb
SELECT *FROM calisanlar WHERE maas=5000;
--DML --DELETE
DELETE FROM calisanlar-- eger parent table baska  bir child tablo ile iliskili ise once child table silinmelidir.
DELETE FROM adresler;

--adresler tablosundan sehiri antep olan silelim
DELETE FROM ADRESLER WHERE SEHIR='ANTEP';

--TRUNCATE----
-- BIR TABLODAKI TUM VERILERI GERI ALMAYACAGIMIZ SEKILDE SILER.SARTI SILME YAPMAZ

--ON DELETE CASCADAE
DROP TABLE if exists notlar; -- eger tablo varsa siler
CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);
select * from talebeler;
select * from notlar;
--notlar tabosundan talebe_id si 123 olan datayi silelim
DELETE FROM notlar WHERE talebe_id='123';
-- talebeler tablosundan id si 126 olan datayi silelim
CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
	);
INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);
select * from talebe;
select * from not1
DELETE FROM talebe WHERE id='126'
/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/







