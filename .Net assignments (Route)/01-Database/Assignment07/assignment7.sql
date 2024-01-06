--------------- Part(1) -------------------
use iti
---- (1) ----
create or alter function GetRange (@int1 int, @int2 int)
returns @T table (Number int)
as 
begin
	declare @start int = @int1
	declare @end int = @int2
	
	-- Check if the range is an invalid range ex(10 : 1)
	if @start > @end
	begin
		declare @tmp int = @end
		set @end = @start
		set @start = @tmp
	end

	while @start <= @end
		begin
			insert into @T (Number)
			values(@start)
			set @start += 1
		end
return
end
-- Tests
select * from GetRange(1, 10)
select * from GetRange(10, 1)

---- (2) ----
create or alter function GetDeptNameAndStuFullNameByStuId (@id int)
returns table
as
	return (
		select Dept_Name, [Full name] = concat (St_Fname, ' ' ,St_Lname)
		from Student S inner join Department D
		on S.Dept_Id = D.Dept_Id
		where S.St_Id = @id )

-- Tests
select * from GetDeptNameAndStuFullNameByStuId(1)
select * from GetDeptNameAndStuFullNameByStuId(10)

---- (3) ----
create or alter function GetmanagerData (@format int)
returns table
as  return (
	select Ins_Name, Dept_Name, CONVERT(VARCHAR, Manager_hiredate , @format) [Manager_hiredate]
	from Department D inner join Instructor I
	on D.Dept_Manager = I.Ins_Id
)

-- Tests
select * from GetmanagerData(120)
select * from GetmanagerData(101)

---- (4) ----
create or alter function GetStuData(@type varchar(max))
returns @T table (name varchar(max))
as 
begin
	if @type = 'first name'
		insert into @T
		select isnull(St_Fname, 'Not found')
		from Student
	else if  @type = 'last name'
		insert into @T
		select isnull(St_Lname, 'Not found')
		from Student
	else if  @type = 'full name'
		insert into @T
		select CONCAT(St_Fname , ' ' , St_Lname) 
		from Student
return 
end

-- Tests
select [First name] = name from GetStuData('First name')
select [Last name] = name from GetStuData('Last name')
select [Full name] = name from GetStuData('Full name')

---- (5) ----
use MyCompany
create or alter function GetEmployees(@ProjectId int)
returns table 
as 
return (
	select concat(E.Fname, ' ', E.Lname) [Full name]
	from Employee E inner join Works_for W
	on W.ESSn = E.SSN
	where W.Pno = @ProjectId
)

-- Tests
select * from GetEmployees(100)
select * from GetEmployees(700)


--------------- Part(2) -------------------
use iti
---- (1) ----
create or alter view StuDataView (Full_name, Course)
with encryption
as 
	select CONCAT(S.St_Fname, ' ' , S.St_Lname), C.Crs_Name
	from Student S inner join Stud_Course SC
	on S.St_Id = SC.St_Id inner join Course C
	on C.Crs_Id = SC.Crs_Id
	where SC.Grade > 50

---- (2) ----
create or alter view ManagerTopics
as
	select I.Ins_Name, T.Top_Name
	from Instructor I inner join Department D
	on I.Ins_Id = D.Dept_Manager inner join Ins_Course IC
	on IC.Ins_Id = I.Ins_Id inner join Course C
	on C.Crs_Id = IC.Crs_Id inner join Topic T
	on T.Top_Id = C.Top_Id

---- (3) ----
create schema schema1
create or alter view schema1.InsDept
WITH SCHEMABINDING
as 
	select I.Ins_Name, D.Dept_Name
	from dbo.Instructor I inner join dbo.Department D
	on I.Dept_Id = D.Dept_Id
	where D.Dept_Name in ('SD', 'Java')

-- Schema binding means when someone tries to modify the base table in such a way that
-- affects the view he can not unless he changed the stucture of the view 
-- this feature help us in maintain the integrity of dependent objects which are (table, view) in this case.

---- (4) ----
create or alter view V1
with encryption
as 
	select *
	from Student
	where St_Address in ('Alex', 'Cairo')

---- (5) ----
use MyCompany

create or alter view CountEmpInProjects
with encryption
as
	select P.Pname[Project name], count(E.SSN)[Number of employees]
	from Project P inner join Works_for W
	on P.Pname = W.Pno inner join Employee E
	on E.SSN = W.ESSn
	group by P.Pname

---------------------------------------------------------
use [SD32-Company]
---- (1) ----
create or alter view v_clerk
with encryption
as	
	select W.EmpNo, W.ProjectNo, W.Enter_Date
	from Works_on W
	where W.Job = 'Clerk'

---- (2) ----
create or alter view HR.v_without_budget
as 
	select ProjectNo, ProjectName
	from HR.Project

---- (3) ----
create or alter view v_count 
with encryption
as 
	select P.ProjectName, count(distinct W.Job) [Number of jobs]
	from Works_on W inner join HR.Project P
	on W.ProjectNo = P.ProjectNo
	group by P.ProjectName

	
---- (4) ----
create or alter view v_project_p2
with encryption 
as 
	select v.EmpNo, v.ProjectNo
	from v_clerk v
	where v.ProjectNo = 2
---- (5) ----
create or alter view HR.v_without_budget
as 
	select ProjectNo, ProjectName, Budget
	from HR.Project
	where ProjectNo in(1, 2)

---- (6) ----
drop view v_clerk
drop view v_count

---- (7) ----
create or alter view EmployeeDept
with encryption
as 
	select E.EmpNo, E.EmpLname
	from HR.Employee E inner join Department D
	on E.DeptNo = D.DeptNo
	where D.DeptNo = 2

---- (8) ----
create or alter view EmpJ
with encryption
as 
	select EmpLname
	from EmployeeDept
	where EmpLname like '%J%'

---- (9) ----
create or alter view v_dept
with encryption
as 
	select DeptNo, DeptName
	from Department

---- (10) ---- 
insert into v_dept
values (4, 'Development') --Already exists

---- (11) ----
create or alter view v_2006_check
with encryption
as
	select W.EmpNo, W.ProjectNo
	from Works_on W
	where year(W.Enter_Date) = 2006
