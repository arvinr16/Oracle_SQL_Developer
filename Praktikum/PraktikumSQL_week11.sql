SELECT * FROM all_users;

SELECT table_name FROM user_tables;

SELECT * FROM produk;

SELECT * FROM mahasiswa;

DROP TABLE produk;

-- 2. BUAT TABEL PRODUK (Untuk latihan SUM, AVG, COUNT)
CREATE TABLE Produk (
    ID_Produk   VARCHAR2(10) PRIMARY KEY,
    Nama_Produk VARCHAR2(100) NOT NULL,
    Kategori    VARCHAR2(50),
    Harga       NUMBER(10),
    Stok        NUMBER(4)
);

-- 3. ISI DATA PRODUK (Variatif & Ada jebakan NULL)
INSERT ALL
    INTO Produk VALUES ('P001', 'Laptop Gaming Nitro 5', 'Laptop', 15000000, 20)
    INTO Produk VALUES ('P002', 'Mouse Gaming Viper Mini', 'Aksesoris', 850000, 50)
    INTO Produk VALUES ('P003', 'Monitor LED 24 inch', 'Monitor', 2500000, 35)
    INTO Produk VALUES ('P004', 'Keyboard Mechanical RGB', 'Aksesoris', 1200000, 40)
    INTO Produk VALUES ('P005', 'Laptop Office MateBook', 'Laptop', 9500000, 25)
    -- PERHATIKAN: P006 harganya NULL (untuk demo fungsi NVL)
    INTO Produk VALUES ('P006', 'Cooling Fan Laptop', 'Aksesoris', NULL, 30) 
    INTO Produk VALUES ('P007', 'Mouse Wireless Logi', 'Aksesoris', 150000, 100)
    INTO Produk VALUES ('P008', 'Laptop Gaming Asus', 'Laptop', 18000000, 5)
SELECT 1 FROM DUAL;

-- 4. BUAT TABEL MAHASISWA (Untuk latihan MIN, MAX)
CREATE TABLE Mahasiswa (
    NIM             VARCHAR2(10) PRIMARY KEY,
    Nama_Lengkap    VARCHAR2(50) NOT NULL,
    Jurusan         VARCHAR2(50),
    Tgl_Daftar      DATE,
    IPK             NUMBER(3,2)
);

-- 5. ISI DATA MAHASISWA
INSERT ALL
    INTO Mahasiswa VALUES ('250111', 'Budi Santoso', 'Teknik Informatika', TO_DATE('01-08-2020', 'DD-MM-YYYY'), 3.85)
    INTO Mahasiswa VALUES ('250112', 'Ani Lestari', 'Sistem Informasi', TO_DATE('15-08-2021', 'DD-MM-YYYY'), 3.20)
    INTO Mahasiswa VALUES ('250113', 'Citra Wijaya', 'Teknik Informatika', TO_DATE('20-08-2022', 'DD-MM-YYYY'), 2.50)
    INTO Mahasiswa VALUES ('250114', 'Doni Hartono', 'Desain Komunikasi Visual', TO_DATE('05-09-2023', 'DD-MM-YYYY'), 1.50)
    INTO Mahasiswa VALUES ('250115', 'Eka Putra', 'Sistem Informasi', TO_DATE('01-09-2023', 'DD-MM-YYYY'), 3.90)
SELECT 1 FROM DUAL;

-- VERIFIKASI
SELECT * FROM Produk;     -- Harus ada 8 Baris
SELECT * FROM Mahasiswa;  -- Harus ada 5 Baris