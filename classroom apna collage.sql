create database aptemp1;
DROP  DATABASE aptemp1;

CREATE DATABASE if not exists temp1;
DROP DATABASE if exists temp1;

CREATE DATABASE college1;
use college1;

create table student (
	id int primary key,
    name varchar(50),
    age int not NULL
);
insert into student values (11,"Bhavesh",26);
insert into student values (12,"Chirag",27);
insert into student values (13,"Amit",26);
insert into student (id,age) values (14,26);

insert into student 
(id,name, age)
values 
(15,"abhijeet", 27),
(16, "harsh", 25),
(17,"vikas", 23);

select * from student;

show databases;
show tables;

/*create table and drop table */
create table temp1 (
id int,
name varchar(50),
age int,
city varchar(20),
primary key (id)
);
drop table temp1;

/* primary key and foregin key, with constraint, check*/
create table temp2 (
id int,
name varchar(50),
age int,
city varchar(20),
primary key (id, name)
);

create table temp3 (
cust_id int,
address varchar(100),
Foreign Key (cust_id) references temp1 (id)
);

create table temp4 (
roll_no int primary key,
branch varchar(10),
subjects int default 3,
addmisson_date date ,
city varchar(10),
constraint check_subjects check (subjects >=2 and city= 'gujarat')
);
