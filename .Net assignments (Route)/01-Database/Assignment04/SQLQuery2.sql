---------------------- (Part 1) -------------------
use ITI
--(1)
insert into employee
values 
('manager1', null),
('manager2', null),

insert into sales_office
values
('nasr city', 0) --Manager 1
('elshrouk', 1) --Manager 2

--(2.1)
insert into student
values (1000, 'Yousef', 'Sameh', 'Ain shams', 22, 30, null)
---------------------------------------
--(2.2)
insert into Instructor
values (150, 'magdy', 'prof', 4000, 30)
---------------------------------------
--(2.3)
update Instructor
set Salary += 0.2 * Salary
---------------------- (Part 2) -------------------
use MyCompany
--(1)
select *
from employee
--(2)
select Fname, Lname, Salary , Dno
from employee
--(3)
select Pname, Plocation, Dnum
from Project
--(4)
select Fname + ' ' + Lname [Full name], salary + salary * 12 * 0.1 [ANNUAL COMM] 
from Employee
--(5)
select SSN, Fname + ' ' + Lname
from Employee
where salary > 1000
--(6)
select SSN, Fname + ' ' + Lname
from Employee
where salary * 12 > 10000
--(7)
select Fname + ' ' + Lname, Salary
from Employee
where Sex = 'F'
--(8)
select Dnum, Dname
from Departments
where MGRSSN = 968574
--(9)
select Pnumber, Pname, Plocation
from Project
where Dnum = 10
---------------------- (Part 3) -------------------
use ITI
--(1)
select distinct Ins_Name
from Instructor
--(2)
select Ins_Name , Dept_Name
from Instructor left outer join Department
on Instructor.Dept_Id = Department.Dept_Id
--(3)
select St_Fname + ' ' + St_Lname , Crs_Name
from Student inner join Stud_Course
on Student.St_Id = Stud_Course.St_Id
inner join Course
on Course.Crs_Id = Stud_Course.Crs_Id
where Stud_Course.Grade is not null
----------- Bouns ------------
-- @@AnyExpression --> '@@' donates global variables in SQL Server.
select @@VERSION --> Displays the version of Microsoft SQL Server.
select @@SERVERNAME --> Displays the server name that currently in use.
---------------------- (Part 4) -------------------
use MyCompany
-- (1)
select D.Dnum, D.Dname, E.Fname + ' ' + E.Lname [Full Name]
from Departments D inner join Employee E
on D.MGRSSN = E.SSN
-- (2)
select D.Dname, P.Pname
from Departments D inner join Project P
on D.Dnum = P.Dnum
-- (3)
select D.* , E.Fname + ' ' + E.Lname [Employee Name]
from Employee E inner join Dependent D
on E.SSN = D.ESSN
-- (4)
select P.Pnumber, P.Pname , P.Plocation
from Project P
where P.City in ('Cairo', 'Alex')
-- (5)
select *
from Project P
where P.Pname like 'a%'
-- (6)
select *
from Employee E
where E.Dno = 30 and E.Salary between 1000 and 2000
-- (7)
select E.Fname + ' ' + E.Lname [Full Name]
from Employee E inner join Works_for W
on E.SSN = W.ESSn
inner join Project P
on P.Pnumber = W.Pno
where E.Dno = 10 and P.Pname = 'AL Rabwah' and W.Hours >= 10
-- (8)
select E.Fname + ' ' + E.Lname [Full Name], P.Pname
from Employee E inner join Works_for W
on E.SSN = W.ESSn  
inner join Project P
on P.Pnumber = W.Pno
order by P.Pname
-- (9)
select P.Pname, D.Dname, E.Lname, E.Address, E.Bdate
from Departments D inner join Employee E
on D.MGRSSN = E.SSN 
inner join Project P
on P.Dnum = D.Dnum
where P.City = 'Cairo'
