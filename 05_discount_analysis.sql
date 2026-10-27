USE RetailAnalytics;
GO

SELECT
    CASE
        WHEN Discount = 0 THEN '0% - No discount'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE 'Above 30%'
    END AS DiscountBand,
    COUNT(*) AS OrderLines,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    CAST(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10, 2)
    ) AS ProfitMarginPct,
    AVG(Profit) AS AvgProfitPerLine
FROM dbo.Superstore
WHERE Profit IS NOT NULL
GROUP BY
    CASE
        WHEN Discount = 0 THEN '0% - No discount'
        WHEN Discount <= 0.10 THEN '1-10%'
        WHEN Discount <= 0.20 THEN '11-20%'
        WHEN Discount <= 0.30 THEN '21-30%'
        ELSE 'Above 30%'
    END
ORDER BY MIN(Discount);
GO