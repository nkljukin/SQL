
select CategoryName, sum(t3.UnitPrice*t3.Quantity*(1-t3.Discount)) as Revenue
from Products as t1 inner join Categories as t2 on t1.CategoryID=t2.CategoryID
                    inner join [Order Details] as t3 on t1.ProductID=t3.ProductID
group by CategoryName
order by sum(t3.UnitPrice*t3.Quantity*(1-t3.Discount)) desc

select t1.OrderDate, t1.EmployeeID, t1.CustomerID, t2.EmployeeID, t2.FirstName, t2.LastName, t3.CustomerID, t3.ContactName
from Orders as t1 inner join Employees as t2 on t1.EmployeeID=t2.EmployeeID
                  inner join Customers as t3 on t1.CustomerID=t3.CustomerID
where t3.ContactName = 'Simon Crowther' and t1.OrderDate='1998-04-29 00:00:00.000'

SELECT ShipCity, count(*) as cnt
from Orders
where OrderDate between '1997-01-01 00:00:00.000' and '1997-12-31 00:00:00.000'
group by ShipCity
having count(*) > 5

select count(*)
from (SELECT ShipCity, count(*) as cnt
        from Orders
        where OrderDate between '1997-01-01 00:00:00.000' and '1997-12-31 00:00:00.000'
        group by ShipCity
        having count(*) > 5) as table1

select ContactName, City, Region, case when Region is null then 'not defined' else region end as NR
from Customers



select ContactName, Country, case when Country in ('Argentina', 'Brazil') then 'South America'
                                  when Country in ('Canada') then 'North America' end as Continent
from Customers
where Country in ('Argentina', 'Brazil', 'Canada')

select Continent, count(ContactName)
from
    (
    select ContactName, Country, case when Country in ('Argentina', 'Brazil') then 'South America'
                                      when Country in ('Canada') then 'North America' end as Continent
    from Customers
    where Country in ('Argentina', 'Brazil', 'Canada')
    ) as table1
group by Continent

select orderid, 
sum(UnitPrice*Quantity*(1-Discount)) as Revenue, 
case when sum(UnitPrice*Quantity*(1-Discount)) < 1000 then '0-999'
         when sum(UnitPrice*Quantity*(1-Discount)) < 5000 then '1000-4999'
         else '5000 and >' end as revenue_group
from [Order Details] 
group by orderid

select orderid, 
sum(UnitPrice*Quantity*(1-Discount)) as Revenue, 
case when sum(UnitPrice*Quantity*(1-Discount)) between 1 and 999 then '0-999'
         when sum(UnitPrice*Quantity*(1-Discount)) between 1000 and 4999 then '1000-4999'
         when sum(UnitPrice*Quantity*(1-Discount)) >=5000 then '5000 and >' end as revenue_group
from [Order Details] 
group by orderid

select count(LastName)
from 
    (select FirstName, LastName, Country, Region, case when Region is null then 'not defined' end as Reg_def
    from Employees
    ) as table1
where Reg_def = 'not defined'

select Gender, count(*)
from (
      select FirstName, LastName, TitleOfCourtesy, case when TitleOfCourtesy in ('Ms.', 'Mrs.') then 'women'
                                                          when TitleOfCourtesy in ('Mr.', 'Dr.') then 'men' end as Gender
      from Employees
     ) as table1
group by Gender

select count(*)
from 
    (
    select ProductName, UnitPrice, case when UnitPrice between 0 and 9.99 then '0-9.99'
                                        when UnitPrice between 10 and 29.99 then '10-29.99'
                                        when UnitPrice between 30 and 49.99 then '30-49.99'
                                        when UnitPrice >= 50 then '50+' end as Price_range
    from Products
    ) as table1
where Price_range = '50+'