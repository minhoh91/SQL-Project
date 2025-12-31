-- Generate a list of users who were active (made a purchase) in one month AND also made a purchase in the following month.

WITH transaction_history AS(
SELECT
  DISTINCT user_id
  , transaction_date
  , LAG(transaction_date) OVER(PARTITION BY USER ID ORDER BY TRANSACTION DATE) previous_transaction_date
FROM transactions
WHERE transaction_type = 'purchase'
)

SELECT
  user_id
FROM transaction_history
WHERE TIEMSTAMPDIFF(MONTH, previous_transaction_date, transaction_date) = 1;
