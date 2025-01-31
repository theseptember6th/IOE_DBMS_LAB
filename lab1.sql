-- Active: 1738216272266@@127.0.0.1@1433@LEC081
#LAB 1
--Create a database named ‘LEC081’ and create tables as following schema:
--Student (SID, Name, RN, Batch)
--Teacher (TID, Name, Faculty)

    create table Student(
        SID char(4),
        Name varchar(20),
        RN int,
        Batch char(4)
    );
    create table Teacher(
        TID char(4),
        Name varchar(20),
        Faculty char(3)
    );
--1. Insert any five records in each table
--2. Display all records.
insert into Student
values
('S001','kristal',1,'2081'),
('S002','Anish',2,'2082'),
('S003','Radhesh',3,'2083'),
('S004','Dipesh',4,'2084'),
('S005','Pradip',5,'2085');

select * from Student

insert into Teacher
VALUES
('T001','Ashok','BCX'),
('T002','Sandesh','BCT'),
('T003','Bibat','BCA'),
('T004','Johnson','BCT'),
('T005','Shesh','BCE');

select * from Teacher;

--3. Display only SID and Name from student table
select sid,name from student;

--4. Display Name and faculty from Teacher table.
select name,faculty from teacher;

--5. Remove ‘RN’ attribute from student relation.
alter table Student
drop column RN;
select * from Student;

--6. Add ‘salary’ attribute to teacher relation
alter table Teacher
add salary Decimal(10,2) DEFAULT 5000;
-- default values will apply to new rows and not old rows
select * from teacher
--7. Copy SID and name attribute to new relation ‘info_student’

select SID,name into info_student
from student;
select * from info_student;

--8. Delete all contents from info_student relation
drop table info_student;
select * from info_student;