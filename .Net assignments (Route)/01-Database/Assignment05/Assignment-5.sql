-------------------------- Part (1) -----------------------------
use ITI
--(1)
select count(St_Age)
from Student
--(2)
select Top_Name , count(Crs_Id) [number of courses]
from Topic inner join Course
on Course.Top_Id = Topic.Top_Id
group by Top_Name
--(3)
select S.St_Fname, SS.*
from Student S inner join Student SS
on S.St_super = SS.St_Id
--(4)
select S.St_Id[Student ID], [Student Full Name] = isnull(S.St_Fname, 'NoFname') + ' ' + isnull(S.St_Lname, 'NoLname'), D.Dept_Name[Department name]
from Student S inner join Department D
on S.Dept_Id = D.Dept_Id
--(5)
select Ins_Name, isnull(cast(Salary as varchar(max)), '0000') [Salary]
from Instructor
--(6)
select SS.St_Fname [Supervisor name], count(S.St_Id) [Number of student]
from Student S inner join Student SS
on S.St_super = SS.St_Id
group by SS.St_Fname
--(7)
select max(Salary) [Max salary], min(Salary)[Min salary]
from Instructor
--(8)
select avg(Salary) [Avg salary]
from Instructor
--(9)
select Ins_Name
from Instructor
where Salary < (select avg(Salary) from Instructor)
--(10)
select D.Dept_Name
from Department D inner join Instructor I
on D.Dept_Id = I.Dept_Id
where I.Salary = (select min(Salary) from Instructor)

-------------------------- Part (2) -----------------------------
use Mycompany
--(1)
select P.Pname, sum(W.Hours) [Total worked hours]
from Project P inner join Works_for W
on P.Pnumber = W.Pno
group by P.Pname
--(2)
select D.Dname, min(E.Salary) [Min salary], max(E.Salary) [Max salary], avg(E.Salary)[Avg salary]
from Departments D inner join Employee E
on D.Dnum = E.Dno
group by D.Dname
--(3)
select D.Dname, E.*, P.Pname
from Employee E inner join Departments D
on E.Dno = D.Dnum inner join Project P
on D.Dnum = P.Dnum inner join Works_for W
on W.Pno = P.Pnumber and E.SSN = W.ESSn
order by D.Dname, E.Lname, E.Fname
--(4)
update Employee
set Salary += Salary * 0.3
from Employee E inner join Works_for W
on E.SSN = W.ESSn inner join Project P
on P.Pnumber = W.Pno
where P.Pname = 'Al Rabwah'
--//\\//\\//\\//\\//\\//\\//\\//\\--
--(1)
insert into Departments
values('DEPT IT' , 100, 112233 , '1-11-2006')
--(2)
--(a)
update Departments
set MGRSSN = null
where MGRSSN = 968574

update Departments
set MGRSSN = 968574
where Dnum = 100
--(b)
--Step 1: insert myself
insert into Employee
values('Yousef', 'Sameh', 102672, '9-25-2001', 'Ain shams', 'M', 1000000, null, null)
--Step 2: Set myself as the manager of department 20
update Departments
set MGRSSN = 102672
where Dnum = 20
--(c)
update Employee
set Superssn = 102672
where SSN = 102660 -- There is no employee with the given SSN (:
--(3)
delete from Dependent
where ESSN = 223344

update Departments
set MGRSSN = 102672
where MGRSSN = 223344

update Employee
set Superssn = 102672
where Superssn = 223344

delete from Works_for
where ESSn = 223344

delete from Employee
where SSN = 223344
-------------------------- Part (3) -----------------------------
--(1)
select [Full name] = E.Fname + E.Lname
from Employee E inner join Departments D
on E.Dno = D.Dnum inner join Works_for W
on W.ESSn = E.SSN inner join Project P
on P.Pnumber = W.Pno and D.Dnum = P.Dnum
where W.Hours >= 10 and P.Pname = 'AL Rabwah' and D.Dnum = 10
--(2)
select [Full name] = E.Fname + ' '+ E.Lname , P.Pname
from Employee E inner join Works_for W
on E.SSN = W.ESSn inner join Project P
on P.Pnumber = W.Pno 
order by P.Pname
--(3)
select P.Pnumber, D.Dname, E.Lname, E.Address, E.Bdate
from Employee E inner join Departments D 
on D.MGRSSN = E.SSN inner join Project P
on P.Dnum = D.Dnum 
where P.City = 'Cairo'
--(4)
select D.*
from Departments D inner join Employee E
on E.Dno = D.Dnum
where E.SSN = (select min(SSN) from Employee)
--(5)
select distinct E.Lname --Get all managers
from Employee E inner join Departments D
on E.SSN = D.MGRSSN
where E.SSN not in (select E.SSN from Employee E inner join -- Get the managers that a have dependent
Departments D on E.SSN = D.MGRSSN
inner join Dependent DD on E.SSN = DD.ESSN)
--(6)
select D.Dnum, D.Dname , count(E.SSN) [Number of employees]
from Departments D inner join Employee E
on E.Dno = D.Dnum
group by D.Dnum , D.Dname
having avg(Salary) < (select avg(Salary) from Employee)
--(7)
--Store the maximum salary to prevent multiple scans
declare @max_salary int = (select max(Salary) from Employee) 
select max(salary) [Second maximum], @max_salary [First maximim]
from Employee
where Salary < @max_salary