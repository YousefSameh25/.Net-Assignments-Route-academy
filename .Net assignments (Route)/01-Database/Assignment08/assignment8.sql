use iti
---------------- part (1) ----------------
-- (1)
create or alter proc GetStudentsPerDepartment
as 
	select D.Dept_Name, count(S.St_Id) [Number of students]
	from Department D inner join Student S
	on D.Dept_Id = S.Dept_Id
	group by D.Dept_Name

GetStudentsPerDepartment
-- (2)
use MyCompany
create or alter proc task2
as 
	declare @cnt int
	select @cnt = count(E.SSN) 
	from Employee E inner join Works_for W on E.SSN = W.ESSn 
	inner join Project P on P.Pnumber = W.Pno
	where P.Pnumber = 100

	if @cnt >= 3
		print ('The number of employees in the project 100 is 3 or more')
	else
		 begin
			print ('The following employees work for the project 100')
			select E.Fname, E.Lname
			from Employee E inner join Works_for W on E.SSN = W.ESSn 
			inner join Project P on P.Pnumber = W.Pno
			where P.Pnumber = 100
		 end

task2

-- (3)
create or alter proc updateEmployess @EmpNewId int, @EmpOldId int, @ProId int 
as
	-- Handle every table has @EmpOldId as a FK on it.
	delete from Dependent
	where ESSN = @EmpOldId

	-- handle the MGRSSN if the old employee was a manager
	update Departments
	set MGRSSN = null
	where MGRSSN = @EmpOldId

	-- Remove the old employee
	delete from Employee
	where SSN = @EmpOldId

	-- Insert the new employee
	insert into Employee (SSN, Fname, Lname)
	values (@EmpNewId, 'Yousef', 'Sameh')

	-- Update the project with the new employee number
    update Works_for
	set ESSn = @EmpNewId
	where ESSn = @EmpOldId and Pno = @ProId

-- (4)
use SD32-Company

create table BudgetUpdateHistory(
ProjectNo  int,
UserName  varchar(max),
ModifiedDate  date,
Budget_Old int,
Budget_New  int
)

create or alter Trigger HR.BudgetHistory
on HR.project
after update
as
	declare @OldBudget int, @NewBudget int
	select @OldBudget = Budget from deleted 
	select @NewBudget = Budget from inserted 
	if @OldBudget != @NewBudget
	begin
		-- Get Project number
		declare @pno int
		select @pno = ProjectNo from deleted
		-- Insert the record 
		insert into dbo.BudgetUpdateHistory
		values (@pno, SUSER_NAME(), getdate(), @OldBudget, @NewBudget)
	 end

update HR.Project
set Budget = 333
where ProjectNo = 1

select * from BudgetUpdateHistory

---------------- part (2) ----------------
-- (1)
create or alter proc RangeSum @Fnum int, @Snum int
as 
	-- Handle if the range is not in the valid form ex(10, 5) so swap them (5, 10)
	if @Fnum > @Snum
	begin
		declare @temp int = @Fnum
		set @Fnum = @Snum
		set @Snum = @temp
	end

	-- Get the sum of a range from 1 to @Fnum-1
	set @Fnum -= 1
	declare @sumL int = @Fnum * (@Fnum + 1) / 2
	-- Get the sum of a range from 1 to @Snum
	declare @sumR int = @Snum * (@Snum + 1) / 2
	-- Get the difference between the two ranges
	print(@sumR - @sumL)

RangeSum 2, 5  -- 2 + 3 + 4 + 5 = 14
RangeSum 5, 2  -- 2 + 3 + 4 + 5 = 14


-- (2)
create or alter proc CircleArea @R int
as
	print(pi() * power(@R, 2))

CircleArea 5
CircleArea 2

-- (3)
create or alter proc AgeCategory @Age int
as
	if @Age < 18
		print('Child')
	else if @Age >= 18 and @Age < 60
		print('Adult')
	else 
		print('Senior')

AgeCategory 17
AgeCategory 50
AgeCategory 80

-- (4)
create or alter proc magic @numbers varchar(max)
as
	set @numbers += ','
	declare @sum int = 0, @numberOfnumbers int = 0, @i int = 1, @max int = -1000000000, @min int = 1000000000
	declare @tempNum varchar(max) = '', @curChar char(1)
	while @i <= len(@numbers)
	begin
		set @curChar = SUBSTRING(@numbers, @i, 1)
		if @curChar = ','
		begin
			declare @CurNumInt int = cast(@tempNum as int)
			set @sum += @CurNumInt
			if @CurNumInt > @max
				set @max = @CurNumInt
			if @CurNumInt < @min
				set @min = @CurNumInt
			set @tempNum = ''
			set @numberOfnumbers += 1
		end
		else if @curChar != ' '
			set @tempNum += @curChar
		set @i += 1
	end
	print('Avg = ' + cast((@sum / @numberOfnumbers) as varchar(max)))
	print('Maximum number = ' + cast(@max as varchar(max)))
	print('Minimum number = ' + cast(@min as varchar(max)))

magic '5, 10, 15, 20, 25'

---------------- part (3) ----------------
-- (1)
create table Department
(
	DeptNo varchar(100) primary key,
	DeptName varchar(max),
	Location varchar(max)
)
insert into Department
values('d1', 'Research' , 'NY'),
('d2', 'Accounting', 'DS'),
('d3', 'Marketing', 'KW')


create table Employee
(
	EmpNo int primary key,
	EmpFname varchar(max) not null,
	EmpLname varchar(max) not null,
	DeptNo varchar(100) foreign key references Department(DeptNo),
	Salary int unique
)

