IF DB_ID('RetailAnalytics') IS NULL
BEGIN
    CREATE DATABASE RetailAnalytics;
END;
GO

USE RetailAnalytics;
GO

SELECT DB_NAME() AS CurrentDatabase;
GO