-- calculate a running total of spend for every user, ordered by their transaction date

SELECT
  user_id
  , transaction_date
  , amount
  , SUM(amount) OVER(PARTITION BY user_id ORDER BY transaction_date) AS running_total
FROM transactions
WHERE transaction_type = 'purchase'
ORDER BY user_id, transaction_date;
