CREATE DATABASE  demo_practice;
USE demo_practice;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
select * from users;
insert into users (`name`,email,country)
values	('Tuan','tuan123@gmail.com','da nang'),
		('Hai','tuan123@gmail.com','da nang'),
		('Thuan','thuan456@gmail.com','da nang');