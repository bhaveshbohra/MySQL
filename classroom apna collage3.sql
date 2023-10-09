/* alter schema  design (columns , datatype, constraint */

create database college3;

use college3;

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

/*add column */ 
alter table student
add column age int not null default 19;

select * from student;

/*drop column */ 
alter table student
drop column grade;

select * from student;

/*rename table  */ 
alter table student
rename to teacher;

/*change  column name */ 
alter table teacher
change column rollno id  int ;

select * from teacher;

/*modify  column data type  */ 
alter table teacher
modify age varchar(2);

/* truncate : to delete table"s data
note : drop :- delete whole table and truncate delete table data not table  */

truncate table teacher;


/* question*/
alter table student
change name full_name varchar(20);
select * from student;



SET SQL_SAFE_UPDATES = 0;
delete from student where marks < 80;

alter table student
drop column grade; 