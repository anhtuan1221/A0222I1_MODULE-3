create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int primary key auto_increment,
cName varchar(50) not null,
cAge int not null
);
create table `Order`(
oID int primary key auto_increment,
cID int not null,
oDate datetime,
oToTalPice float,
foreign key (cID) references Customer(cID)
);
create table Product(
pID int primary key auto_increment,
pName varchar(50) not null,
pPrice float not null
);
create table OrderDetail(
oID int,
pID int,
odQTY varchar(30) not null,
primary key(oID,pID),
foreign key(oID) references `Order`(oID),
foreign key(pID) references Product(pID)
);