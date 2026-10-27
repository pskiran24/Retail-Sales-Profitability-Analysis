USE RetailAnalytics;
GO

SELECT
    Category,
    Sub_Category,
    COUNT(*) AS OrderLines,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    CAST(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10, 2)
    ) AS ProfitMarginPct,
    AVG(Discount) AS AverageDiscount
FROM dbo.Superstore
GROUP BY Category, Sub_Category
ORDER BY TotalProfit ASC;
GO