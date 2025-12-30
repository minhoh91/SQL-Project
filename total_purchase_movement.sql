-- Generate a report showing the total purchase volume aggregated by month, ordered chronologically, to help us identify seasonal spending trends.

SELECT
  YEAR(transaction_date) AS yr
  , MONTH(transaction_date) AS mth
  , SUM(amount) AS monthly_purchase_total
  , COUNT(transaction_id) AS monthly_purchase_count
FROM transactions
WHERE transaction_type = 'purchase'
GROUP BY YEAR(transaction_date), MONTH(transaction_date)
ORDER BY YEAR(transaction_date) ASC, MONTH(transaction_date) ASC;
