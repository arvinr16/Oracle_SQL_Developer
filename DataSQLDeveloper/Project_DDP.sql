-- Query untuk cek Table-table --
SELECT table_name fROM user_tables;

select * from user_tables;

-- Cek isi data pada Tabel --
SELECT * FROM Mobil;

SELECT * FROM Pelanggan;

SELECT * FROM Transaksi_Penjualan;

SELECT * FROM Detail_Penjualan;

SELECT * FROM Metode_Pembayaran;

SELECT * FROM Pegawai;

-- Cek Tipe Data pada Tabel --
DESC Mobil;

DESC Pelanggan;

DESC Transaksi_Penjualan;

DESC Detail_Penjualan;

DESC Metode_Pembayaran;

DESC Pegawai;

-- Query untuk menghapus Tabel --
DROP TABLE mobil;

-- Query untuk menambahkan Kolom pada Tabel --
ALTER TABLE Metode_Pembayaran ADD ID_Transaksi VARCHAR2(10);

-- Query untuk memodifikasi NOT NULL di Kolom Tabel FK --
ALTER TABLE Transaksi_Penjualan
MODIFY ID_PELANGGAN NOT NULL;


-- Query untuk membuat Tabel --
-- 1. Query untuk tabel Mobil --
CREATE TABLE Mobil (
    ID_Mobil VARCHAR2(10),
    Merek VARCHAR2(30) NOT NULL,
    Model VARCHAR2(30) NOT NULL,
    Tahun NUMBER(4) NOT NULL,
    Warna VARCHAR2(15) NOT NULL,
    Harga_Jual NUMBER(15,2) NOT NULL,
    Status_Mobil VARCHAR2(30)  NOT NULL
        CONSTRAINT Status_Mobil_CK -- Untuk penamaan Constraint Check
        CHECK (Status_Mobil in ('TERSEDIA', 'TERJUAL')),
    
    CONSTRAINT Mobil_PK PRIMARY KEY (ID_Mobil)
);

-- 2. Query untuk tabel Pelanggan --
CREATE TABLE Pelanggan (
    ID_Pelanggan VARCHAR2(10),
    Nama VARCHAR2(100) NOT NULL,
    Alamat VARCHAR2(200) NOT NULL,
    No_HP VARCHAR2(15) NOT NULL,
    Email VARCHAR2(50),
    
    CONSTRAINT Pelanggan_PK PRIMARY KEY (ID_Pelanggan)
);

-- 3. Query untuk tabel Transaksi_Penjualan --
CREATE TABLE Transaksi_Penjualan (
    ID_Transaksi VARCHAR2(10),
    Tanggal_Transaksi DATE NOT NULL,
    Status_Penjualan VARCHAR2(30)
        CONSTRAINT Status_Penjualan_CK
        CHECK (Status_Penjualan in ('SELESAI', 'DIBATALKAN')) NOT NULL,
    ID_Pelanggan VARCHAR2(10),
    ID_Pegawai VARCHAR2(10),
    
    CONSTRAINT Transaksi_Penjualan_PK PRIMARY KEY (ID_Transaksi)
);

-- 4. Query untuk tabel Detail_Penjualan --
CREATE TABLE Detail_Penjualan (
    ID_Detail_Penjualan VARCHAR2(10),
    Harga NUMBER(15,2) NOT NULL,
    Diskon NUMBER(5,2),
    Subtotal NUMBER(15,2) NOT NULL,
    ID_Mobil VARCHAR2(10),
    ID_Transaksi VARCHAR2(10),
    
    CONSTRAINT Detail_Penjualan_PK PRIMARY KEY (ID_Detail_Penjualan)
);

-- 5. Query untuk tabel Metode_Pembayaran --
CREATE TABLE Metode_Pembayaran (
    ID_Pembayaran VARCHAR2(10),
    Metode VARCHAR2(20) NOT NULL,
    Status_Bayar VARCHAR2(20)
        CONSTRAINT Status_Bayar_CK
        CHECK (Status_Bayar in ('LUNAS', 'BELUM LUNAS')) NOT NULL,
    ID_Transaksi VARCHAR2(10),
    
    CONSTRAINT Metode_Pembayaran_PK PRIMARY KEY (ID_Pembayaran)
);

