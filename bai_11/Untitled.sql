CREATE DATABASE if not exists demo_practice;
USE demo_practice;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users (`name`,email,country)
values	('Tuan','tuan123@gmail.com','da nang'),
		('Hai','tuan123@gmail.com','da nang'),
		('Thuan','thuan456@gmail.com','da nang');
select * from users;

DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    where users.id = user_id;
    END$$
DELIMITER ;
CALL get_user_by_id();

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$
DELIMITER ;
CALL insert_user(?,?,?);

delimiter //

create procedure list_user()
begin
	select * from users;
	end//
    
delimiter ;
CALL list_user();

delimiter //
create procedure update_user(in name_new varchar(30),in email_new varchar(30),in country varchar(30),in id_new int)
begin
update users set `name` = name_new , email= email_new, country= country_new where id = id_new;
end//
delimiter ; 
call update_user();

