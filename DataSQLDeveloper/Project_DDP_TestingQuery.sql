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

-- TESTING --SELECT
-- Digunakan untuk menampilkan Kolom ID_Transaksi dan Status_Penjualan dari Tabel Transaksi_Penjualan hanya untuk Transaksi yg dibatalkan. --
select id_transaksi, status_penjualan from transaksi_penjualan WHERE status_penjualan = 'DIBATALKAN';

-- Digunakan untuk mencari kalimat 'Merah'
select  warna, id_mobil, merek
from mobil 
where warna 
like '%Merah%';

