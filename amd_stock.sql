SELECT COUNT (*) from amd_stock;
--11548 ROWS

SELECT 
    COUNT(*) as total_days,
    MIN(date) as first_date,
    MAX(date) as last_date,
    COUNT(DISTINCT date) as unique_dates
FROM amd_stock;
-- last_date 2026-01-07 unique_dates 11548


-- Top 10 best days
SELECT 
    date, 
    ROUND(close, 2) as price,
    ROUND(((close - open) / open * 100), 2) as daily_return_pct
FROM amd_stock
ORDER BY ((close - open) / open) DESC
LIMIT 10;

-- Top 10 worst days
SELECT 
    date, 
    ROUND(close, 2) as price,
    ROUND(((close - open) / open * 100), 2) as daily_return_pct
FROM amd_stock
ORDER BY ((close - open) / open) ASC
LIMIT 10;


SELECT 
    date,
    ROUND(open, 2) as open,
    ROUND(high, 2) as high,
    ROUND(low, 2) as low,
    ROUND(close, 2) as close,
    volume
FROM amd_stock
ORDER BY date;


--Checking for missing values 
SELECT
    COUNT(*) AS total_rows,
    COUNT(close) AS non_null_close_prices,
    COUNT(*) - COUNT(close) AS missing_close_prices
FROM amd_stock;

--Average closing price
SELECT
    close,
    AVG(close) AS avg_close_price_per_stock
FROM amd_stock
GROUP BY close
ORDER BY avg_close_price_per_stock DESC;

-- Check first few rows
SELECT * FROM amd_stock ORDER BY date ASC LIMIT 5;

-- Check last few rows 
SELECT * FROM amd_stock ORDER BY date DESC LIMIT 5;

-- Check for NULL values
SELECT 
    COUNT(*) as total_rows,
    COUNT(date) as date_count,
    COUNT(close) as close_count,
    COUNT(*) - COUNT(date) as null_dates,
    COUNT(*) - COUNT(close) as null_closes
FROM amd_stock;

-- Data types
SELECT typeof(date), typeof(close) FROM amd_stock LIMIT 1;

-- Start price
SELECT close FROM amd_stock ORDER BY date ASC LIMIT 1;

-- End price
SELECT close FROM amd_stock ORDER BY date DESC LIMIT 1;

-- Date range
SELECT 
    MIN(date) as start_date, 
    MAX(date) as end_date 
FROM amd_stock;

--Total return calculation
SELECT 
    ROUND((SELECT close FROM amd_stock ORDER BY date ASC LIMIT 1), 2) as start_price,
    ROUND((SELECT close FROM amd_stock ORDER BY date DESC LIMIT 1), 2) as end_price,
    ROUND((
        ((SELECT close FROM amd_stock ORDER BY date DESC LIMIT 1) - 
         (SELECT close FROM amd_stock ORDER BY date ASC LIMIT 1)) / 
        (SELECT close FROM amd_stock ORDER BY date ASC LIMIT 1) * 100
    ), 0) as total_return_pct;

-- Get start price
SELECT CAST(close AS REAL) as price 
FROM amd_stock 
WHERE close != 'close'
ORDER BY date ASC 
LIMIT 1;
--0.00

-- First non-zero close price
SELECT CAST(close AS REAL) as price, date
FROM amd_stock 
WHERE close != 'close' 
  AND CAST(close AS REAL) > 0
ORDER BY date ASC 
LIMIT 1;

-- Get end price
SELECT CAST(close AS REAL) as price 
FROM amd_stock 
WHERE close != 'close'
ORDER BY date DESC 
LIMIT 1;
--210.02


