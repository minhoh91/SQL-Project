-- Find a list of users who have exceeded 5 purchase transactions within a single calendar day, including the date and the specific count.
SELECT
  user_id
  , transaction_date
  , COUNT(transaction_id) AS transaction_count
FROM transactions
WHERE transaction_type = 'purchase'
GROUP BY user_id, transaction_day
HAVING COUNT(transaction_id) > 5
ORDER BY COUNT(transaction_id) DESC;

