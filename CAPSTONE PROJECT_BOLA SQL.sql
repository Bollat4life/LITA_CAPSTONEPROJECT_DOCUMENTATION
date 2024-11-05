CREATE DATABASE CAPSTONEPROJECT_BOLA

SELECT *FROM [dbo].[CAPSTONE PROJECT]

------Retriving the taotal sales for each categories-----
select product, sum(Quantity) as Total_sales
from [dbo].[CAPSTONE PROJECT]
group by product;

----Number of Sales transactions per Region---
Select Region,count(*) as Total_Transactions
from [dbo].[CAPSTONE PROJECT]
group by region;

---the highest selling product by total sales---
select top 1 Product, sum(Quantity) as Sales_Unitprices
from [dbo].[CAPSTONE PROJECT]
group by product;

---Total Revenue per Product-----
Select product, sum(Quantity * UnitPrice) as Total_Sales
from [dbo].[CAPSTONE PROJECT]
group by product
Order by Total_Sales Desc;

----Monthly Sales Total for the Current Year ------
SELECT  month(OrderDate) as month, sum(Quantity * unitprice) AS Monthlysales
FROM [dbo].[CAPSTONE PROJECT]
where YEAR(OrderDate) = year(GETDATE())
GROUP BY MONTH(OrderDate)
Order by MONTH;

------Top 5 Customer by Total Purchase--------

----find the top 5 customers by total purchase amount---
SELECT top 5  customer_id, SUM(Quantity * UnitPrice) AS TotalPurchaseAmount
FROM [dbo].[CAPSTONE PROJECT]
GROUP BY Customer_id
ORDER BY TotalPurchaseAmount DESC

----The percentage of total sales contributed by each region---
SELECT Region, sum(Quantity*UnitPrice) AS Totalsales,
sum(Quantity * Unitprice) * 1.0/ (select SUM(Quantity*Unitprice)
FROM [dbo].[CAPSTONE PROJECT] *100
as percentageofTotalsales
from [dbo].[CAPSTONE PROJECT]
Group by Region; 

----Product with no Sales in the last quarter-----
select distinct PRODUCT, orderid, quantity
From [dbo].[CAPSTONE PROJECT]
where product NOT IN
(select distinct product 
from [dbo].[CAPSTONE PROJECT]
where OrderDate between '2024-07-01' and '2024-09-30' 
)

