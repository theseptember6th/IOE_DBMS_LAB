-- Active: 1738216272266@@127.0.0.1@1433@LEC081
-- Active: 1738216272266@@127.0.0.1@1433@model@dbo
--1. Perform join operation on teacher and employee table and display the Employee name, Faculty and
--salary

select * from teacher;
select * from Employee;

select Ename,faculty,Employee.salary
from Employee JOIN teacher on eid=tid;

--2. Perform left join on table book list and book table

select * from BookList left JOIN Book ON "BookList".Bid="Book".Bid;

--3. Perform right join on booklist and book table
select * from BookList RIGHT JOIN Book ON "BookList".Bid="Book".Bid;


--4 Perform Full join on student and issues table.
select * from Student FULL JOIN BookIssue on Student.SID="BookIssue".Sid;


--5 Find those employees name and id who have issued the book named “database”.
select Ename,Employee.EID from Employee JOIN BookIssue
on "Employee".EID="BookIssue".Eid and Bname='database';

--6 Find the book name, bid, author name and the book published by “Ekata” Publication.
select BookList.Bname,Author,Publication
from BookList JOIN Book on "BookList".Bid=Book.Bid
and publication ='Ekata';

--7  Display those employees name and salary whose name starts with‘s’ or whose name consist ‘ni’ as substring.

select ename,salary from employee
where ename like 's%' and ename LIKE '%ni%';


--8  Display name of the employee who is also a teacher.
select Ename from Employee
intersect
select name from teacher;

--9  Display all employees name except the name who are teachers
select ename from employee
except
select name from teacher;

--10 Create a view “Employee-view” which consist of eid, ename, salary as attributes.
create view employee_view
as
select eid,ename,salary
from employee;

select * from employee_view;

--11. Insert a new record in recently created view. And also display the contents its primary table

insert into employee_view(eid,ename,salary)
values('E121','Radha',45000);
select * from employee;

--12. Create a view “Employee_Info” which consist of employee name faculty and salary as its members and the salary should be less than 50000.
create view Employee_info
as 
select ename,employee.salary,faculty
from employee join teacher on eid=tid where salary < 50000;

select * from employee_info;

--13. Delete the information from “Employee-view” where salary are in range between 5000 to 15000.

delete from employee_view
where salary BETWEEN 5000 and 15000;

select * from employee_view;

