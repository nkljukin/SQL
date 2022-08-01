SELECT ProductName, UnitPrice, round(UnitPrice, 1), round(UnitPrice, 0)
from Products
where ProductName = 'Valkoinen suklaa'

select round(sum(UnitPrice*Quantity*(1-Discount)), 2)
from [Order Details]


select round(sum(UnitPrice*Quantity*(1-Discount)), 0)
from Orders as t1 inner join [Order Details] as t2 on t1.OrderID = t2.OrderID
where OrderDate between '1996-01-01 00:00:00.000' and '1996-12-31 00:00:00.000'

select
OrderDate,
day(OrderDate) as Day,
month(OrderDate) as Month,
year(OrderDate) as Year
from Orders

select GETDATE()+0.125

SELECT
datepart(year, getdate()+0.125),
datepart(quarter, getdate()+0.125),
datepart(month, getdate()+0.125),
datepart(week, getdate()+0.125),
datepart(day, getdate()+0.125),
datepart(hour, getdate()+0.125),
datepart(minute, getdate()+0.125)

SELECT
dateadd(year, 3, getdate()+0.125),
dateadd(month, 2, getdate()+0.125),
dateadd(day, -10, getdate()+0.125)

SELECT
DATEDIFF(year, getdate()+0.125, '2021-07-22'),
DATEDIFF(month, getdate()+0.125, '2021-07-22'),
DATEDIFF(day, getdate()+0.125, '2021-07-22')

select count(*)
from Orders
where datepart(year, OrderDate) = 1997 and datepart(quarter, OrderDate) = 4

select max(DATEDIFF(day, OrderDate, ShippedDate))
from Orders

SELECT CompanyName, lower(CompanyName), upper(CompanyName)
from Customers

SELECT UnitPrice, left(UnitPrice, 2), right(UnitPrice, 2)
from Products

SELECT ContactName, len(ContactName)
from Customers

SELECT LastName, FirstName, concat(LastName,' ',FirstName) as ContName
from Employees

select ContactTitle, replace(ContactTitle, 'Owner', 'Business Owner')
from Customers

SELECT ContactTitle, substring(ContactTitle, 12, 7)
from Customers
where ContactTitle = 'Accounting Manager'

SELECT count(*)
from Customers
where len(Country) > 10

select t2.CompanyName, count(*)
from Orders as t1 inner join Shippers as t2 on t1.ShipVia=t2.ShipperID
     
group by t2.CompanyName

SELECT DISTINCT ContactName, count(*)
from Orders as t1 inner join Customers as t2 on t1.CustomerID=t2.CustomerID
group by ContactName

SELECT DISTINCT ContactName, OrderID
from Orders as t1 inner join Customers as t2 on t1.CustomerID=t2.CustomerID
where Country='Spain'

SELECT DISTINCT ContactName
from  Customers 
where Country='Spain'

select  ShipCity, OrderDate
from Orders
where ShipCountry = 'UK' and (OrderDate between '1998-02-01 00:00:00.000' and '1998-02-28 00:00:00.000')




select Count(*)
from Customers
where ContactName like 'Mari%'

select max(len(ContactName))
from Customers

select distinct OrderID, sum(UnitPrice*Quantity*(1-Discount))
from [Order Details]
group by OrderID
having sum(UnitPrice*Quantity*(1-Discount)) = 2900
order by  sum(UnitPrice*Quantity*(1-Discount)) desc

select datepart(week, t1.OrderDate),  sum(t2.UnitPrice*t2.Quantity*(1-t2.Discount)) as week_sum
from Orders as t1 inner join [Order Details] as t2 on t1.OrderID = t2.OrderID
group by datepart(week, t1.OrderDate)


select datepart(week, t1.OrderDate),  sum(t2.UnitPrice*t2.Quantity*(1-t2.Discount)) as week_sum
from Orders as t1 inner join [Order Details] as t2 on t1.OrderID = t2.OrderID
where t1.OrderDate between '1998-01-01 00:00:00.000' and '1998-12-31 00:00:00.000'
group by datepart(week, t1.OrderDate)



select DATEPART(week, OrderDate) as Nweek, sum(UnitPrice*Quantity*(1-discount)) as profit, round(sum(UnitPrice*Quantity*(1-discount)), 0) as krugl
from [Order Details] t1 inner join Orders t2 on t1.OrderID = t2.OrderID
where OrderDate like '%1998%'
group by DATEPART(week, OrderDate)
order by sum(UnitPrice*Quantity*(1-discount)) desc





