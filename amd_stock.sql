SELECT COUNT (*) from amd_stock;
--11548 ROWS

SELECT 
    COUNT(*) as total_days,
    MIN(date) as first_date,
    MAX(date) as last_date,
    COUNT(DISTINCT date) as unique_dates
FROM amd_stock;
-- last_date 2026-01-07 unique_dates 11548


-- Total return calculation
WITH first_last AS (
    SELECT 
        (SELECT close FROM amd_stock ORDER BY date ASC LIMIT 1) as start_price,
        (SELECT close FROM amd_stock ORDER BY date DESC LIMIT 1) as current_price
)
SELECT 
    ROUND(start_price, 2) as starting_price,
    ROUND(current_price, 2) as current_price,
    ROUND(((current_price - start_price) / start_price * 100), 2) as total_return_pct
FROM first_last;

--starting_price 0.0 current_price 210.02 total_return_pct null

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