insert into Employee
values(25348 , 'Mathew', 'Smith' , 'd3' ,2500),
(10102 , 'Ann', 'Jones' , 'd3' , 3000),
(18316 , 'John', 'Barrymore' , 'd1' , 2400),
(29346 , 'James', 'James' , 'd2' , 2800),
(9031 , 'Lisa', 'Bertoni' , 'd2' , 4000),
(2581 , 'Elisa', 'Hansel' , 'd2' , 3600),
(28559 , 'Sybl', 'Moser' , 'd1' , 2900)

insert into Project
values('p1' , 'Apollo', 120000),
('p2', 'Gemini' , 95000),
('p3', 'Mercury' ,185600)

insert into Works_on
values (10102, 'p1', 'Analyst',	'2006.10.1'),
(10102,	'p3' ,'Manager'	, '2012.1.1'),
(25348,	'p2' ,'Clerk',	'2007.2.15'),
(18316	,'p2', NULL , '2007.6.1'),
(29346,	'p2', NULL , '2006.12.15'),
(2581,	'p3', 'Analyst', '2007.10.15'),
(9031,	'p1', 'Manager', '2007.4.15'),
(28559,	'p1', NULL,	'2007.8.1'),
(28559,	'p2', 'Clerk' , '2012.2.1'),
(9031,	'p3', 'Clerk' , '2006.11.15'),
(29346,	'p1' ,'Clerk' , '2007.1.4')


-- Testing Referential Integrity
-- (1)
insert into Works_on (EmpNo)
values(1111) -- Invalid as ProjectNo can not accept null

-- (2)
update Works_on
set EmpNo = 11111 
where EmpNo = 10102  -- Invalid as 10102 stored in Works_on table as a FK 
                     -- and there is no 11111 as a PK in Employee table

update Employee
set EmpNo = 11111 
where EmpNo = 10102 -- Invalid as 10102 is stored as FK in Works_on table

delete from Employee
where EmpNo = 10102 -- Invalid as 10102 is stored as FK in Works_on table

-- Table Modification
alter table Employee
add TelephoneNumber varchar(max)

alter table Employee
drop column TelephoneNumber

-- (2)
-- (a) --
create schema Company 

alter schema Company
transfer Department

alter schema Company
transfer Project

-- (b) --
create schema HumanResource 

alter schema HumanResource
transfer  Employee 

-- (3)
update Company.Project
set Budget += Budget * 0.3
where ProjectNo = (select W.ProjectNo from  Works_on W
	 where W.Job = 'Manager' and W.EmpNo = 10102) 

-- (4)
update Company.Department
set DeptName = 'Sales'
where DeptNo = (select DeptNo from  HumanResource.Employee E 
				where E.EmpFname = 'James')

-- (5)
update Works_on
set Enter_Date = '2007.12.12'
where Works_on.ProjectNo = 'p1' and Works_on.EmpNo in 
(select E.EmpNo
from HumanResource.Employee E  inner join Company.Department D
on E.DeptNo = D.DeptNo 
where D.DeptName = 'Sales')

-- (6)

delete from works_on 
where works_on.EmpNo in 
(select E.EmpNo
from HumanResource.Employee E  inner join Company.Department D
on E.DeptNo = D.DeptNo 
where D.Location = 'KW')


---------------- part (4) ----------------
use iti
--- (1)
create or alter trigger Trig_PreventInsertIntoDept
on Department
instead of insert
as
	print('You can not insert a new record into Department table')

-- (2)
create table StudentAudit (
	ServerUserName varchar(max),
	Date date,
	Note varchar(max)
)

-- (3)
create or alter trigger Trig_AfterInsertIntoStud
on Student
after insert
as
	declare @key int = (select St_Id from inserted)
	insert into StudentAudit
	values (SUSER_NAME(), getdate(), suser_name() + ' ' + 
	'Insert New Row with Key = ' + cast(@key as varchar(max)) + ' in table student')


-- (4)
create or alter trigger Trig_InsteadOfDeleteFromStu
on Student
instead of delete
as
	declare @key int = (select St_Id from deleted)
	insert into StudentAudit
	values (SUSER_NAME(), getdate(), suser_name() + ' ' + 
	'try to delete Row with id = ' + cast(@key as varchar(max)))


-- (5)
create or alter trigger Trig_InsteadOfInsertIntostuExceptMarch
on Student
instead of insert
as
	if format (getdate(), 'MMMM') != 'March'
		insert into Student
		select * from inserted

-- (6)

use SD32-Company
create schema B

create table B.BudgetUpdateHistory(
ProjectNo  int,
UserName  varchar(max),
ModifiedDate  date,
Budget_Old int,
Budget_New  int
)

create or alter Trigger HR.BudgetHistory
on HR.project
after update
as
	declare @OldBudget int, @NewBudget int
	select @OldBudget = Budget from deleted 
	select @NewBudget = Budget from inserted 
	if @OldBudget != @NewBudget
	begin
		-- Get Project number
		declare @pno int
		select @pno = ProjectNo from deleted
		-- Insert the record 
		insert into B.BudgetUpdateHistory
		values (@pno, SUSER_NAME(), getdate(), @OldBudget, @NewBudget)
	 end

update HR.Project
set Budget = 333
where ProjectNo = 1

select * from BudgetUpdateHistory

---------------- part (5) ----------------
use ITI

-- (1)
create clustered index Idx
on Department(Manager_hiredate) --Invalid as the table can not has more than 1 clustered index

-- (2)
create unique index Idx
on student(st_age) -- Invalid as st_age has duplicated values