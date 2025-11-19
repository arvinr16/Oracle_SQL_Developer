select * from all_users;

select table_name from user_tables;

select * from produk;

select * from mahasiswa;

select * from jurusan;

create table jurusan (
    ID_Jurusan varchar2(5) primary key,
    Nama_Jurusan varchar2(50) not null
);

insert all
    into jurusan values ('SI', 'Sistem Informasi')
    into jurusan values ('IF', 'Teknik Informatika')
    into jurusan values ('DKV', 'Desain Grafis')
select 1 from dual;

create table mahasiswa (
    NIM varchar2(10) primary key,
    Nama_Lengkap varchar2(50),
    ID_Jurusan varchar2(5),
    
    constraint fk_mhs_jurusan foreign key (ID_Jurusan) references Jurusan(ID_Jurusan)
);

insert all
    into Mahasiswa values ('250111', 'Paijo Dalmoyo', 'SI')
    into Mahasiswa values ('250112', 'Semar Dalijo', 'IF')
    into Mahasiswa values ('250113', 'Gareng Donjon', 'DKV')
    into Mahasiswa values ('250114', 'Petruk Gethuk', null)
select 1 from dual;


-- KONSEP SELF JOIN

-- BUAT TABEL KARYAWAN
CREATE TABLE Karyawan (
  ID_Karyawan VARCHAR2(5) PRIMARY KEY,
  Nama VARCHAR2(50),
  ID_Manajer VARCHAR2(5)
);

-- ISI DATA
INSERT ALL
  INTO Karyawan VALUES ('K01', 'Budi (Manajer)', NULL)
  INTO Karyawan VALUES ('K02', 'Ani (Staf)', 'K01')
  INTO Karyawan VALUES ('K03', 'Citra (Staf)', 'K01')
SELECT 1 FROM DUAL;
