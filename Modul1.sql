CREATE DATABASE UNPAS;

USE UNPAS;

--table mahasiswa

CREATE TABLE Mahasiswaa(
    nama VARCHAR (100),
    npm CHAR (9),
    alamat VARCHAR (100)
);

--mengubah table
ALTER TABLE Mahasiswaa
 ADD kelas CHAR (2);

 --mengubah alamat
 ALTER TABLE Mahasiswa
 ALTER COLUMN alamat VARCHAR (50);

 --mengecek struktur table
 EXEC sp_help 'Mahasiswaa';

 --membuat tabel
 CREATE TABLE Dosenn (
   nama VARCHAR (100),
   nip CHAR (9),
   alamat VARCHAR (50),
   prodi VARCHAR (100)
);

--menghapus column
ALTER TABLE Dosenn
DROP COLUMN alamat;

EXEC sp_help 'Dosenn';

--membuat pada column
ALTER TABLE Mahasiswa
ADD CONSTRAINT UQ_npm_mahasiswa UNIQUE (npm);

--menambah column nilai di tabel mahasiswa 
ALTER TABLE Mahasiswa
ADD nilai INT;

--nambahin constraint default
ALTER TABLE Mahasiswa
ADD CONSTRAINT DF_nilai_mahasiswa DEFAULT 100 FOR nilai;

CREATE DATABASE Produk;

USE Produk;

CREATE TABLE Produk(
  ProdukID INT,
  SKU VARCHAR(15),
  NamaProduk VARCHAR(100),
  Harga DECIMAL(10, 2),
  Stok INT
);

    EXEC sp_help 'Produk';
