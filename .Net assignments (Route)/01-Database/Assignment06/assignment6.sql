------------------- (Part 1) ------------------------
use iti
-- (1) --
select top(2)Salary
from Instructor
order by Salary desc
-- (2) --
select NT.Dept_Name, NT.Ins_Name
from (select Dept_Name , Ins_Name, row_number() over (partition by D.dept_id order by salary desc) as rn from Instructor I inner join Department D on I.Dept_Id = D.Dept_Id where Salary is not null) as NT
where NT.rn < 3
-- (3) --
select *
from (select *, row_number() over (partition by dept_id order by newid()) as rn from Student) as NT
where rn = 1

------------------- (Part 2) ------------------------
use AdventureWorks2012
-- (1) --
select SalesOrderID, ShipDate
from Sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'
-- (2) -- 
select ProductID, Name
from Production.Product
where StandardCost < 110
-- (3) --
select ProductID, Name
from Production.Product
where Weight is not null
-- (4) -- 
select *
from Production.Product
where Color in ('Silver', 'Black', 'Red')
-- (5) --
select name
from Production.Product
where name like 'B%'
-- (6) -- 
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select Description
from Production.ProductDescription
where Description like '%_%'
-- (7) --
select distinct HireDate
from HumanResources.Employee
where HireDate is not null
-- (8) --
select concat ('The ', Name, ' is only! ', cast (ListPrice as varchar(max)))
from Production.Product
where ListPrice between 100 and 120
order by ListPrice
------------------- (Part 3) ------------------------
use iti
-- (1) --
create or alter function GetMonthName (@date date)
returns varchar(max)
begin
	return datename(MONTH, @date)
end

select dbo.GetMonthName (getdate())

