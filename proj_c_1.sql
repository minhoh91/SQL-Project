-- calculate the number of days between a user's signup_date and their very first direct_deposit

SELECT
  u.user_id
  , u.signup_date
  , MIN(transaction_date) as direct_deposit_date
  , DATEDIFF(MIN(transaction_date, signup_date) date_difference
FROM users u
JOIN transaction t
  ON u.user_id = t.user_id
WHERE transaction_type = 'direct deposit'
GROUP BY u.user_id, u.signup_date
;
