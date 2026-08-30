
CREATE VIEW VW_CustomerSalesFeatures AS
    
    WITH CutOffs AS (
        SELECT CAST('2011-06-01' AS DATE) AS CutOffDate
        UNION ALL SELECT '2011-07-01'
        UNION ALL SELECT '2011-08-01'
        UNION ALL SELECT '2011-09-01'
        UNION ALL SELECT '2011-10-01'
    ),
    CustomersCutOffs AS (
        SELECT c.CustomerID, co.CutOffDate
        FROM DBO.Customers AS c
        CROSS JOIN CutOffs AS co
    ),
    CustomerFeatures AS (
        SELECT
            cc.CustomerID,
            cc.CutOffDate,
            SUM(inv.Revenue) AS TotalRevenue,
            COUNT(DISTINCT i.InvoiceNo) AS NumberOfOrders,
            SUM(inv.Quantity) AS TotalQuantity,
            SUM(inv.Revenue) / NULLIF(COUNT(DISTINCT i.InvoiceNo), 0) AS AverageOrderValue,
            CAST(SUM(inv.Quantity) AS DECIMAL(10,2))
                / NULLIF(COUNT(DISTINCT i.InvoiceNo), 0) AS AverageQuantityPerOrder,
            DATEDIFF(DAY, MAX(i.InvoiceDate), cc.CutOffDate) AS Recency,
            DATEDIFF(DAY, MIN(i.InvoiceDate), cc.CutOffDate) AS CustomerLifetimeDays
        FROM CustomersCutOffs AS cc
        JOIN Invoices AS i
            ON i.CustomerID = cc.CustomerID
            AND i.InvoiceDate < cc.CutOffDate
        JOIN InvoiceItems AS inv
            ON i.InvoiceNo = inv.InvoiceNo

        GROUP BY cc.CustomerID, cc.CutOffDate
    ),
    FutureSales AS (
        SELECT
            co.CustomerID,
            co.CutOffDate,
            SUM(inv.Revenue) AS FutureRevenue
        FROM CustomersCutOffs AS co
        JOIN Invoices AS i
            ON co.CustomerID = i.CustomerID
            AND i.InvoiceDate >= co.CutOffDate
            AND i.InvoiceDate < DATEADD(MONTH, 1, co.CutOffDate)
        JOIN InvoiceItems AS inv
            ON i.InvoiceNo = inv.InvoiceNo
        GROUP BY co.CustomerID, co.CutOffDate
    ),
    Dataset AS (
        SELECT
            cf.*,
            COALESCE(fs.FutureRevenue, 0) AS FutureRevenue
        FROM CustomerFeatures AS cf
        LEFT JOIN FutureSales AS fs
            ON cf.CustomerID = fs.CustomerID
            AND cf.CutOffDate = fs.CutOffDate
    )
    SELECT *
    FROM Dataset

SELECT *
FROM VW_CustomerSalesFeatures