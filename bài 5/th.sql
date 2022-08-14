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
`MGiaoVienaMH` varchar(20) PRIMARY KEY,
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
alter table MonHoc drop column MaGV;
alter table MonHoc add MaGV varchar(20);
alter table MonHoc add constraint FK_MaGV foreign key (MaGV) 
references GiaoVien(MaGV);