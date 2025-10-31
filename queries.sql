-- STOCK MARKET SEASONALITY & PERFORMANCE ANALYSIS
-- Author: Dominique DaSilva
-- Tool: Google BigQuery
-- Description: SQL analysis exploring calendar-month performance patterns in the stock market

------------------------------------------------------------
-- STEP 1: Create a monthly close dataset
------------------------------------------------------------
CREATE OR REPLACE TABLE `domo-project-469513.stock_seasonality.monthly_returns` AS 
WITH month_end AS (
    SELECT
      Symbol,
      DATE_TRUNC(Date, MONTH) AS month_start,
      MAX(Date) AS month_end
    FROM `domo-project-469513.stock_seasonality.daily_prices`
    GROUP BY Symbol, month_start
),
month_close AS (
  SELECT
    d.Symbol,
    m.month_end AS Date,
    d.Close
  FROM month_end m
  JOIN `domo-project-469513.stock_seasonality.daily_prices` d 
  ON d.Symbol = m.Symbol AND d.Date = m.month_end
),
returns AS (
  SELECT
    Symbol,
    Date,
    Close,
    ROUND((Close - LAG(Close) OVER (PARTITION BY Symbol ORDER BY Date))
          / LAG(Close) OVER (PARTITION BY Symbol ORDER BY Date) * 100, 2) AS monthly_return
  FROM month_close
)
SELECT 
  Symbol,
  Date,
  EXTRACT(YEAR FROM Date) AS year,
  FORMAT_DATE('%b', Date) AS month,
  monthly_return
FROM returns
WHERE monthly_return IS NOT NULL
ORDER BY Symbol, Date;

------------------------------------------------------------
-- STEP 2: Aggregate monthly averages across all years
------------------------------------------------------------
SELECT 
  month,
  ROUND(AVG(monthly_return), 2) AS avg_monthly_return
FROM `domo-project-469513.stock_seasonality.monthly_returns`
GROUP BY month
ORDER BY FIELD(month, 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
