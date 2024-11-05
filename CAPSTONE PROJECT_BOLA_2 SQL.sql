Create DATABASE CAPSTONEPROJECT_BOLA_2

Select *from [dbo].[CAPSTONEPROJECT _BOLA_2]

-----Total Number of Customers from each Region------
SELECT Region, COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]
GROUP BY Region;

-----The most popular Subscription Type by Number of Customer------
SELECT SubscriptionType, COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]
GROUP BY SubscriptionType
ORDER BY TotalCustomers DESC

------Total customers who canceled their subscription within 6 months-----
SELECT CustomerID, CustomerName, SubscriptionStart, SubscriptionEnd
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]
WHERE Canceled = 1
  AND DATEDIFF(DAY, SubscriptionStart, GETDATE()) <= 180;


-----Average Subscription Duration for all customers-----
SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDuration
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]
Group  by SubscriptionType;

-------Customers with Subscriptions not longer than 12 months------
SELECT CustomerID, CustomerName, SubscriptionStart, SubscriptionEnd
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 12;

-------Total revenue by subscription type.------
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]
GROUP BY SubscriptionType;

-------Top 3 Regions by Subscription cancellations..------
SELECT Region, COUNT(*) AS Cancellations
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]
WHERE Canceled = 1
GROUP BY Region
ORDER BY Cancellations DESC

-----The Total Number of active and canceled Subscriptions-------
SELECT 
    SUM(CASE WHEN Canceled = 1 THEN 1 ELSE 0 END) AS TotalCanceled,
    SUM(CASE WHEN Canceled = 0 THEN 1 ELSE 0 END) AS TotalActive
FROM [dbo].[CAPSTONEPROJECT _BOLA_2]

