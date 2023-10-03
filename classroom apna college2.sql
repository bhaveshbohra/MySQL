create database college2;

use college2;

create table student (
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

/* INSERT*/
/* to insert mutliple value together */ 
insert into student (rollno, name, marks, grade, city) 
values 
(101, "anil", 78, "C", "pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "ekta", 12, "F", "Delhi"),
(106, "faiz", 82, "B", "Delhi");

/* to insert single value */
insert into student values (107, "bhavesh", 68, "D", "Mumbai");
insert into student values (108, "bhavesh", 98, "A", "Mumbai");


/* to insert particular value rest are null  */
insert into student (rollno , marks , grade) values (109, 98, "A");


/* SELECT*/
select name, marks from student;
select * from student;
select distinct city from student;

/*WHERE AND LIMIT, between , in , not in */

select * from student where marks >80;
select * from student where city = "Mumbai";
select * from student where  marks >80 and city = "Delhi";
select * from student where marks+10 >100;
select * from student where marks between 60 and 80;
select * from student where city not in ("pune", "Mumbai");
select * from student where city in ("Delhi", "Mumbai") or marks<80;
select * from student limit 4;
select * from student where marks> 75 limit 4;

/*ORDER BY  AND LIMIT */
select * from student order by city asc;
select * from student order by marks desc;
select * from student order by marks desc limit 3;
select name, grade from student order by name asc;
select * from student order by marks , city asc;
select * from student order by city asc, marks asc;
select * from student order by city asc, marks desc;
select * from student order by city asc, marks desc limit 3;


/* AGGREGATION AND LIMIT AND DISCTINCT*/
select max(marks) from student;
select min(marks) from student;
select avg(marks) from student;
select count(name) from student;
select count(distinct name) from student;

/* GROUPBY :- WITH ORDER BY, AGGREGATION, WHERE AND LIMIT*/
select city  from student group by city;
select city , count(name) from student group by city;
select city , count(name) from student group by city order by city;
select city ,grade,count(name) from student group by city,grade order by grade;
select city, avg(marks) from student group by city;
select city, avg(marks) from student group by city order by city; 
select city ,count(city) from student group by city  order by count(city);
select grade, count(rollno) from student group by grade order by grade;
/* actually way of writing  */
select city ,count(city) from student 
where marks >=80 
group by city 
order by count(city);

/* Having clause where we can't apply where ,used when we want to apply any condtion on  grouping */

select count(name) ,city 
from student
group by city
having max(marks)>90;

select count(name) ,city 
from student
group by city
having max(marks)>90
order by count(name);

/* General form and note :where use on  rows and having use  for group*/
select count(name) ,city 
from student
where grade = "A"
group by city
having max(marks)>80
order by city desc;


/* table realted Queries */
/* Update :- to update existing rows*/

update student 
set grade ="O"
where grade ="A";

/*gives Error 1175 in MySQL typically indicates a "safe update" error. 
MySQL has a feature called "safe update mode" that prevents certain types of UPDATE and DELETE queries 
that could potentially affect a large number of rows or have unintended consequences. 
This is a safety feature to help prevent accidental data loss. */

SET SQL_SAFE_UPDATES = 0;

update student 
set grade ="O"
where grade ="A";

update student
set marks= 72 
where rollno =105;

update student
set name = "akash", city = "pune"
where rollno =109;

UPDATE student
SET grade = CASE
    WHEN marks between 90 and 100 THEN "O"
    WHEN marks between 80 and 89 THEN "A"
    WHEN marks between 70 and 79 THEN "B"
    WHEN marks between 60 and 69 THEN "C"
    ELSE grade -- Keep the existing grade for other cases
END;

update student
set marks = marks-1; 
select * from student;

SET SQL_SAFE_UPDATES = 1;

/*delete*/
delete from student where rollno = 107; /* no error in this case */
SET SQL_SAFE_UPDATES = 0;
delete from student where marks < 50;  /* but again need safe update =0 here for multi row change *?
SET SQL_SAFE_UPDATES = 1;
/*delete from student  : this command remove table */

/* table student already exist*/

/* prent table*/
create table department (
id  int primary key,
name varchar(50)
); 


/* child table*/
create table teacher (
id  int primary key,
name varchar(50),
dept_id int not null,
foreign key(dept_id) references department(id) 
/* region behind using on delete cascade or update cascade , when we create a foregin key using this option , 
it deletes(updated) the referencing rows in thi child table when the reference row is deleted(updated) 
in the parent table which has a primary key */
    
on delete cascade
on update cascade
);  