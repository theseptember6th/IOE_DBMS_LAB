--1. Perform a Cartesian join on employee and teacher table and display the result.

select * from teacher;
select * from "Employee";
select * from "Student";
select * from "BookIssue";
	
select * from Book;
select * from Booklist;
select * from employee,teacher;

-- 2. Perform a Cartesian join on employee and teacher table based on a common key attribute
insert into "Employee" values('T001','Ganesh','2011-12-01',9000);
select * from Employee,teacher where Eid=TID;

--3 Find all the book name, publication name and author name where publication name is �Ekta�.
insert into "Book" values('B009','Chemistry','Curie',1000);
select Book."Bname","Publication","Author" from Book,Booklist where Book."Bid"=Booklist."Bid" and "Publication" ='Ekta';

--4Find the teachers name and faculty who issued book on jan 1, 2015.
select * from "BookIssue";
insert into "BookIssue" values('T001','S001','ohmslaw','2015-01-01');
select name,faculty from teacher,BookIssue,employee  where DateofIssue='2015-01-01' and employee.Eid=BookIssue.Eid and "TID"=employee.Eid;

--5. Find the employee name whose salary is greater than 10000 and faculty is �computer�.
-- treating computer as BCT
select * from teacher;
insert into "Teacher" values('T006','Sushil','BCT');
insert into "Employee" values('T006','Rita','2000-12-01',10000);
update "Employee"
set salary=15000
where "EID"='T006';
select name from Employee,teacher where Eid=TID and salary > 10000.00 and "Faculty" = 'BCT';

--6.Find the student�s name who have issued book named �DBMS�.
insert into "BookIssue" values('E101','S001','DBMS','2021-12-02');
select name from student,BookIssue where student.SID=BookIssue.Sid  and Bname='DBMS';

--7. Add attribute bid on BookIssue relation.
alter table BookIssue
add bid char(4) ;
select * from BookIssue;
insert into BookIssue values('E101','S001','Grammar','1998-07-08','B001');
--8.Update the data in bid column.
update BookIssue set bid='B002' where bname='Grammar';
update BookIssue set bid='B003' where bname='Nepali';

--9 Find the employee name, book name, book�s author name taken by him where the price of book is less
--than 2500.
select Ename,book.Bname,Author from Employee,Book,BookIssue where Employee.Eid=BookIssue.Eid and BookIssue.bid=Book.Bid and price < 2500;

--10. Find the Teacher�s name, and book name issued by the teacher whose name starts with �S�.
insert into "Teacher" VALUES('T009','Simon','BCA');
insert into "Employee" VALUES('T009','Suraj','1999-01-02',9000);
insert into "BookIssue" VALUES('T009','S001','Typescript','1945-01-01',15000);
select Name,Bname from teacher,Employee,BookIssue where TID="Employee"."EID" and "Employee"."EID"="BookIssue"."Eid" and Name like 'S%';

--11 Update all salary by 10 %.
update "Employee"
SET salary=salary*1.1;
select * from "Employee";

--12. Update book name DBMS as DATABASE
update "Book"
set Bname='Database' where Bname='DBMS';
select * from "Book";

--13. Update the salary of all employee by 20% whose salary is less than 5000.
insert into "Employee" values('E211','Raju','2018-12-18',4000);
update "Employee"
set salary=salary*1.2
where salary <5000;
select * from "Employee";
--14. Provide 5% increment to all salaries whose salary is greater than 20000 and 20% increment in rest of
--salaries.
--(hint: CASE WHEN <CONDITION>THEN <STATEMENT> ELSE<STATEMENT> END).
update Employee
set salary=case
			when salary>20000 then salary*0.05
			else salary*1.2
			end;
select * from "Employee";
--15. Delete the records from employee table whose eid is E101.
--since we are trying to delete the primary key of parent table
--at the very first we must delete all the foreign keys linked to it
delete from "BookIssue" where "Eid"='E101';
select * from "BookIssue";
delete from "BookList" where "EID"='E101';
select * from "BookList";
--book list connects bid to book and booklist Eid 101 row's Bid is connected to books Bid B001 so remove it too

delete from "Book" where "Bid"='B001';
select * from "Book";

select * from Employee;
delete from "Employee" where "EID"='E101';


--16. Use sub query to find all teachers name and faculty whose date of employee is jan 2, 2011
insert into "Employee" values('T002','Sanjeev','2010-01-02',15000);
select * from "Employee";
select "Name","Faculty"
from "Teacher"
where "TID" in (select "EID" from "Employee" where "employmentDate" ='2010-01-02');

--17. Use sub query to find all the book name and author name whose publication is �shaja prakashan�.
--lets say shaja only
insert into "BookList" values('B015','Economics','shaja','E103','S001');
insert into "Book" values('B015','Health','Laxmi',2000);
select "Book"."Bname","Author" from "Book" where "Book"."Bid" in (select "BookList"."Bid" from "BookList" where publication ='shaja')

--18. Find all the students name and batch who have issued the book from library in january 2nd 2022. Use sub
--query.

select * from "BookIssue";
insert into "BookIssue" values('E108','S999','Account','2022-01-02','B003');
select * from "Student";
insert into "Student" VALUES('S999','Kristal','2078','T009');
select "Name","Batch" from "Student" where "Student"."SID" in (select "BookIssue"."Sid" from "BookIssue" where "DateofIssue" ='2022-01-02');

--19. Use a sub query to display the name of teachers who have issued the book
select "Name" from "Teacher" where "TID" in(select "EID" from "Employee" where "EID" in (select "EID" from "BookIssue"));

--20. Use a sub query to display the name of teachers who have issued the book named �C�.
insert into "BookIssue" values('T002','S002','C','2021-01-04','B003');
select "Name" from "Teacher" where "TID" in(select "EID" from "Employee" where 	"Eid" in (select "Eid" from "BookIssue" where "Bname"='C'));