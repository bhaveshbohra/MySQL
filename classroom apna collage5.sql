create database college5;
drop database college5;
show tables;
use college5;

create table student (
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student (rollno, name, marks, grade, city) 
values 
(101, "anil", 78, "C", "pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "ekta", 12, "F", "Delhi"),
(106, "faiz", 82, "B", "Delhi");

drop table student;

select avg(marks) from student;

select name, marks from student 
where marks > 75;

/* sub query where use*/
select name, marks from student 
where marks > (select avg(marks) from student);

select name, rollno from student 
where rollno in  (select rollno from student where rollno % 2=0);

/* sub query from  use*/
/*find max marks from the student of delhi using sub query*/

select max(marks)
from (select * from student where city = "Delhi") as temp;

/*other way*/
select max(marks) from student 
where city ="Delhi";

select (select max(marks) from student), name from student; 
/*sometime but not good using select insode select*/view1
/* Mysql View virtual table */ 

create view view1 as 
select rollno, name , marks from student;


select * from view1
where marks>95;

drop view view1;

