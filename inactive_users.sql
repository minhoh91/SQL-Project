-- Identify users who were active in the past but have had zero transactions in the last 30 days. 
-- Business Logic: We want to target these people with a "We miss you" email. Join the users table to the transactions table to find people with no recent activity.

SELECT
  u.user_id
FROM users u 
LEFT JOIN transactions t
  ON u.user_id = t.user_id
  AND t.transaction_date >= CURDATE() - INTERVAL 30 DAY
WHERE u.status = 'active'
  AND t.transaction_id IS NULL;
