USE RetailAnalytics;
GO

SELECT
    COUNT(*) AS TotalRows,
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    COUNT(DISTINCT Customer_ID) AS TotalCustomers,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    CAST(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10, 2)
    ) AS ProfitMarginPct,
    SUM(Quantity) AS UnitsSold,
    AVG(Discount) AS AverageDiscount
FROM dbo.Superstore;
GO