-- Generate a list of users who were active (made a purchase) in one month AND also made a purchase in the following month.

WITH transactions_2 AS(
SELECT
  DISTINCT user_id
  , EXTRACT(YEAR_MONTH FROM transaction_date) AS transaction_period
FROM transactions
WHERE transaction_type = 'purchase'
),

WITH transactions_3 AS(
SELECT
  user_id
  , transaction_period
  , LAG(transaction_period) OVER(PARTITION BY user_id ORDER BY transaction_period) AS previous_transaction_period
FROM transactions_2
)
  
SELECT
  user_id
FROM transactions_3
WHERE PERIOD_DIFF(transaction_period, previous_transaction_period) = 1
;
