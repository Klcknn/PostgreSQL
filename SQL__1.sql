--- PostgreSQL ---

-- 1. Database Oluşturma ( create database )
CREATE DATABASE kenanklc;  -- SQL komutlarında case sensitive yoktur ancak değer atamalarında vardır.

-- 2. Tablo Silme ( drop database )
DROP DATABASE kenanklc -- (Silme işleminin yapılması için Database'den Disconnect yapılması ve sorgu ekranının kapatılması gerekiyor.)

-- 3. Tablo Oluşturma ( create table )
CREATE TABLE table_name

/*
  PRIMARY KEY:
	Tabloda her satır veriden sorumlu bir tane anahtar veri vardır. Bu her satır için aynı veridir. Dolayısıyla primary Key bilgisi kolona verilir. 
	Primary key olarak işaretlenen veri tekil olmak zorundadır. Bir tabloda sadece bir kez bulunabilir.Aksi durumda veri tabanı hata fırlatır. 
	Primary key tek bir kolon olabileceği gibi birden fazla kolonun birleşimi de olabilir.	
	Ayrıca birden fazla field PK olarak belirlenebilir.  --> CONSTRAINT prmry_key_all PRIMARY KEY(id, name)
*/

/*
  FOREIGN KEY(REFERENCES):
	Foreign Key (yabancı anahtar) ikincil anahtar olarak da ifade edilmektedir. Bir veri tablosuna girilebilecek değerleri başka bir 
	veri tablosundaki alanlarla ilişkilendirmeye yarar. Özetle, başka bir tablonun birincil anahtarının bir diğer tablo içerisinde yer almasıdır. 
	Çoğunlukla bir ana tablo (parent) ile alt tablonun (child) ilişkilendirilmesinde kullanılır.Bu sayede olası veri tekrarlarının önüne
	geçilebilmekte ve ilerleyen zamanda söz konusu olabilecek güncellemelerde ilgili verilerin her yerde güncellenmesi sağlanabilmektedir. 
*/

-- SERIAL: Otomatik sıralı bir şekilde veri giriş yapar. 
-- UNIQUE: Tabloda aynı sütun içinde verinin eşsiz olmasını sağlar.
-- NOT NULL: Tablodaki verinin değer atamasını zorunlu kılar.Yani ilgili alan veya sütun boş bırakılamaz.
-- REAL: Ondalık sayı girişinde kullanılır.

CREATE TABLE accounts(
	user_id SERIAL PRIMARY KEY,    
	username VARCHAR(25) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

-- INSERT INTO (insert into values to accounts table) -- 
INSERT INTO accounts VALUES(1,'knn','123456','kenanklc@gmail.com','2017-07-23','2023-07-23')
INSERT INTO accounts(username,password,email,created_on) VALUES('klc1','232','sdsd@gmail.com','2013-07-21')
INSERT INTO accounts(username) VALUES('klc1')  -- !!!Hata verir NOT NULL olanlar boş bırakılamaz.(password,email,created_on)

-- Select --
SELECT * FROM accounts  -- * Tüm columns'ları bize getirir.
SELECT username FROM accounts
SELECT username,last_login FROM accounts

-- Mevcut databasemiz içerisinde var olan bir tablo üzerinden gerekli işlemler yapılarak yeni bir tablonun oluşturulması
CREATE TABLE filtered_table_by_user as SELECT user_id,username FROM accounts 
SELECT * FROM filtered_table_by_user

CREATE TABLE jobs(
	job_id SERIAL PRIMARY KEY,  
	job_name VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL
)

INSERT INTO jobs VALUES(1,'engineer','2023-07-23')
INSERT INTO jobs VALUES(2,'teacher','2023-08-23')
INSERT INTO jobs (job_name,created_on) VALUES('musician','2023-08-23')
INSERT INTO jobs (job_name,created_on) VALUES('math','2023-08-23')
SELECT * FROM jobs

-- FOREIGN KEY 'leri bir başka tablo altında toplamak
CREATE TABLE accounts_jobs(
	user_id INTEGER REFERENCES accounts(user_id),
	job_id  INTEGER REFERENCES jobs(job_id),
	date TIMESTAMP
)

SELECT * FROM accounts_jobs

