-- Identify the elite users who drive the most value. 
-- Business Logic: Find all users who, in the last 30 days, have made at least 3 direct deposits and at least 10 purchases.

SELECT
	user_id
    , SUM(CASE WHEN transaction_type = 'direct_depot' THEN 1 ELSE 0 end) AS DD_count
    , SUM(CASE WHEN transaction_type = 'purchase' THEN 1 ELSE 0 END) AS P_count
FROM transactions
WHERE transaction_date >= CURRENT_DATE() - INTERVAL 30 DAY
GROUP BY user_id
HAVING DD_count > 3 AND P_count >= 10;
