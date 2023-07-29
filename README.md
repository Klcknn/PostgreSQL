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
  *  
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
