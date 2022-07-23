create database if not exists QuanLiVatTu;
use QuanLiVatTu;
create table Vattu(
MaVTu varchar(40) primary key,
TenVTu varchar(30) not null
);
create table PhieuXuat(
SoPX int primary key,
NgayXuat datetime
);
create table PhieuXuatVatTu(
DGXuat double not null,
SLXuat int not null,
MaVTu varchar(40),
SoPX int,
primary key (MaVTu,SoPX),
foreign key (MaVTu) references Vattu(MaVTu),
foreign key (SoPX) references PhieuXuat(SoPX)
);
create table DonDN(
SoDH int primary key,
NgayDH datetime
);
create table DonDNVatTu(
SoDH int ,
MaVTu varchar(40),
primary key (SoDH,MaVTu),
foreign key (SoDH) references DonDN(SoDH),
foreign key (MaVTu) references Vattu(MaVTu)
);
create table NHACC(
MaNCC varchar(40) primary key,
TenNCC varchar(40) not null,
DiaChi varchar(200) not null,
SDT int (20) not null
);
create table SDTNHACC(
id int primary key auto_increment,
MaNCC varchar(40),
foreign key (MaNCC) references NHACC(MaNCC)
);
create table CungCap(
SoDH int,
MaNCC varchar(40),
primary key (SoDH,MaNCC),
foreign key (SoDH) references DonDN(SoDH),
foreign key (MaNCC) references NHACC(MaNCC)
);
create table PhieuNhap(
SoPN int primary key,
NgayNhap datetime
);
create table ChitietPhieuNhap(
DGNhap double not null,
SLNhao double not null,
MaVTu varchar(40),
SoPN int,
primary key (MaVTu,SoPN),
foreign key (MaVTu) references Vattu(MaVTu),
foreign key (SoPN) references PhieuNhap(SoPN)
);
-- drop database QuanLiVatTu;
