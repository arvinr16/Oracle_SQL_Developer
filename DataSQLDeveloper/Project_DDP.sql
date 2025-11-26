-- Query untuk cek Table-table --
SELECT table_name fROM user_tables;

SELECT * FROM Mobil;

SELECT * FROM Pelanggan;

SELECT * FROM Transaksi_Penjualan;

SELECT * FROM Detail_Penjualan;

SELECT * FROM Metode_Pembayaran;

SELECT * FROM Pegawai;

DESC Mobil;

DESC Pelanggan;

DESC Transaksi_Penjualan;

DESC Detail_Penjualan;

DESC Metode_Pembayaran;

DESC Pegawai;

DROP TABLE metode_pembayaran;

-- Query untuk tabel Mobil --
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

-- Query untuk tabel Pelanggan --
CREATE TABLE Pelanggan (
    ID_Pelanggan VARCHAR2(10),
    Nama VARCHAR2(100) NOT NULL,
    Alamat VARCHAR2(200) NOT NULL,
    No_HP VARCHAR2(15) NOT NULL,
    Email VARCHAR2(50),
    
    CONSTRAINT Pelanggan_PK PRIMARY KEY (ID_Pelanggan)
);

-- Query untuk tabel Transaksi_Penjualan --
CREATE TABLE Transaksi_Penjualan (
    ID_Transaksi VARCHAR2(10),
    Tanggal_Transaksi DATE NOT NULL,
    Status_Penjualan VARCHAR2(30)
        CONSTRAINT Status_Penjualan_CK
        CHECK (Status_Penjualan in ('SELESAI', 'DIBATALKAN')) NOT NULL,
    
    CONSTRAINT Transaksi_Penjualan_PK PRIMARY KEY (ID_Transaksi)
);

-- Query untuk tabel Detail_Penjualan --
CREATE TABLE Detail_Penjualan (
    ID_Detail_Penjualan VARCHAR2(10),
    Harga NUMBER(15,2) NOT NULL,
    Diskon NUMBER(5,2),
    Subtotal NUMBER(15,2) NOT NULL,
    
    CONSTRAINT Detail_Penjualan_PK PRIMARY KEY (ID_Detail_Penjualan)
);

-- Query untuk tabel Metode_Pembayaran --
CREATE TABLE Metode_Pembayaran (
    ID_Pembayaran VARCHAR2(10),
    Metode VARCHAR2(20) NOT NULL,
    Status_Bayar VARCHAR2(20)
        CONSTRAINT Status_Bayar_CK
        CHECK (Status_Bayar in ('LUNAS', 'BELUM LUNAS')) NOT NULL,
    
    CONSTRAINT Metode_Pembayaran_PK PRIMARY KEY (ID_Pembayaran)
);

-- Query untuk tabel Pegawai --
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


