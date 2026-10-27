USE RetailAnalytics;
GO

SELECT
    Region,
    COUNT(DISTINCT Order_ID) AS TotalOrders,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    CAST(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10, 2)
    ) AS ProfitMarginPct
FROM dbo.Superstore
GROUP BY Region
ORDER BY TotalProfit DESC;
GO