-- 1. Buatlah query untuk menampilkan nama pelanggan, jumlah-
--    transaksi yang pernah dilakukan, dan total nilai pembelian,-
--    hanya untuk pelanggan yang memiliki lebih dari 1 transaksi-
--    dengan status penjualan SELESAI
select
    n.nama as nama_pelanggan,
    t.tanggal_transaksi,
    t.status_penjualan
from pelanggan n
join transaksi_penjualan t
    on t.id_pelanggan = n.id_pelanggan;

desc mobil;
desc pelanggan;
desc pegawai;
desc metode_pembayaran;
desc transaksi_penjualan;
desc detail_penjualan;

select * from mobil;
select * from pelanggan;
select * from pegawai;
select * from metode_pembayaran;
select * from transaksi_penjualan;
select * from detail_penjualan;

-- 1. Tampilkan nama pelanggan, tanggal transaksi, dan status penjualan
select
    n.nama as nama_pelanggan,
    t.tanggal_transaksi,
    t.status_penjualan
from pelanggan n
join transaksi_penjualan t
    on t.id_pelanggan = n.id_pelanggan;

-- 2. Tampilkan nama pelanggan dan tanggal transaksi hanya untuk transaksi-
--    yang berstatus SELESAI
select
    n.nama as nama_pelanggan,
    t.tanggal_transaksi,
    t.status_penjualan
from pelanggan n
join transaksi_penjualan t
    on t.id_pelanggan = n.id_pelanggan
    where t.status_penjualan = 'SELESAI';
    
-- 3. Tampilkan nama_pelangan, merek mobil, dan model mobil yang dibeli
select
    n.nama as nama_pelanggan,
    m.merek,
    m.model,
    m.status_mobil
from pelanggan n
join transaksi_penjualan t
    on n.id_pelanggan = t.id_pelanggan
join detail_penjualan d
    on d.id_transaksi = t.id_transaksi
join mobil m
    on d.id_mobil = m.id_mobil
where m.status_mobil = 'TERJUAL';

-- 4. Hitung jumlah transaksi yang pernah dilakukan oleh setiap pelanggan
select
    n.nama,
    t.status_penjualan,
    count(*) as jumlah_transaksi
from pelanggan n
join transaksi_penjualan t
    on t.id_pelanggan = n.id_pelanggan
where t.status_penjualan = 'SELESAI'
group by n.nama, t.status_penjualan;
    
select
nama,
    count (*) as transaksi_pelanggan
from pelanggan
group by nama;
    n.nama as nama_pelanggan
from pelanggan n
join transaksi_penjualan t
    on t.id_pelanggan = n.id_pelanggan;
    