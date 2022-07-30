create database if not exists QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int primary key,
cName varchar(50) not null,
cAge int not null
);
create table `Order`(
oID int primary key ,
cID int not null,
oDate datetime,
oToTalPice float,
foreign key (cID) references Customer(cID)
);
create table Product(
pID int primary key ,
pName varchar(50) not null,
pPrice float not null
);
create table OrderDetail(
oID int,
pID int,
odQTY int not null,
primary key(oID,pID),
foreign key(oID) references `Order`(oID),
foreign key(pID) references Product(pID)
);
insert into Customer
values(1,'Minh Quan',10),(2,'Ngoc Oanh',20),(3,'HongHa',50);
insert into `Order` (oID, cID,oDate)
values (1,1,'2006-3-21'),(2,2,'2006-3-22'),(3,1,'2006-3-26');
insert into Product
values (1,'May giat',3),(2,'Tu Lanh',5),(3,'Dieu Hoa',7),(4,'Quat',1),(5,'Bep Dien',2);
insert into OrderDetail
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID,oDate,oToTalPice from `Order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName,p.pName  from OrderDetail od
join Product p on od.pID= p.pID
join `Order` o on od.oID= o.oID
join Customer c on o.cID= c.cID;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from Customer c
left join `Order` o on c.cID=o.cID
where o.oID is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
select od.oID as `code`, o.oDate as `date`, sum(p.pPrice* od.odQTY) as `total`  from OrderDetail od
join Product p on od.pID= p.pID
join `Order` o on od.oID= o.oID
group by o.oID;
