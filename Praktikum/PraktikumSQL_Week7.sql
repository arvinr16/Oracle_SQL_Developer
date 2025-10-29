select table_name from user_tables;

select * from produk;

select * from mahasiswa;

-- Masukkan data ke kolom Produk --
insert all 
into produk values ('P001', 'Laptop Gaming Nitro 5', 'Laptop', 15000000, 20)
into produk values ('P002', 'Mouse Gaming Viper Mini', 'Aksesoris', 850000, 50)
into produk values ('P003', 'Monitor LED 24 inch', 'Monitor', 2500000, 35)
into produk values ('P004', 'Keyboard Mechanical RGB', 'Aksesoris', 1200000, 40)
into produk values ('P005', 'Laptop Office MateBook', 'Laptop', 9500000, 25)
into produk values ('P006', 'MousePad Gaming', 'Aksesoris', 150000, 75)
select * from dual;

insert all
into Mahasiswa values ('250111', 'Gareng', TO_DATE('01-08-2023', 'DD-MM-YYYY'))
into Mahasiswa values ('250112', 'Semar', TO_DATE('01-08-2022', 'DD-MM-YYYY'))
into Mahasiswa values ('250113', 'Petruk', TO_DATE('01-08-2024', 'DD-MM-YYYY'))
select 1 from dual;

insert into produk values ('P007', 'Cooling fan Laptop', 'Aksesoris', '', 10);

-- Cara menambahkan command untuk memberikan pernyataan pada suatu Table Column.
select
Nama_Produk,
Harga,
case
    when Harga > 10000000 then 'Premium'
    when Harga > 2000000 then 'Menengah'
    else 'Murah'
end as Label_Harga
from produk;

-- Cara menambahkan pernyataan terkait Column pada suatu Table.
select Nama_Produk, Harga, NVL2(Harga, 'Harga Ditemukan', 'Hubungi CS') as Status_Harga from produk;
