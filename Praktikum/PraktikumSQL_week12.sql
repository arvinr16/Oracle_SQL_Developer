SELECT table_name FROM user_tables;

SELECT * FROM departemen;

SELECT * FROM karyawan;

SELECT pekerjaan FROM karyawan;

SELECT nama, pekerjaan FROM karyawan;

SELECT id_dept FROM departemen;

-- 2. BUAT TABEL DEPARTEMEN
CREATE TABLE Departemen (
    ID_Dept     NUMBER(4) PRIMARY KEY,
    Nama_Dept   VARCHAR2(30)
);

-- 3. BUAT TABEL KARYAWAN
CREATE TABLE Karyawan (
    ID_Karyawan NUMBER(5) PRIMARY KEY,
    Nama        VARCHAR2(50),
    Gaji        NUMBER(10),
    ID_Dept     NUMBER(4),
    Pekerjaan   VARCHAR2(30)
);

-- 4. ISI DATA (Data dirancang untuk skenario Subquery)
INSERT ALL
    INTO Departemen VALUES (10, 'IT Development')
    INTO Departemen VALUES (20, 'Sales Marketing')
    INTO Departemen VALUES (30, 'Finance')
    INTO Karyawan VALUES (101, 'Budi (IT Lead)', 15000000, 10, 'Programmer')
    INTO Karyawan VALUES (102, 'Andi (IT Staff)', 8000000, 10, 'Programmer')
    INTO Karyawan VALUES (103, 'Citra (IT Staff)', 8000000, 10, 'Programmer')
    INTO Karyawan VALUES (104, 'Dewi (Sales Mgr)', 12000000, 20, 'Sales Manager')
    INTO Karyawan VALUES (105, 'Eko (Sales)', 5000000, 20, 'Sales Rep')
    INTO Karyawan VALUES (106, 'Fani (Sales)', 5000000, 20, 'Sales Rep')
    INTO Karyawan VALUES (107, 'Gina (Finance)', 14000000, 30, 'Accountant')
    INTO Karyawan VALUES (108, 'Hadi (Intern)', 3000000, 10, 'Intern')
SELECT 1 FROM DUAL;