-- 6. Query untuk tabel Pegawai --
CREATE TABLE Pegawai (
    ID_Pegawai VARCHAR2(10),
    Nama VARCHAR2(100) NOT NULL,
    Jabatan VARCHAR2(50) NOT NULL,
    No_HP VARCHAR2(15) NOT NULL,
    Email VARCHAR2(100),
    Username VARCHAR2(50) NOT NULL,
    Password VARCHAR2(150) NOT NULL,
    
    CONSTRAINT Pegawai_PK PRIMARY KEY (ID_Pegawai)
);
-- Query perubahan FK harus NOT NULL --
ALTER TABLE Transaksi_Penjualan MODIFY ID_Pelanggan NOT NULL;
ALTER TABLE Transaksi_Penjualan MODIFY ID_Pegawai NOT NULL;
ALTER TABLE Detail_Penjualan MODIFY ID_Mobil NOT NULL;
ALTER TABLE Detail_Penjualan MODIFY ID_Transaksi NOT NULL;
ALTER TABLE Metode_Pembayaran MODIFY ID_Transaksi NOT NULL;


-- Query membuat Constraint antar Tabel --
-- 1. Tabel Transaksi_Penjualan mempunyai FK ID_Pelanggan --
ALTER TABLE Transaksi_Penjualan ADD CONSTRAINT FK_Transaksi_Penjualan_Pelanggan
FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan(ID_Pelanggan);

-- 2. Tabel Transaksi_Penjualan mempunyai FK ID_Pegawai --
ALTER TABLE Transaksi_Penjualan ADD CONSTRAINT FK_Transaksi_Penjualan_Pegawai
FOREIGN KEY (ID_Pegawai) REFERENCES Pegawai(ID_Pegawai);

-- 3. Tabel Detail_Penjualan mempunyai FK ID_Mobil --
ALTER TABLE Detail_Penjualan ADD CONSTRAINT FK_Detail_Penjualan_Mobil
FOREIGN KEY (ID_Mobil) REFERENCES Mobil(ID_Mobil);

-- 4. Tabel Detail_Penjualan mempunyai FK ID_Transaksi --
ALTER TABLE Detail_Penjualan ADD CONSTRAINT FK_Detail_Penjualan_Transaksi_Penjualan
FOREIGN KEY (ID_Transaksi) REFERENCES Transaksi_Penjualan(ID_Transaksi);

-- 5. Tabel Metode_Pembayaran mempunyai FK ID_Transaksi --
ALTER TABLE Metode_Pembayaran ADD CONSTRAINT FK_Metode_Pembayaran_Transaksi_Penjualan
FOREIGN KEY (ID_Transaksi) REFERENCES Transaksi_Penjualan(ID_Transaksi);


