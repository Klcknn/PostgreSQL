## PostgreSQL Server :
### Notlarım-1 :

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

### Notlarım-2 :

#### Constraint
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

* **FOREIGN KEY:** 
  * Başka bir tablodaki **Primary Key**’ i referans göstermek için
    kullanılır. Böylelikle, tablolar arasında ilişki kurulmuş olur.

  * Bir veri tablosunuda yer alan her satır için bir vekil(tanımlayıcı) görevi görür.
    **NOT NULL** ve **UNIQUE** olur. 

  * **Not1:** **«Parent Table»**’ da olmayan bir id’ ye sahip datayı **«Child Table»**’ a
    ekleyemeyiz.

  * **Not2:** **«Child Table»** silmeden **«Parent Table»** silemeyiz. Önce **«Child Table»**
    silinir, daha sonrada **«Parent Table»** silinir.

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

### Notlarım-3 :

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

        SELECT * FROM employees;
        SELECT name, age, salary FROM employees WHERE age > 30;
        SELECT name AS isim, age AS yaş, salary AS ücret FROM employees WHERE name = 'William Wilson';
        SELECT * FROM employees WHERE department IN ('Marketing', 'IT', 'Finance') ORDER BY department ASC, name ASC;
        CREATE VIEW name_view AS SELECT name AS isim, age AS yaş, salary AS ücret FROM employees WHERE name = 'William Wilson'; 
        CREATE VIEW age_25_40_view SELECT * FROM employees WHERE age BETWEEN 25 AND 40 ; -- Daha kolay okunur hale getirmek(readable) için CREATE VIEW view_name AS yapısını kullanıyoruz.
        ALTER TABLE employees RENAME COLUMN name TO isim;    -- Tablo içindeki sütunun ismini bu şekilde değiştirebiliriz. name --> isim 
    
    ```

* **DELETE:** 
  ```bash
      DELETE FROM employees;   --  **Note:** Tablodaki tüm verileri siler, fakat tablonun kendisini silmez. 
      DELETE FROM employees WHERE name = 'William Wilson'; -- isim olarak William Wilson girilen kaydı (record) siler.
      DELETE FROM employees WHERE age > 30 ; -- yaşı 30 dan büyük olarak girilen kayıtları (record) siler.
      DELETE FROM employees WHERE age=30 OR name='Jane Smith'; -- yaşı 30 olan veya ismi Jane Smith olan kayıtları (record) siler.
      DELETE FROM employees WHERE department='Marketing' AND name='Jane Smith'; -- departmanı Marketing olan ve ismi de Jane Smith olan kayıtları (record) siler.
      DELETE FROM employees WHERE age BETWEEN 25 AND 40 ; -- yaşları 25 ile 40(dahil) arasında olanların kayıtlarını (record) siler.
  ```
 
* **TRUNCATE:** 
* **Truncate** kodu bir tablodaki kayitların kesinlikle geri getirilmeyecek şekilde kısacası tamamen silinmesi için kullanılır.Silinen verilerin geri getirilme ihtimali olmuyor.
* **Truncate** kodu geri getirilmesini(rolling back) istemediğimiz tabloları silmek icin kullanırız.
* 
  ```bash
      DELETE FROM employees;   --  **Note:** Tablodaki tüm verileri siler, fakat tablonun kendisini silmez. 
      DELETE FROM employees WHERE name = 'William Wilson'; -- isim olarak William Wilson girilen kaydı (record) siler.
      DELETE FROM employees WHERE age > 30 ; -- yaşı 30 dan büyük olarak girilen kayıtları (record) siler.
      DELETE FROM employees WHERE age=30 OR name='Jane Smith'; -- yaşı 30 olan veya ismi Jane Smith olan kayıtları (record) siler.
      DELETE FROM employees WHERE department='Marketing' AND name='Jane Smith'; -- departmanı Marketing olan ve ismi de Jane Smith olan kayıtları (record) siler.
      DELETE FROM employees WHERE age BETWEEN 25 AND 40 ; -- yaşları 25 ile 40(dahil) arasında olanların kayıtlarını (record) siler.
      DROP TABLE employees; -- employees tablosunu silip, geri dönüşüme gönderir.
      DROP TABLE employees PURGE ; -- employees tablosunu geri getirilmeyecek şekilde siler.
      FLASHBACK TABLE employees TO BEFORE DROP ; -- employees tablosunu geri getirir.
  ```
 * **Note that:**  *DELETE FROM* ile sildigimiz kayitlar geri getirebilir ama *TRUNCATE* ile silinen veriler geri getirilemez!!!.
 

 ### Notlarım-4 :

 * **SUBQUERIES:** 
  * Bir tabloda sorgulamak istenilen verileri filtrelemek için kullanılır.Kısacası koşul vermek yada belirtmek **WHERE** komutu kullanılır.