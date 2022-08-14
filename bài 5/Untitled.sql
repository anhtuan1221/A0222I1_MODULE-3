CREATE DATABASE if not exists a0222i1;
use a0222i1;
CREATE TABLE student (
id int ,
`name` varchar(50),
birthday date 
);
insert into student
values	(1,'tuan','1996-03-02');
insert into student(id,name,birthday)
values	(2,'tuan2','1996-03-02'),
		(3,'tuan3','1996-03-02');
select s.id,s.`name`
from student s;
select * from student;
update student
set `name` = 'tuan1', birthday= '2002-02-02' 
where id = 3;
delete from student where name = 'tuan4';
alter table student add column `point` int;
-- drop table student