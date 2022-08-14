create database if not exists QuanLySinhVien;
use QuanLySinhVien;
create table Class(
ClassID int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
`Status` bit 
);
create table Student(
StudentID int not null auto_increment primary key,
StudentName varchar (30) not null,
Address varchar (50),
Phone varchar (20),
`Status` Bit,
ClassID int not null,
foreign key (ClassID) references class(ClassID)
);
create table `Subject`(
SubID int not null auto_increment primary key,
SubName varchar(30) not null,
Credit Tinyint not null default 1 check (Credit >= 1),
`Status` bit default 1 
);
create table Mark(
MarkID int not null primary key auto_increment,
SubID int not null,
StudentID int not null,
Mark float default 0 check (Mark between 0 and 100),
ExamTimes tinyint default 1,
unique (SubID,StudentID),
foreign key (SubID) references `Subject`(SubID),
foreign key (StudentID) references Student(StudentID)
);
insert into Class value (1,'A1','1996-12-12',1);
insert into Class value (2,'A2','1996-12-13',1);
insert into Class value (3,'A3','1996-12-14',0);
insert into Student (StudentName,Address,Phone,`Status`,ClassID)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student (StudentName,Address,Phone,`Status`,ClassID)
values ('Hoa', 'Hai phong', '0993322323', 1,1);
insert into Student (StudentName,Address,Phone,`Status`,ClassID)
values ('Manh', 'HCM', '0123123123', 0, 2);
insert into `Subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
insert into Mark (SubId, StudentId, Mark, ExamTimes)
values (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from Student where StudentName like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from Class where month(StartDate)=12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject where Credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student set ClassID=2 where StudentName = 'Hung';
select * from Student;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select StudentName,SubName,Mark
from Student s join Mark m on s.StudentID=m.StudentID
join Subject sub on m.SubID= sub.SubID
order by  Mark desc , StudentName;
