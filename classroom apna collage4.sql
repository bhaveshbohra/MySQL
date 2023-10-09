create database college4;

use college4;

create table student (
std_id int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student (std_id, name, marks, grade, city) 
values 
(101, "anil", 78, "C", "pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "ekta", 12, "F", "Delhi"),
(106, "faiz", 82, "B", "Delhi");


create table course (
std_id int primary key,
course varchar(12)
);

insert into course (std_id, course)
values
(102, "math"),
(103, "english"),
(104, "computer"),
(105, "science"),
(107, "math"),
(108, "computer");


drop table student;

/* INNER join */

select *
from student
inner join course
on student.std_id = course.std_id;

select name, course
from student
inner join course
on student.std_id = course.std_id;

select name, course
from student as s
inner join course as c
on s.std_id = c.std_id
order by name desc;

/*Left right and full join(union) Join*/
select *
from student as s
left join course as c
on s.std_id = c.std_id;

select name , city, marks
from student as s
left join course as c
on s.std_id = c.std_id 
order by marks desc;

select *
from student as s
right join course as c
on s.std_id = c.std_id 
order by marks desc;

select * from student as s
left join course as c
on s.std_id = c.std_id 
Union
select * from student as s
right join course as c
on s.std_id = c.std_id 
order by marks desc;

/*left exclusive and right exclusive */

select * from student as s
left join course as c
on s.std_id = c.std_id 
where c.std_id is null;                     /*c. columnmame*/

select * from student as s
right join course as c
on s.std_id = c.std_id 
where s.std_id is null;                   /*s. columnmame*/

select * from student as s
left join course as c
on s.std_id = c.std_id 
where c.std_id is null                     /* full join excluding intersection*/
union
select * from student as s
right join course as c
on s.std_id = c.std_id 
where s.std_id is null;    



create table employee(
id int primary key,
name varchar(20),
manager_id int
);


insert into employee (id, name , manager_id)
values 
(101, "adam", 103),
(102, "bob", 103),
(103, "casey", 104),
(104, "donald", 105),
(105, "elon", null);

/*self join*/
select * from employee as e1
join employee as e2
on e1.id = e2.manager_id ;

select e1.name as manager_name , e2.name  
from employee as e1
join employee as e2
on e1.id = e2.manager_id ;


/* UNION */
select name from employee
union                                        /*only unique value */
select name from employee;

select name from employee
union all                                       /* all duplicate are allow and two different table is also valid */
select name from employee;