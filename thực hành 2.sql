CREATE DATABASE QuanLyDiemThi;
use QuanLyDiemThi;
CREATE TABLE HocSinh(
`MaHS` varchar(50) PRIMARY KEY,
`TenHS` varchar(50),
`NgaySinh` DATETIME,
`Lop` varchar(20),
`GT` varchar(20)
);
CREATE TABLE MonHoc(
`MaMH` varchar(20) PRIMARY KEY,
`TenMH` varchar(20)
);
CREATE TABLE BangDiem(
`MaHS` varchar(20),
`MaMH` varchar(20),
DiemThi int,
`NgayKT` DATETIME,
PRIMARY KEY(MaHS,MaMH),
FOREIGN KEY(`MaHS`) REFERENCES HocSinh(`MaHS`),
FOREIGN KEY (`MaMH`) REFERENCES MonHoc(`MaMH`)
);
CREATE TABLE GiaoVien(
`MaGV` varchar(20) PRIMARY KEY,
`TENGV` VARCHAR(20),
`SDT` varchar(10)
);
ALTER TABLE MonHoc ADD `MaGV` varchar(20);