-- Query untuk Insert Data pada Tabel --
-- 1. Query untuk Insert Data pada tabel Mobil --
INSERT ALL
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB001', 'Toyota', 'Avanza', 2020, 'Hitam', 185000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB002', 'Toyota', 'Fortuner', 2021, 'Putih', 520000000, 'TERJUAL')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB003', 'Honda', 'Civic', 2019, 'Merah', 340000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB004', 'Honda', 'BR-V', 2022, 'Abu-abu', 270000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB005', 'Suzuki', 'Ertiga', 2018, 'Hitam', 165000000, 'TERSEDIA')
    
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB006', 'Suzuki', 'XL7', 2021, 'Putih', 230000000, 'TERJUAL')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB007', 'Mitsubishi', 'Pajero Sport', 2020, 'Hitam', 480000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB008', 'Mitsubishi', 'Xpander', 2019, 'Silver', 215000000, 'TERJUAL')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB009', 'Nissan', 'Livina', 2018, 'Putih', 185000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB010', 'Nissan', 'Serena', 2020, 'Hitam', 350000000, 'TERSEDIA')

    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB011', 'Toyota', 'Yaris', 2017, 'Merah', 175000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB012', 'Toyota', 'Innova', 2021, 'Silver', 415000000, 'TERJUAL')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB013', 'Honda', 'CR-V', 2020, 'Putih', 480000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB014', 'Honda', 'Jazz', 2018, 'Kuning', 185000000, 'TERJUAL')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB015', 'Daihatsu', 'Xenia', 2019, 'Hitam', 160000000, 'TERSEDIA')
    
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB016', 'Daihatsu', 'Terios', 2020, 'Putih', 240000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB017', 'Mazda', 'CX-5', 2021, 'Merah', 490000000, 'TERJUAL')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB018', 'Mazda', '2 Hatchback', 2018, 'Silver', 170000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB019', 'Hyundai', 'Palisade', 2021, 'Hitam', 720000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB020', 'Hyundai', 'Stargazer', 2023, 'Putih', 235000000, 'TERSEDIA')

    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB021', 'Kia', 'Seltos', 2020, 'Merah', 295000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB022', 'Kia', 'Sonet', 2021, 'Silver', 205000000, 'TERJUAL')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB023', 'Wuling', 'Almaz', 2020, 'Putih', 285000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB024', 'Wuling', 'Confero', 2019, 'Hitam', 135000000, 'TERSEDIA')
    INTO Mobil (ID_Mobil, Merek, Model, Tahun, Warna, Harga_Jual, Status_Mobil) VALUES ('MB025', 'BMW', 'X1', 2018, 'Putih', 520000000, 'TERSEDIA')
SELECT 1 FROM DUAL;


-- 2. Query untuk Insert Data pada tabel Pelanggan --
INSERT ALL
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL001', 'Andi Pratama', 'Jl. Merdeka No. 21, Jakarta', '081212345678', 'andi.pratama@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL002', 'Siti Rahmawati', 'Jl. Kenanga No. 5, Bandung', '082134567821', 'siti.rahmawati@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL003', 'Budi Santoso', 'Jl. Sudirman No. 44, Surabaya', '081278912345', 'budi.santoso@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL004', 'Rina Maharani', 'Jl. Melati Indah No. 9, Yogyakarta', '085678123490', 'rina.maharani@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL005', 'Dedi Firmansyah', 'Jl. Ahmad Yani No. 2, Medan', '081298761234', 'dedi.firmansyah@example.com')

    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL006', 'Lina Kartika', 'Jl. Pahlawan No. 14, Semarang', '082167894321', 'lina.kartika@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL007', 'Agus Saputra', 'Jl. Anggrek No. 7, Bekasi', '081223456789', 'agus.saputra@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL008', 'Widya Lestari', 'Jl. Cempaka No. 10, Depok', '085612349876', 'widya.lestari@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL009', 'Rangga Putra', 'Jl. Gajah Mada No. 33, Tangerang', '081312345987', 'rangga.putra@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL010', 'Nina Salsabila', 'Jl. Mawar No. 20, Bogor', '082199876543', 'nina.salsabila@example.com')

    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL011', 'Hendra Wijaya', 'Jl. Diponegoro No. 55, Malang', '081383276541', 'hendra.wijaya@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL012', 'Tina Marlina', 'Jl. Kutilang No. 8, Padang', '082178965412', 'tina.marlina@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL013', 'Fajar Hakim', 'Jl. Sisingamangaraja No. 13, Palembang', '081298765122', 'fajar.hakim@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL014', 'Eka Rosdiana', 'Jl. Teratai No. 4, Solo', '085789612345', 'eka.rosdiana@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL015', 'Joko Prasetyo', 'Jl. Veteran No. 16, Pekanbaru', '081223459876', 'joko.prasetyo@example.com')

    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL016', 'Maya Nurjanah', 'Jl. Dipatiukur No. 12, Bandung', '082177889900', 'maya.nurjanah@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL017', 'Rio Saputro', 'Jl. Imam Bonjol No. 21, Denpasar', '081234998877', 'rio.saputro@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL018', 'Salsa Amelia', 'Jl. Kamboja No. 19, Makassar', '082112345900', 'salsa.amelia@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL019', 'Aldo Pranata', 'Jl. Yos Sudarso No. 39, Balikpapan', '081256789111', 'aldo.pranata@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL020', 'Nadya Putri', 'Jl. Rajawali No. 8, Samarinda', '082199887766', 'nadya.putri@example.com')

    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL021', 'Ferry Kurniawan', 'Jl. Pattimura No. 3, Manado', '081322334455', 'ferry.kurniawan@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL022', 'Sonia Aprillia', 'Jl. Flamboyan No. 27, Pontianak', '085622334411', 'sonia.aprillia@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL023', 'Galang Restu', 'Jl. Halmahera No. 6, Jambi', '081268899712', 'galang.restu@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL024', 'Lilis Wulandari', 'Jl. Kalimantan No. 88, Banjarmasin', '082136789990', 'lilis.wulandari@example.com')
    INTO Pelanggan (ID_Pelanggan, Nama, Alamat, No_HP, Email) VALUES ('PL025', 'Samuel Damanik', 'Jl. Sisingamangaraja No. 31, Medan', '081377665544', 'samuel.damanik@example.com')
