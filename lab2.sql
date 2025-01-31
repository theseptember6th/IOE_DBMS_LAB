-- Active: 1738216272266@@127.0.0.1@1433@LEC081@dbo
--Create the relations as below:
--Employee (Eid, Ename, employmentDate, Salary)
--BookList (Bid, Bname, Publication)
--Book (Bid, Bname, Author, Price)
--BookIssue (Eid,Sid Bname, DateOfIssue)

create table Employee (
    EID char(4),
    Ename varchar(20),
    employmentDate date,
    salary decimal(10,2) default 5000,
    Primary key(EID)

);

select * from Employee;
create table BookList(
    Bid char(4),
    Bname varchar(20),
    Publication varchar(10),
    Primary key(Bid)
);
select * from "BookList";

create table Book(
    Bid char(4),
    Bname varchar(20),
    Author varchar(20),
    Price decimal(5,2) default 2000
);
select * from "Book";

create table BookIssue(
    Eid char(4),
    Sid char(4),
    Bname varchar(20),
    DateofIssue date
);
select * from "BookIssue";

--1. Modify relation teacher and student
--i. Set Tid as foreign key
--ii. Set SID as primary key

-- (Answer)it means Set SID as the Primary Key in the Student table.
--Set TID as a Foreign Key in the Student table, referencing the Teacher table.
select * from "Student"

alter table "Student"
alter column SID char(4) not null;

ALTER TABLE Student
ADD CONSTRAINT PK_student PRIMARY KEY (SID);

EXEC sp_help 'Student';

alter table "Student"
add Tid char(4);

UPDATE Student
SET Tid = 'T001'
WHERE SID = 'S001';

UPDATE Student
SET Tid = 'T002'
WHERE SID = 'S002';

UPDATE Student
SET Tid = 'T003'
WHERE SID = 'S003';
UPDATE Student
SET Tid = 'T004'
WHERE SID = 'S004';

update "Student"
set "Tid"='T005'
where "SID"='S005'

alter table "Student"
alter column Tid char(4) not null;
alter table "Teacher"
alter column TID char(4) not null;

alter table "Teacher"
add constraint PK_Teacher Primary key(TID);
select * from "Teacher";
select * from student;
alter table "Student"
add constraint FK_Student foreign key(Tid)
references "Teacher"(TID);

--2. Set default value of ‘employmentDate’ attribute as December 1, 2010.
alter table "Employee"
add constraint DF_Employee_EmploymentDate
default '2010-12-01'
for employmentDate;

insert into Employee(EID,Ename,salary) values('E107','DefaultValue',10000);
select * from "Employee";

--3. Assign foreign key to attributes: ‘Bid’ in Book and EId and Sid in BookIssue relation (Allow Null
--values if required).

alter table "Book"
add constraint FK_Book foreign key(Bid)
references "BookList"(Bid);

select * from "BookList";
alter table "BookList"
add
Eid char(4),
Sid char(4);

alter table "BookList"
add constraint FK1_Booklist
foreign key (Eid)
REFERENCES
"Employee"(Eid)

alter table "BookList"
add constraint FK2_Booklist
foreign key (Sid)
REFERENCES
"Student"(SID);

select * from "BookList";

--4. All the price of books must be less than 5000.
alter table "Book"
add constraint check_constraint 
check(Price<5000);
--checking price

alter table "Book"
alter column Price decimal(7,2);
insert into "Book" values('B001','Mathematics','VDS SIR',6000);
insert into "BookList" values('B002','Social','Asmita','E107','S001');
insert into "Book" values('B002','Science','Kristal',3000);

--5. Ename , Bname attribute of each relation must contain some value.
alter table "Employee"
alter column Ename varchar(20) not null;

alter table "BookList"
alter column Bname varchar(10) not null;
alter table "Book"
alter column Bname varchar(10) not null;
alter table "BookIssue"
alter column Bname varchar(10) not null;

--Bname attribute of Booklist relation must be unique.
alter table "BookList"
add constraint UQC_Bname_booklist
unique(Bname);

--7. Insert any 4 records in each relation.
--8. Display all records from all relations.
select * from "Employee";
select * from "BookList";
select * from "Book";
select * from "BookIssue";

insert into "Employee"
values
('E101','Rajan','2011-01-02',15000),
('E102','Alex','2012-02-03',16000),
('E103','Jain','2013-03-04',17000),
('E104','Bibek','2014-04-05',18000);
select * from "Employee";

insert into "BookList"
VALUES
('B001','Science','oldISgold','E101','S002'),
('B003','EDC','oldISgold','E102','S002'),
('B004','C++','BikalCodes','E103','S002'),
('B005','python','CampusX','E104','S002');
select * from "BookList";

insert into "Book"
VALUES
('B001','ECT','Pradip',1200),
('B002','letusC','Alex',1100),
('B003','Javascript','CodeWithHarry',1500),
('B004','Tkinter','Elon',1800);
select * from "Book";

select * from "BookIssue";
insert into "BookIssue"
VALUES
('E101','S001','QuantumPhy','2018-01-01'),
('E102','S002','Nepali','2019-02-02'),
('E103','S003','Chemistry','2020-03-03'),
('E104','S004','Mechanics','2021-04-04');


--9. Display Employee id and Employee name of all employees whose salary is less than 10000.

insert into "Employee"
values('E108','PoorMan','2025-12-12',6000);
select Eid,Ename
from "Employee"
where salary<10000;

--10. Display all record of book whose price ranges from 2500 to 5000.

insert into Book
VALUES
('B001','Social','uttam',4000);
select * from "Book";
select * from "Book"
where price between 2500 and 5000;

--11. Display all the records from Booklist relation whose publication name starts from ‘E’ e.g. Ekta

insert into "BookList" values('B009','ECT','Ekta','E102','S001');
select * from "BookList"
where "Publication" like 'E%';

--12. Display all records from employee table whose name ends with ‘ta’ e.g. Sita, Geeta etc.

insert into "Employee" values ('E110','Sita','2024-11-12',8000);
select * from "Employee"
where "Ename" like '%ta';

--13. Display all from book table with Book name exactly consist of 4 characters.
select * from "Book";
insert into "Book"
VALUES
('B001','DBMS','Ashok',1900);
select * from "Book"
where "Bname" like '____';

--14. Display id, name and salary from employee table where Employee name starts with ‘S’ and salary
--greater than 10000.
select * from "Employee";
insert into "Employee"
VALUES('E111','Sandip','2017-11-02',15000);
select "EID",Ename,salary
from "Employee"
where Ename like 'S%'
and salary > 10000;

--15. Display all records from book table where either book id lies in range B001 to B999 or price range in
--1000 to 2500.
select * from "Book";
select * from "Book"
where Bid BETWEEN
'B001' and 'B999'
or price between
1000 and 2500;

--16. Display Book number and book name where booklist must not contain Book id with number B003.

select * from "BookList";

select Bid,Bname from
"BookList" where
"Bid" !='B003';

--17. Remove the salary column from the teacher table.

select * from "Teacher";

-- Step 1: Find the default constraint for the salary column
SELECT name
FROM sys.default_constraints 
WHERE parent_object_id = OBJECT_ID('Teacher') 
AND parent_column_id = COLUMNPROPERTY(OBJECT_ID('Teacher'), 'salary', 'ColumnId');

ALTER TABLE Teacher 
DROP CONSTRAINT DF__Teacher__salary__02FC7413;

alter table "Teacher"
drop column salary;
