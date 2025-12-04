--menampilkan semua data pada tabel product
SELECT*
FROM Production.Product;

--menampilkan Name, ProductNumber, dan ListPrice
SELECT Name, ProductNumber,ListPrice
FROM Production.Product;

--menampilkan data menggunakan alias kolom
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product;

--menampilkan harga baru = ListPrice 1.1
SELECT Name, ListPrice, (ListPrice * 1.1) AS HargaBaru
FROM Production.Product;

--menampilkan data dengan menggabungkan string
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product;

--Filterisasi Data
--Menampilkan Product yang berwarna red
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'blue';

--menampilkan data yang ListPricenya lebih dari 1000
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000;

--Menampilkan produk yang berwarna black and harganya diatas 500
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'black' AND ListPrice > 500;

--menampilkan produk yang bernama red, blue, atau black
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('Red', 'Blue', 'Black')
ORDER BY Color ASC;

--Menampilkan data yang namanya mengandung kata 'Road'
SELECT Name, ProductNumber 
FROM Production.Product
WHERE Name LIKE '%Road%';

--Agregasi dan Pengelompokan
--Menghitung total baris
SELECT COUNT(*) AS TotalProduk
FROM Production.Product;

--menampilkan warna dan jumlahnhya
SELECT Color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

--menghitung jumlah orderqty dan rata" unit price dan table sales
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

--Gruping lebih dari satu kelompok
SELECT Color, Size, COUNT(*) AS Jumlah 
FROM Production.Product
GROUP BY Color, Size;

SELECT *
FROM Production.Product;

--filter agregasi memakai having
--menampilkan warna dan jumlahnya tetapi jumlahnya lebih dari 20
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) > 2;

--Menampilkan warna 
--yang listpricenya lebih dari 500 dan jumlahnya warnanya lebih dari 10
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
WHERE listPrice > 500
GROUP BY Color
HAVING COUNT(*) >1;

--menampilkan data yang jumlah penjualannya lebih dari 1000
SELECT ProductID, SUM(OrderQty) AS TotalQty
FROM Sales.SalesOrderDetail 
GROUP BY ProductID
HAVING SUM(OrderQty) > 10;

--Menampilkan data yang rata" qty nya kurang dari 2
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) < 2;

--menampilkan product yang harganya lebih dari 3000 memakai MAX
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) > 3000;

--advance select dan order by 
--menampilkan jobtitle dari tabel employe tapi tidak boleh ada duplikat
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT JobTitle
FROM HumanResources.Employee;

--menampilkan  produk yang termahal ke termurah
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--mengambil data 5 produk termahal
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--OFFSET FETCH
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 2 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 3 Color, SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice > 0 
GROUP BY Color 
ORDER BY TotalNilaiStok DESC;