SELECT 1 FROM DUAL;


-- 3. Query untuk Insert Data pada tabel Transaksi_Penjualan --
INSERT ALL
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP001', DATE '2025-01-05', 'SELESAI', 'PL001', 'PG001')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP002', DATE '2025-01-12', 'SELESAI', 'PL002', 'PG002')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP003', DATE '2025-01-20', 'DIBATALKAN', 'PL003', 'PG003')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP004', DATE '2025-02-01', 'SELESAI', 'PL004', 'PG004')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP005', DATE '2025-02-09', 'SELESAI', 'PL005', 'PG005')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP006', DATE '2025-02-18', 'SELESAI', 'PL006', 'PG001')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP007', DATE '2025-03-03', 'DIBATALKAN', 'PL007', 'PG002')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP008', DATE '2025-03-14', 'SELESAI', 'PL008', 'PG003')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP009', DATE '2025-03-22', 'SELESAI', 'PL009', 'PG004')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP010', DATE '2025-04-01', 'SELESAI', 'PL010', 'PG005')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP011', DATE '2025-04-10', 'SELESAI', 'PL011', 'PG001')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP012', DATE '2025-04-25', 'SELESAI', 'PL012', 'PG002')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP013', DATE '2025-05-03', 'DIBATALKAN', 'PL013', 'PG003')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP014', DATE '2025-05-14', 'SELESAI', 'PL014', 'PG004')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP015', DATE '2025-05-29', 'SELESAI', 'PL015', 'PG005')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP016', DATE '2025-06-02', 'SELESAI', 'PL016', 'PG001')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP017', DATE '2025-06-18', 'SELESAI', 'PL017', 'PG002')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP018', DATE '2025-06-27', 'DIBATALKAN', 'PL018', 'PG003')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP019', DATE '2025-07-05', 'SELESAI', 'PL019', 'PG004')
INTO Transaksi_Penjualan (ID_Transaksi, Tanggal_Transaksi, Status_Penjualan, ID_Pelanggan, ID_Pegawai) VALUES ('TP020', DATE '2025-07-18', 'SELESAI', 'PL020', 'PG005')
SELECT 1 FROM dual;


-- 4. Query untuk Insert Data pada tabel Detail_Penjualan --
INSERT ALL
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP001', 250000000, 0,        250000000, 'MB001', 'TP001')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP002', 320000000, 1.56,     315008000, 'MB002', 'TP002')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP003', 180000000, 0,        180000000, 'MB003', 'TP003')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP004', 450000000, 2.22,     440010000, 'MB004', 'TP004')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP005', 520000000, 2.88,     505024000, 'MB005', 'TP005')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP006', 275000000, 0,        275000000, 'MB006', 'TP006')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP007', 310000000, 0.97,     307000000,      'MB007', 'TP007')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP008', 210000000, 0,        210000000, 'MB008', 'TP008')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP009', 385000000, 1.82,     378000000,      'MB009', 'TP009')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP010', 600000000, 3.33,     580000000,      'MB010', 'TP010')

INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP011', 230000000, 0,        230000000, 'MB011', 'TP011')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP012', 260000000, 0.96,     257504000, 'MB012', 'TP012')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP013', 195000000, 0,        195000000, 'MB013', 'TP013')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP014', 340000000, 1.47,     335002000, 'MB014', 'TP014')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP015', 410000000, 1.95,     402000000,      'MB015', 'TP015')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP016', 285000000, 0,        285000000, 'MB016', 'TP016')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP017', 330000000, 1.21,     326000000,      'MB017', 'TP017')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP018', 205000000, 0,        205000000, 'MB018', 'TP018')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP019', 370000000, 1.62,     364000000,      'MB019', 'TP019')
INTO Detail_Penjualan (ID_Detail_Penjualan, Harga, Diskon, Subtotal, ID_Mobil, ID_Transaksi) VALUES ('DP020', 495000000, 2.42,     483000000,      'MB020', 'TP020')
SELECT 1 FROM dual;


-- 5. Query untuk Insert Data pada tabel Metode_Pembayaran --
INSERT ALL
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP001', 'CASH',           'LUNAS',        'TP001')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP002', 'TRANSFER BANK',  'LUNAS',        'TP002')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP003', 'CASH',           'LUNAS',        'TP003')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP004', 'TRANSFER BANK',  'LUNAS',        'TP004')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP005', 'DEBIT',          'LUNAS',        'TP005')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP006', 'CASH',           'BELUM LUNAS',  'TP006')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP007', 'KREDIT',         'BELUM LUNAS',  'TP007')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP008', 'TRANSFER BANK',  'LUNAS',        'TP008')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP009', 'CASH',           'LUNAS',        'TP009')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP010', 'KREDIT',         'BELUM LUNAS',  'TP010')

    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP011', 'DEBIT',          'LUNAS',        'TP011')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP012', 'TRANSFER BANK',  'LUNAS',        'TP012')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP013', 'CASH',           'LUNAS',        'TP013')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP014', 'KREDIT',         'BELUM LUNAS',  'TP014')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP015', 'TRANSFER BANK',  'LUNAS',        'TP015')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP016', 'CASH',           'BELUM LUNAS',  'TP016')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP017', 'DEBIT',          'LUNAS',        'TP017')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP018', 'KREDIT',         'BELUM LUNAS',  'TP018')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP019', 'TRANSFER BANK',  'LUNAS',        'TP019')
    INTO Metode_Pembayaran (ID_Pembayaran, Metode, Status_Bayar, ID_Transaksi) VALUES ('MP020', 'CASH',           'LUNAS',        'TP020')
SELECT 1 FROM dual;


-- 6. Query untuk Insert Data pada tabel Pegawai --
INSERT ALL
INTO Pegawai (ID_Pegawai, Nama, Jabatan, No_HP, Email, Username, Password) VALUES ('PG001','Paijo','Admin','081234560001','paijo@elegancemotors.com','paijo','password123')
INTO Pegawai (ID_Pegawai, Nama, Jabatan, No_HP, Email, Username, Password) VALUES ('PG002','Dalijo','Sales','081234560002','dalijo@elegancemotors.com','dalijo','password123')
INTO Pegawai (ID_Pegawai, Nama, Jabatan, No_HP, Email, Username, Password) VALUES ('PG003','Bagong','Sales','081234560003','bagong@elegancemotors.com','bagong','password123')
INTO Pegawai (ID_Pegawai, Nama, Jabatan, No_HP, Email, Username, Password) VALUES ('PG004','Gareng','Sales','081234560004','gareng@elegancemotors.com','gareng','password123')
INTO Pegawai (ID_Pegawai, Nama, Jabatan, No_HP, Email, Username, Password) VALUES ('PG005','Petruk','Finance','081234560005','petruk@elegancemotors.com','petruk','password123')
SELECT 1 FROM dual;

