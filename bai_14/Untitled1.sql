create database if not exists exam;
use exam;
create table category(
id int primary key AUTO_INCREMENT,
`name` varchar(200) not null 
);
create table product(
id int primary key AUTO_INCREMENT,
`name` varchar(30) not null,
price double not null,
quatity int not null,
color varchar(20) not null,
`describe` varchar(100),
category int not null,
foreign key(category) references category(id)
);
insert into product(`name`,price,quatity,color,category)
values	('IPhone 11',799,12,'Purple,Yellow,Green',1),
		('IPhone 14 pro',1999,12,'white,Yellow,Green',1),
		('LG Smart TV',2999,12,'black',2),
		('Bphone',999,12,'blue,Yellow,black',1),
		('Sam Sung Galaxy SE10',10000,10,'blue,Yellow,black',1);
insert into category(`name`)
values	('Phone'),
		('Television');

        