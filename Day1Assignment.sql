-- 1. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product as Pp
GO 

-- 2. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, excludes the rows where ListPrice is 0.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product as Pp WHERE ListPrice=0
GO 

--3 Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table where rows are NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product as Pp WHERE Color is NULL
GO 

-- 4. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table where rows are not NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product as Pp WHERE Color is not NULL
GO 

-- 5. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table where rows are not NULL for the column Color, and the column ListPrice has a value greater than zero.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product as Pp WHERE Color is not NULL and ListPrice > 0
GO 

-- 6. Write a query that concatenates the columns Name and Color from the Production.Product table by excluding the rows that are null for color.
Select Name + ' ' + Color [Name and Color]
from Production.Product where Color is not null
Go

-- 7. Write a query that generates the following result set  from Production.Product:
Select 'NAME: ' + Name + ' -- Color: ' + Color [Name and Color]
from Production.Product Where Name is not Null and Color is Not NULL
go
-- with numbering concatenated in result
Select concat(ROW_NUMBER() over (Order by Color),'. NAME: ',Name, ' -- Color: ',Color) as [Number, Name, and Color]
from Production.Product Where Name is not null
and Color is not null
go

-- 8. Write a query to retrieve the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500
-- Inclusive
select ProductID, Name
from Production.Product where ProductID between 400 and 500
go
-- Exclusive
select ProductID, Name
from Production.Product where ProductID>400 and ProductID<500
go
-- 9. Write a query to retrieve the columns  ProductID, Name and Color from the Production.Product table restricted to the colors black and blue
SELECT ProductID, Name, Color
from Production.Product where Color in ('black','blue')
go
-- 10. Write a query to get a result set on products that begins with the letter S. 
select *
from Production.Product where Name like 'S%'
go
-- 11. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column. 
select Name, ListPrice
from Production.Product where Name like 'Seat%' or Name like 'Short% L' or Name like 'Short%M'
order by Name asc
go
-- 12. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column. The products name should start with either 'A' or 'S'
select Name, ListPrice
from Production.Product where Name like 'A%' or Name like 'S%'
order by Name asc
go
-- 13. Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the letter K. After this zero or more letters can exists. Order the result set by the Name column.
-- Beginning with 'SPO' but not containing 'K' afterwards
select *
from Production.Product where Name like 'SPO%' and Name not like '%K%'
order by Name
GO
--Beginning with 'S', 'P', or 'O', but not containing 'K'  afterwards
select *
from Production.Product where (Name like 'S%' or Name like 'P%' or Name like 'O%') and Name not like '%K%'
order by Name
GO
-- 14. Write a query that retrieves unique colors from the table Production.Product. Order the results  in descending  manner
-- Displaying each color option that is present
select distinct(Color)
from Production.Product
order by Color desc
go
-- Displaying each color that appears once, i.e is unique
select Color as [Colors Appearing Only Once]
from (
    select Color
    from Production.Product
    group by Color
    having COUNT(*) = 1
) AS [subtable]
order by [Colors Appearing Only Once]
go
-- 15. Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.Product table. Format and sort so the result set accordingly to the following. We do not want any rows that are NULL.in any of the two columns in the result.

-- Selecting those ProductSubcategoryID, Color combinations that only appear once within the dataset, and are not null in either column
-- Method 1
select ProductSubcategoryID, Color
from (
    select Color, ProductSubcategoryID
    from Production.Product
    where Color is not Null and ProductSubcategoryID is not Null
    group by Color, ProductSubcategoryID
    having COUNT(*) = 1
) AS [subtable]
go

-- Method 2
select ProductSubcategoryID, Color
from Production.Product
where Color is not Null and ProductSubcategoryID is not null
group by ProductSubcategoryID, Color
having count(*) = 1
go
-- Selecting each possible ProductSubcategoryID and Color combination without Null in either column regardless of how many times they occur
select Distinct ProductSubcategoryID, Color
from Production.Product
where ProductSubcategoryID is not null and Color is not null
go