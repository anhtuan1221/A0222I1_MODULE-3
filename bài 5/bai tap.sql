create database if not exists demo;
use demo;
create table Products(
id int primary key auto_increment,
productCode varchar(45),
productName varchar(45),
productPrice double,
productAmount int ,
productDescription varchar(50),
productStatus int
);
insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
values 	('A1','name1',10000,1,'des1',0),
		('A2','name2',20000,2,'des2',0),
		('A3','name3',30000,3,'des3',0),
		('A4','name4',40000,4,'des4',0),
		('A5','name5',50000,5,'des5',0),
		('A6','name6',60000,6,'des6',0);
-- 3
select * from Products where productCode = 'A5';
create unique index i_Products on Products(productCode);
create index name_price on Products(productName,productName);
alter table Products add index i_name_price (productName,productPrice);
explain select * from Products where productCode = 'A5';
explain select * from Products p where p.productName = 'name4' and p.productPrice = 40000;
-- 4
create view product_view as 
select productCode,productName,productPrice,productStatus
from Products;
select * from product_view;

create or replace view product_view as
select productCode,productName,productDescription
from Products;
drop view product_view;
-- 5 
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure get_information()
begin
select * from  Products;
end //
DELIMITER ;
call get_information ();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure insert_product()
begin
insert into Products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
values ('A7','name7',70000,7,'des7',0);
end //
DELIMITER ;
call insert_product();
select * from Products;
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure update_information(in sp_id int)
begin
update Products 
set productCode= 'A10' ,productPrice = 1000000
where id =sp_id;
end //
DELIMITER ;
call update_information(2);
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure delete_product(in sp_id int)
begin
delete from Products where id = sp_id;
end //
DELIMITER ;
call delete_product(1);
select * from Products;