-- Query untuk mengubbah data/ mengupdate data --
UPDATE Mobil SET Tahun = 2023 WHERE ID_Mobil = 'MB001';
select * from mobil;



-- Query JOIN --
-- 1. Query JOIN Mobil dengan Detail_Penjualan
SELECT 
    M.ID_Mobil,
    M.Merek,
    M.Model,
    M.Tahun,
    D.Subtotal
FROM Mobil M
JOIN Detail_Penjualan D
    ON M.ID_Mobil = D.ID_Mobil;

-- 2. Query JOIN Transaksi_Penjualan dengan Pelanggan --
SELECT 
    T.ID_Transaksi,
    T.Tanggal_Transaksi,
    P.Nama AS Nama_Pelanggan,
    P.No_HP
FROM Transaksi_Penjualan T
JOIN Pelanggan P
    ON T.ID_Pelanggan = P.ID_Pelanggan;

-- 3. Query JOIN 3 tabel: Transaksi_Penjualan → Detail_Penjualan → Mobil --
SELECT 
    T.ID_Transaksi,
    T.Tanggal_Transaksi,
    M.Merek,
    M.Model,
    D.Subtotal
FROM Transaksi_Penjualan T
JOIN Detail_Penjualan D
    ON T.ID_Transaksi = D.ID_Transaksi
JOIN Mobil M
    ON D.ID_Mobil = M.ID_Mobil;

-- 4. Query JOIN Transaksi_Penjualan dengan Metode_Pembayaran
SELECT 
    T.ID_Transaksi,
    T.Tanggal_Transaksi,
    M.Metode,
    M.Status_Bayar
FROM Transaksi_Penjualan T
JOIN Metode_Pembayaran M
    ON T.ID_Transaksi = M.ID_Transaksi;

-- 5. Query JOIN Transaksi_Penjualan dengan Pegawai
SELECT 
    T.ID_Transaksi,
    P.Nama AS Nama_Pegawai,
    P.Jabatan
FROM Transaksi_Penjualan T
JOIN Pegawai P
    ON T.ID_Pegawai = P.ID_Pegawai;



-- Query Group Function --
-- 1. Query untuk hitung total Mobil yang tersedia (COUNT) --
SELECT 
    COUNT(*) AS Total_Mobil_Tersedia
FROM Mobil
WHERE Status_Mobil = 'TERSEDIA';

-- 2. Query untuk hitung total pendapatan dari seluruh penjualan (SUM) --
SELECT 
    SUM(Subtotal) AS Total_Pendapatan
FROM Detail_Penjualan;

-- 3. Query untuk hitung rata-rata harga Mobil yang dijual (AVG) --
SELECT 
    AVG(Harga_Jual) AS Rata_Rata_Harga
FROM Mobil;

-- 4. Query untuk hitung total penjualan berdasarkan merek (COUNT & SUM) --
SELECT 
    M.Merek,
    COUNT(*) AS Jumlah_Terjual,
    SUM(D.Subtotal) AS Total_Pendapatan
FROM Detail_Penjualan D
JOIN Mobil M
    ON D.ID_Mobil = M.ID_Mobil
GROUP BY M.Merek;

-- 5. Query untuk menampilkan jumlah Transaksi bedasarkan status Transaksi (COUNT) --
SELECT 
    Status_Penjualan,
    COUNT(*) AS Jumlah_Transaksi
FROM Transaksi_Penjualan
GROUP BY Status_Penjualan;

-- 6. Query untuk melihat pendapatan dari pembelian setiap Pelanggan (COUNT & SUM) --
SELECT 
    P.Nama AS Nama_Pelanggan,
    COUNT(T.ID_Transaksi) AS Jumlah_Transaksi,
    SUM(D.Subtotal) AS Total_Belanja
FROM Pelanggan P
JOIN Transaksi_Penjualan T
    ON P.ID_Pelanggan = T.ID_Pelanggan
JOIN Detail_Penjualan D
    ON T.ID_Transaksi = D.ID_Transaksi
GROUP BY P.Nama;
