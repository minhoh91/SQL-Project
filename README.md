users  
  user_id (PK): Unique identifier for each customer.  
  signup_date: The date the user joined the platform.  
  status: Current account standing (e.g., Active, Inactive, Pending).  
  sales_region: Geographic location (e.g., North, South, East, West).  
  
transactions  
  transaction_id (PK): Unique identifier for each transaction.  
  user_id (FK): Links the transaction to a specific user.  
  merchant_id (FK): Links the transaction to a specific merchant.  
  transaction_date: The date the purchase or deposit occurred.  
  amount: The dollar value of the transaction.  
  transaction_type: The category of movement (e.g., Purchase, Deposit, Withdrawal).  
  
merchants  
  merchant_id (PK): Unique identifier for each vendor.  
  merchant_name: The name of the business (e.g., Amazon, Starbucks).  
  category: Business industry (e.g., Groceries, Dining, Travel, Luxury).  
  risk_level: A scale of 1–5 indicating the likelihood of fraudulent activity.  
  
Project A: Customer Onboarding & Health  
1: The "Power User" Audit: Identifies elite customers by filtering for a specific frequency of high-value actions (direct deposits and purchases) within a rolling 30-day window.

2: The "Dormancy" Risk Report: Uses a LEFT JOIN to isolate active users who have had zero account activity in the last month, creating a target list for re-engagement campaigns.

3: New User "Activation" Rate: Calculates the conversion percentage of recent signups who successfully funded their accounts, measuring the effectiveness of the initial user funnel.

Project B: Revenue & Regional Performance  
1: Regional Spend & Transaction Density: Breaks down interchange revenue by geographic location, ranking regions by total purchase volume and transaction frequency.

2: Daily Transaction Frequency Audit: A risk-mitigation query that identifies "High-Velocity" behavior by flagging users who exceed 5 purchases in a single calendar day.

3: Monthly Revenue Growth & Trend Analysis: Aggregates purchase volume by month to provide Finance with a chronological view of month-over-month (MoM) growth and seasonality.

Project C: Advanced Retention & Lifetime Value  
1: The "First Deposit" Lead Time: Measures the "time-to-value" by calculating the exact number of days it takes for a new user to move from signup to their first direct deposit.

2: Month-over-Month User Retention: Identifies "Sticky" users by using LAG() and PERIOD_DIFF to find customers who transacted in consecutive months, regardless of the year-change.

3: Running Total of Revenue per User: Uses Window Functions to calculate a chronological cumulative spend for every user, allowing the business to identify "Whale" customers as their value grows over time

Project D: Merchant Ecosystem & Risk Strategy 1: The "Luxury vs. Necessity" Persona Analysis: Joins all three tables to identify high-spend luxury shoppers within specific regions, helping marketing define high-affinity consumer segments.  

2: Merchant Risk Exposure Report: Flags high-risk merchants by joining transaction volume with risk levels to identify vendors with suspicious velocity or high-value transaction averages.

3: Category Diversification Metric: Uses CTEs and Cross Joins to calculate the variety of merchant categories a user shops in compared to the platform average, measuring user wallet share and engagement.

Technical Skills & SQL Proficiencies Advanced Date Manipulation: Used EXTRACT(YEAR_MONTH), DATEDIFF, and PERIOD_DIFF to handle complex time-series data and year-over-year transitions.

Window Functions & Benchmarking: Implemented LAG() for retention analysis, SUM() OVER for lifetime totals (LTV), and CROSS JOINs to compare individual user metrics against platform-wide averages.

Multi-Entity Data Integration: Expert at performing complex three-way joins across User, Transaction, and Merchant dimensions to uncover cross-functional business insights.

Analytical CTEs (Common Table Expressions): Leveraged multiple CTEs to layer logic, such as normalizing transaction dates and isolating sub-populations before performing final aggregations.

Risk & Funnel Logic: Built queries to measure "Time-to-Value" (activation) and "Risk Audit Status" by flagging high-velocity behavior and high-risk merchant profiles.

Data Aggregation & Filtering: Proficiency in GROUP BY, HAVING, and complex CASE WHEN statements for conditional metrics and persona categorization.

Performance Optimization: Utilized DISTINCT and JOIN optimization to ensure queries run efficiently on high-volume transaction datasets.
