--1. Sort the employee records in descending order.
select * from employee;

select * from employee order by Ename DESC;

--2. Display book name and publication name in ascending order sorted on the basis of book name.
select * from "BookList";
select Bname,publication from booklist order by "Bname";
--by default ascending order

--3. Display top three records from teacher relation.
select * from "Teacher";

select top 3 * from "Teacher";

--4. Display the sum of salaries of all employees
select * from "Employee";
select SUM(salary) as sum_salary
from "Employee";

--5. Display the minimum salary of employee
select MIN(salary) as min_salary
from "Employee";

--6. Display the average price of book written by same author.
select * from "Book";

select AVG(Price) as average_price,Author FROM
"Book"
GROUP BY "Author";

--7. Display publication name and number of books published by it from book list relation publication wise
select * from "BookList";
insert into "BookList" values ('B008','EXT','Asmita','E102','S003');
select COUNT(Bname) as count_bookName,Publication
from "BookList"
GROUP BY "Publication"; 

--8. Display the bid and bname of books whose price is greater than average prices of book.
select * from Book;
select AVG(Price) as average_price from book;

select * from "Book";

select * from "Book"
where "Price" >(select AVG(Price) as average_price from Book);

--9. Find the bid, bname and author in ascending order where author name is started by “E”
select Bid,Bname,Author from "Book"
where Author like 'E%'
order by Author asc;

--10. Find the teachers name and book taken by him. The teacher’s salary who takes the book should be the maximum salary

select * from teacher,employee,bookissue
where teacher."TID"=employee."Eid" and employee."Eid"=bookissue."Eid"
and salary=(select MAX(salary) as max_salary from employee);
SELECT * from "Employee";


--11. Find the authors name who have written more than one book
select * from "Book";
select Author, COUNT("Bname") as book_count
from "Book"
GROUP BY "Author"
HAVING COUNT("Bname") >1;