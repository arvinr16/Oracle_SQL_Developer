select * from tab;

purge table "";

-- 1. Tampilkan seluruh nama Table
select table_name from user_tables;

-- 2. Tampilkan struktur Table masing-masing urut dari Table parent hingga child
desc mobil;
desc pelanggan;
desc pegawai;
desc metode_pembayaran;
desc transaksi_penjualan;
desc detail_penjualan;


-- 3. Tampilkan seluruh data di masing-masing Table urut dari Table parent hingga child
select * from mobil;
select * from pelanggan;
select * from pegawai;
select * from metode_pembayaran;
select * from transaksi_penjualan;
select * from detail_penjualan;

-- 4. Joinkan 2 Table
-- a. Query JOIN Table Mobil dengan Detial_Penjualan
select
    m.id_mobil,
    m.merek,
    m.model,
    m.tahun,
    d.subtotal
from mobil m
join detail_penjualan d
    on m.id_mobil = d.id_mobil;
-- b. Query JOIN Table
select
    t.id_transaksi,
    p.nama as nama_pegawai,
    p.jabatan
from transaksi_penjualan t
join pegawai p
    on t.id_pegawai = p.id_pegawai; 
    
select
    id_transaksi,
    nama as nama_pegawai,
    jabatan
from transaksi_penjualan
join pegawai
    using (id_pegawai); 

SELECT
    harga_jual,
    TO_CHAR(harga_jual, 'L999G999G999D00') AS "Harga Rupiah"
FROM
    mobil;

-- Kondisi Like Operator
select * from (nama_table) where (nama_kolom) like '%(apa kondisinya, misal huruf A)%';
