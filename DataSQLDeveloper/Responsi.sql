-- 1. Tampilkan seluruh nama Tabel
select table_name from user_tables;

-- 2. Tampilkan sturktur Table urut dari parent hingga child
desc mobil;
desc pelanggan;
desc pegawai;
desc metode_pembayaran;
desc transaksi_penjualan;
desc detail_penjualan;

-- 3. Tampilkan seluruh data dari semua Tabel
select * from mobil;
select * from pelanggan;
select * from pegawai;
select * from metode_pembayaran;
select * from transaksi_penjualan;
select * from detail_penjualan;

-- 4. JOIN minimal 2 Tabel
select
    m.id_mobil,
    m.merek,
    m.model,
    m.tahun,
    d.subtotal,
from mobil m
join detail_penjualan d
    on m.id_mobil = d.id_mobil;

-- Pertanyaan-pertanyaan pada saat Responsi
-- 1. JOIN detail penjualan ke mobil dan transaksi
select
    d.id_detail_penjualan,
    d.harga,
    m.merek,
    m.harga_jual,
    t.status_penjualan
from detail_penjualan d
join mobil m
    on d.id_mobil = m.id_mobil
join transaksi_penjualan t
    on d.id_transaksi = t.id_transaksi;
-- Lanjutan nomor 1 jika hanya status penjualan yang SELESAI
select
    d.id_detail_penjualan,
    d.harga,
    m.merek,
    m.harga_jual,
    t.status_penjualan
from detail_penjualan d
join mobil m
    on d.id_mobil = m.id_mobil
join transaksi_penjualan t
    on d.id_transaksi = t.id_transaksi
where status_penjualan = 'SELESAI';

-- 2. Hitung harga jual yang mereknya Toyota dan statusnya SELESAI
select
    d.id_detail_penjualan,
    d.harga,
    m.merek,
    m.harga_jual,
    t.status_penjualan
from detail_penjualan d
join mobil m
    on d.id_mobil = m.id_mobil
join transaksi_penjualan t
    on d.id_transaksi = t.id_transaksi
where status_penjualan = 'SELESAI'
    and m.merek = 'Toyota';

-- 3. Hitung jumlah subtotal yang tidak ada diskonnya
select 
    to_char(sum(subtotal),
    'L999G999G999G999D00') as Harga_Subtotal
from detail_penjualan
where diskon = '0';
    
-- Query untuk merubah nilai subtotal menjadi format Rupiah:
select 
    to_char(subtotal, 'L999G999G999D00') as harga_subtotal,
    diskon from detail_penjualan where diskon = '0';

-- 4. Tampilkan data mobil yang harganya paling mahal
select
    m.merek as Mobil_Termahal,
    to_char(d.harga, 'L999G999G999G999D00') as Harga_Mobil_Termahal
from detail_penjualan d
join mobil m
    on d.id_mobil = m.id_mobil
where d.harga = (select max(harga) from detail_penjualan);

-- kode yang salah:
select
    m.merek,
    to_char(max(d.harga), 'L999G999G999D00') as Mobil_Termahal
from detail_penjualan d
join mobil m
    on d.id_mobil = m.id_mobil
where d.harga = (select max(d.harga) from detail_penjualan);

SELECT
    TO_CHAR(MAX(harga), 'L999G999G999G999D00') AS Harga_Mobil_Termahal
FROM detail_penjualan;

-- 5. 
    