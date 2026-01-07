-- Compare the "Activation Rate" between the Control and Test groups to determine if a new signup incentive significantly increased the percentage of users making their first deposit.
WITH exp_users AS(
SELECT
  *
FROM experiments
WHERE experiment_id = 'sign_up_incentive_2024'
),

first_deposit AS(
SELECT
  user_id
  , MIN(transaction_date) as first_deposit
FROM transactions
  WHERE transaction_type = 'deposit'
GROUP BY user_id
)

SELECT
  e.variant
  , COUNT(e.user_id) AS total_participants
  , COUNT(f.user_id) AS experiment_success_count
  , ROUND(COUNT(f.user_id) * 100/COUNT(e.user_id), 2) AS success_rate
FROM exp_users e
LEFT JOIN first_deposit f ON e.user_id = f.user_id
GROUP BY e.variant
