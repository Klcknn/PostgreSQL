## PostgreSQL Server :
## İçindekiler

- [PostgreSQL Server :](#postgresql-server-)
- [İçindekiler](#i̇çindekiler)
- [1. Notlarım:](#1-notlarım)
    - [PRIMARY KEY:](#primary-key)
    - [FOREIGN KEY (REFERENCES):](#foreign-key-references)
    - [Diğer Kısa Notlarım:](#diğer-kısa-notlarım)
    - [Database İşlemleri](#database-i̇şlemleri)
- [2. Notlarım:](#2-notlarım)
  - [Constraint](#constraint)
    - [UNIQUE](#unique)
    - [NOT NULL](#not-null)
    - [PRIMARY KEY](#primary-key-1)
    - [FOREIGN KEY](#foreign-key)
    - [CHECK](#check)
- [3. Notlarım:](#3-notlarım)
    - [WHERE](#where)
    - [DELETE](#delete)
    - [TRUNCATE](#truncate)
- [4. Notlarım:](#4-notlarım)
    - [SUBQUERIES](#subqueries)
    - [EXISTS and NOT EXISTS](#exists-and-not-exists)
## 1. Notlarım:

#### PRIMARY KEY: 
* Primary key tek bir kolon olabileceği gibi birden fazla kolonun birleşimi de olabilir.	
* Ayrıca birden fazla field PK olarak belirlenebilir.   --> CONSTRAINT prmry_key_all PRIMARY KEY(id, name)
* Primary Key değeri boş geçilemez ve NULL değer alamaz.
* Relational veri tabanlarında (relational database management system) mutlaka birincil anahtar olmalıdır.
* Bir Tabloda en fazla 1 tane primary Key olabilir.
* Primary Key benzersiz (Unique) olmalidir ama her unique data Primary Key değildir
* Primary key her turlu datayi icerebilir. Sayi, String.
* Her tabloda Primary Key olmasi zorunlu değildir.

#### FOREIGN KEY (REFERENCES):
* Foreign Key (yabancı anahtar) ikincil anahtar olarak da ifade edilmektedir. Bir veri tablosuna girilebilecek değerleri başka bir veri tablosundaki alanlarla ilişkilendirmeye yarar. Özetle, başka bir tablonun birincil anahtarının bir diğer tablo içerisinde yer almasıdır.
 
* Çoğunlukla bir ana tablo (parent) ile alt tablonun (child) ilişkilendirilmesinde kullanılır.Bu sayede olası veri tekrarlarının önüne geçilebilmekte ve ilerleyen zamanda söz konusu olabilecek güncellemelerde ilgili verilerin her yerde güncellenmesi sağlanabilmektedir. 
* Bir Tabloda birden fazla Foreign Key olabilir Foreign Key NULL degeri kabul eder. Foreign Key olarak tanimlanan field’ da tekrarlar olabilir.
* Kısacası; Foreign Key, değerleri farklı bir tablodaki Primary Key ile eşleşen bir sütun veya sütunların birleşimidir.
#### Diğer Kısa Notlarım:
* **SERIAL:** Otomatik sıralı bir şekilde veri giriş yapar. 
* **UNIQUE:** Tabloda aynı sütun içinde verinin eşsiz olmasını sağlar.
* **NOT NULL:** Tablodaki verinin değer atamasını zorunlu kılar.Yani ilgili alan veya sütun boş bırakılamaz.
* **REAL:** Ondalık sayı girişinde kullanılır.


* 1. Data Ouery Language (DQL)- Veri Sorgulama Dili : 

	    SELECT: Database içindeki verileri alıp uygun sorgularla bize gösterir veya getirir.

* 2. Data Manipulation Language (DML)- Veri Değiştirme Dili : 

        INSERT: Database içine veri ekleme işlemi yapar.

        UPDATE: Databasedeki verileri günceller.

        DELETE: Databasedeki verileri siler.
        
* 3. Data Definition Language (DDL)- Veri Sorgulama Dili : 
        
        CREATE: Bir database(veritabanı) veya tabloyu(table) oluşturmamızı sağlar.

        ALTER:  Bir database(veritabanı) veya tabloyu(table) güncellememizi sağlar.

        DROP:   Bir database(veritabanı) veya tabloyu(table) silmemizi sağlar.


* 4. Data Control Language (DCL)- Veri Sorgulama Dili : 
        
        GRANT:  Bir kullanıcıya yetki vermek için kullanılır.
        
        REVOKE: Bir kullanıcıya verilen yetkiyi geri almak için kullanılır.

#### Database İşlemleri

- 1. Database Oluşturma :
    ```bash
        CREATE DATABASE kenandb
    ```
- 2. Database Silme :
    ```bash
        DROP DATABASE kenandb
    ```
- 3. Tablo Oluşturma :
    ```bash
        CREATE Table arkadaslar(
            id INTEGER             
            isim CHAR(100),
            soyisim CHAR(100),
            adres NVARCHAR(500),
            dogum_tarihi DATE,
            hobi CHAR(100),
        );
    ```

- 4. Mevcut tablodan yeni bir tablo oluşturma işlemi :
    ```bash
        CREATE TABLE adresler as SELECT isim, adres FROM arkadaslar 
    ```

- 5. Tabloların içine Veri Ekleme İşlemi :
    ```bash
        INSERT INTO arkadaslar VALUES(1,"Ali","Tas","Kayseri","2000-04-23","Futbol");
        INSERT INTO arkadaslar VALUES(2,"Veli","Tas","Kayseri","2000-04-23","Futbol");
        INSERT INTO arkadaslar VALUES(3,"Mehmet","Tas","Kayseri","2000-04-23","Futbol");
        INSERT INTO arkadaslar VALUES(4,"Can","Tas","Kayseri","2000-04-23","Futbol");
    ```
    **Note:** Komutları çoklu execute yapmak için sonlarına **" ; "** eklememiz gerekiyor.
- 6. Tabloların Bazı Sütunlarının içine Veri Ekleme İşlemi :
    ```bash
        INSERT INTO arkadaslar(isim, soyisim) VALUES("Ali","Tas");
        INSERT INTO arkadaslar(id, dogum_tarihi, hobi) VALUES(2,"2000-04-23","Futbol");
    ```

- 7. Tabloların Tüm Kayıtlarını Getirme veya Gösterme İşlemi :
    ```bash
        SELECT * FROM arkadaslar;
        SELECT * FROM adresler;
    ```
- 8. Tabloların Bazı Kayıtlarını Getirme veya Gösterme İşlemi :
    ```bash
        SELECT isim, soyisim FROM arkadaslar;
        SELECT dogum_tarihi FROM arkadaslar;
        SELECT adres FROM adresler;
    ```

## 2. Notlarım:

### Constraint
#### UNIQUE
* **UNIQUE:** 
  * Bir sütundaki tüm değerlerin Benzersiz/Tekrarsız yani tek
    olmasını sağlar.
  * Bir sütunu **tekrarsız** yapmak için, sütunun Data Type’ dan sonra
    **UNIQUE** yazılır.
     ```bash
        CREATE Table arkadaslar2(
            id INTEGER             
            isim CHAR(100),
            soyisim CHAR(100),
            adres NVARCHAR(500),
            email CHAR(100) UNIQUE,
            dogum_tarihi DATE,
            hobi CHAR(100)
        );
    ```
#### NOT NULL
* **NOT NULL:** 
  * Bir sütunun NULL içermemesini sağlar. NOT NULL
    kısıtlaması için constraint ismi tanımlanmaz. Bu kısıtlama veri türünden
    hemen sonra yerleştirilir.
  * Bir sütunun **boş bırakmamak** için, sütunun Data Type’ dan sonra **NOT
    NULL** yazılır.
  * **Not:** Sütun değerinin "" (empty) ile NULL olması aynı şey değildir.
  *  ```bash
        CREATE Table arkadaslar2(
            id INTEGER             
            isim CHAR(100) NOT NULL,
            soyisim CHAR(100),
            adres NVARCHAR(500),
            email CHAR(100) UNIQUE,
            dogum_tarihi DATE,
            hobi CHAR(100)
        );
     ```
#### PRIMARY KEY
* **PRIMARY KEY:** 
  * Bir sütunun NULL içermemesini ve sütundaki verilerin
    BENZERSİZ olmasını sağlar. (NOT NULL e UNIQUE)
  * Bir veri tablosunuda yer alan her satır için bir vekil(tanımlayıcı) görevi
    görür. **NOT NULL** ve **UNIQUE** olur. Sütunun Data Type’ dan sonra
    **PRIMARY KEY** yazılır.
     ```bash
        CREATE Table arkadaslar2(
            id INTEGER PRIMARY KEY,             
            isim CHAR(100) NOT NULL,
            soyisim CHAR(100),
            adres NVARCHAR(500),
            email CHAR(100) UNIQUE,
            dogum_tarihi DATE,
            hobi CHAR(100)
        );
    ```
#### FOREIGN KEY
* **FOREIGN KEY:** 
  * Başka bir tablodaki **Primary Key**’ i referans göstermek için
    kullanılır. Böylelikle, tablolar arasında ilişki kurulmuş olur.

  * Bir veri tablosunuda yer alan her satır için bir vekil(tanımlayıcı) görevi görür.
    **NOT NULL** ve **UNIQUE** olur. 

  * **Not1:** **«Parent Table»**’ da olmayan bir id’ ye sahip datayı **«Child Table»**’ a
    ekleyemeyiz.

  * **Not2:** **«Child Table»** silmeden **«Parent Table»** silemeyiz. Önce **«Child Table»**
    silinir, daha sonrada **«Parent Table»** silinir.

#### CHECK
* **CHECK:** 
  * Bir sütuna yerleştirilebilecek değer aralığını sınırlamak için
    kullanılır.
  * Bir sütunun değerlerini kontrol etmek için, sütunun Data Type’ dan sonra    
    *CHECK* yazılır.
    ```bash
        CREATE Table arkadaslar3(
            id INTEGER PRIMARY KEY,             
            isim CHAR(100) NOT NULL,
            soyisim CHAR(100),
            yas INT CHECK (yas>18),
            adres NVARCHAR(500),
            email CHAR(100) UNIQUE,
            dogum_tarihi DATE,
            hobi CHAR(100)
        );
    ```

## 3. Notlarım:
#### WHERE
* **WHERE:** 
  * Bir tabloda sorgulamak istenilen verileri filtrelemek için kullanılır.Kısacası koşul vermek yada belirtmek **WHERE** komutu kullanılır.
  * - ( = ) : Eşittir ifadesi
  * - ( > ) : Büyüktür ifadesi
  * - ( >= ): Büyük yada eşittir ifadesi
  * - ( < ) : Küçüktür ifadesi
  * - ( <= ): Küçük yada eşittir ifadesi
  * - ( <> ): Eşit değildir ifadesi
  * - ( AND ) ( && ) : Tüm koşulların doğru olması sonucunda True değer döndürülür. 
  * - ( OR ) ( || )  : Bir koşulun doğru olması sonucunda ise True değer döndürülür. 
  * - ( ! )          : Koşul sonucuna göre tersi işlem yapar. ( True<=>False ). 
  
  * 
   
    ```bash
        CREATE Table employees(
            id INT PRIMARY KEY,             
            name VARCHAR(100) NOT NULL,
            department VARCHAR(50),
            age INT CHECK (yas>18),
            salary DECIMAL(10,2),
            date DATE
        );
        INSERT INTO employees (id, name, department, age, salary, hire_date) 
        VALUES
        (1, 'John Doe', 'HR', 30, 5000.00, '2020-05-15'),
        (2, 'Jane Smith', 'Finance', 28, 5500.00, '2019-10-10'),
        (3, 'Michael Johnson', 'Sales', 35, 6000.00, '2018-08-22'),
        (4, 'Emily Adams', 'Marketing', 25, 4800.00, '2021-01-05'),
        (5, 'Robert Brown', 'IT', 32, 6200.00, '2017-03-12'),
        (6, 'Sarah Lee', 'HR', 29, 5300.00, '2019-06-30'),
        (7, 'William Wilson', 'Finance', 26, 5800.00, '2020-09-18'),
        (8, 'Linda Davis', 'Sales', 40, 6500.00, '2015-12-03'),
        (9, 'James Miller', 'IT', 27, 6000.00, '2018-11-25'),
        (10, 'Jennifer Taylor', 'Marketing', 31, 5100.00, '2016-07-20');
        
        -- employees tablosundaki tüm verileri bana getir 
        SELECT * FROM employees;

        -- employees tablosunda yaşı 30 dan büyük olan kayıtların name, age ve salary verisini bana getir veya göster
        SELECT name, age, salary FROM employees WHERE age > 30;
        
        -- employees tablosunda departmenti Finance olmayan kayıtların tüm verilerini bana getir veya göster.
        SELECT * FROM employees WHERE NOT department='Finance';
        
        -- employees tablosunda departmenti Finance ve Sales olan kayıtların name ve salary verilerini bana getir veya göster.
        SELECT name, salary FROM employees WHERE department IN('Finance', 'Sales');
        
        -- employees tablosunda name 'William Wilson' olan kayıtların name=isim, age=yaş ve salary=ücret olacak şekilde verileri bana getir veya göster.
        SELECT name AS isim, age AS yaş, salary AS ücret FROM employees WHERE name = 'William Wilson';
        
        -- employees tablosunda tüm kayıtların salary ortalamasını bana getir veya göster.
        SELECT AVG(salary) FROM employees;

        -- employees tablosunda tüm kayıtların MAX salary verisini bana getir veya göster.
        SELECT MAX(salary) FROM employees;

        -- employees tablosunda tüm kayıtların MIN salary verisini bana getir veya göster.
        SELECT MIN(salary) FROM employees;

        -- employees tablosunda tüm kayıtların salarylerinin toplamını bana Toplam sütunu adı altında getir veya göster.
        SELECT SUM(salary) AS Toplam FROM employees;

        -- employees tablosunda tüm kayıtların salary ortalamasını iki haneliye yuvarlayacak şekilde bana getir veya göster.
        SELECT ROUND(AVG(salary), 2) FROM employees;

        -- concatination operator Sütunları birleştrime işlemi
        SELECT name || ' ' || age AS new_column, salary FROM employees;
        
        SELECT * FROM employees WHERE department IN ('Marketing', 'IT', 'Finance') ORDER BY department ASC, name ASC;
        
        CREATE VIEW name_view AS SELECT name AS isim, age AS yaş, salary AS ücret FROM employees WHERE name = 'William Wilson';

        -- Daha kolay okunur hale getirmek(readable) için CREATE VIEW view_name AS yapısını kullanıyoruz.
        CREATE VIEW age_25_40_view SELECT * FROM employees WHERE age BETWEEN 25 AND 40 ; 
        
        -- Tablo içindeki sütunun ismini bu şekilde değiştirebiliriz. name --> isim
        ALTER TABLE employees RENAME COLUMN name TO isim;     
    
    ```
#### DELETE
* **DELETE:** 
  ```bash

      -- **Note:** Tablodaki tüm verileri siler, fakat tablonun kendisini silmez. 
      DELETE FROM employees;   

      -- isim olarak William Wilson girilen kaydı (record) siler.
      DELETE FROM employees WHERE name = 'William Wilson'; 
      
      -- yaşı 30 dan büyük olarak girilen kayıtları (record) siler.
      DELETE FROM employees WHERE age > 30 ; 

      -- yaşı 30 olan veya ismi Jane Smith olan kayıtları (record) siler.
      DELETE FROM employees WHERE age=30 OR name='Jane Smith'; 

      -- departmanı Marketing olan ve ismi de Jane Smith olan kayıtları (record) siler.
      DELETE FROM employees WHERE department='Marketing' AND name='Jane Smith'; 

      -- yaşları 25 ile 40(dahil) arasında olanların kayıtlarını (record) siler.
      DELETE FROM employees WHERE age BETWEEN 25 AND 40 ; 
  ```

#### TRUNCATE
* **TRUNCATE:** 
* **Truncate** kodu bir tablodaki kayitların kesinlikle geri getirilmeyecek şekilde kısacası tamamen silinmesi için kullanılır.Silinen verilerin geri getirilme ihtimali olmuyor.
* **Truncate** kodu geri getirilmesini(rolling back) istemediğimiz tabloları silmek icin kullanırız.
* 
  ```bash
      -- employees tablosunu silip, geri dönüşüme gönderir.
      DROP TABLE employees; 

      -- employees tablosunu geri getirir.
      FLASHBACK TABLE employees TO BEFORE DROP ; 

      -- employees tablosunu geri getirilmeyecek şekilde siler.
      DROP TABLE employees PURGE ; 

  ```
 * **Note that:**  *DELETE FROM* ile sildigimiz kayitlar geri getirebilir ama *TRUNCATE* ile silinen veriler geri getirilemez!!!.
 

## 4. Notlarım:
#### SUBQUERIES
* **SUBQUERIES:** 
* Başka bir SQL sorgusunun içinde bulunan ve onun sonucundan yararlanarak çalışan bir sorgudur.Böylelikle veritabanında daha karmaşık ve derin bir sorgulama yapmamıza olanak sağlar.

  ```bash
      -- Personel sayısı 1000 den fazla olan şirketlerin isimlerini ve bu şirkette çalışan personelin isimlerini getirelim. 
      SELECT sirket_name, personel_name FROM personel WHERE sirket IN (SELECT sirket_name FROM sirketler WHERE personel_sayisi > 1000)

      -- Şirket ID si 10 ile 35 arasında olan şirketlerin isimlerini ve bu şirkette çalışan personelin şirket isimlerini, maaşlarını ve şehir bilgilerini getirelim. 
      SELECT sirket_name, personel_maas, sehir FROM personel WHERE sirket IN (SELECT sirket_name FROM sirketler WHERE id BETWEEN 10  AND 35)

      -- Şirketler tablosunda min ve max maaş değerleri arasında olan şirketlerin isimlerini ve bu şirkette çalışan personelin tüm bilgilerini getirelim. 
      SELECT * FROM personel WHERE sirket BETWEEN (SELECT MIN(maas) FROM sirketler) AND (SELECT MAXN(maas) FROM sirketler)
  ``` 
* SELECT CLAUSE yapısı **SELECT** 'den sonra kullanılır.Burda kullanılan subquery yapısı sadece bir değer döndürmek zorundadır.
* Bu yapıda tek bir değer döndüğü için **AGGREGATE FUNCTION( SUM, COUNT, MIN, MAX, AVG )** fonksiyonları kullanılır.   

 ```bash
     -- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu sehir_sayısı olarak listeleyelim.
      SELECT marka_id,marka_isim, (SELECT COUNT(DISTINCT sehir) FROM calisanlar WHERE isyeri=marka_isim) AS sehir_sayisi
      FROM markalar;

     -- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum maaşini listeleyelim.
      SELECT marka_isim, calisan_sayisi, (SELECT MAX(maas) FROM calisanlar WHERE isyeri=marka_isim) AS max_maas FROM markalar;

      -- Her markanin ismini ve o markaya ait calisanlarin toplam maaşini listeleyelim.
      SELECT marka_isim, (SELECT SUM(maas) FROM calisanlar WHERE isyeri=marka_isim) AS max_maas FROM markalar;

  ```
#### EXISTS and NOT EXISTS
* **EXISTS and NOT EXISTS:** 
* *EXISTS* ve *NOT EXISTS* ifadeler subqueryler ile beraber kullanılır ve bu ifadeler alt sorgudan gelen değerlerin içerisinde bir değerin olup olmamasına göre işlem yapmamızı sağlar.
* Kullanım olarak *IN* yapısına bezer.
 ```bash
    -- Eğer Students tablosundaki Department_ID alanındaki değer, Department tablosundaki Department_ID alanındaki değer var ise ilgili öğrencinin adını getirecek sorguyu yazalım.
    SELECT name FROM Students AS s WHERE EXISTS (SELECT * FROM Department AS d WHERE s.Department_ID=d.Department_ID)

    -- Eğer Students tablosundaki Department_ID alanındaki değer, Department tablosundaki Department_ID alanındaki değer yok ise ilgili öğrencinin adını getirecek sorguyu yazalım.
    SELECT name FROM Students AS s WHERE NOT EXISTS (SELECT * FROM Department AS d WHERE s.Department_ID=d.Department_ID)
  ```



