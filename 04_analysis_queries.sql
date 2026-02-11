--PASE 5: Business Questions (Bank-Level)
--How much did the bank earn from transaction fees in total?
SELECT SUM(transaction_fee)AS total_revenue
FROM bank_transactions_revenue;

--Which channel earns the mosst?
--Where to invest more resourses?

SELECT channel, SUM(transaction_fee) AS total_revenue
FROM bank_transactions_revenue
GROUP BY channel
ORDER BY total_revenue DESC;

--How many volumne of transactions per channel?
SELECT channel, COUNT(*) 
FROM bank_transactions_revenue
GROUP BY channel
ORDER BY channel DESC;

--Top 10 Revenue Generating Customers
SELECT account_id, SUM(transaction_fee) AS total_fees_paid
FROM bank_transactions_revenue
GROUP BY account_id
ORDER BY SUM(transaction_fee) DESC
LIMIT 10;

--PHASE 6: Time Based Analysis
--Monthly Revenue Trend
SELECT DATE_TRUNC('month', transaction_date) AS month,
    SUM(transaction_fee) AS monthly_revenue
 FROM bank_transactions_revenue
 GROUP BY month 
ORDER BY month;

--Total number of transactions per month
SELECT DATE_TRUNC('month', transaction_date) AS month, 
    COUNT(*) AS transactions
    FROM bank_transactions_revenue
    GROUP BY month
    ORDER BY month;

--Average transaction volume
SELECT channel, AVG(transaction_fee) AS avg_fee
FROM bank_transactions_revenue 
GROUP BY channel;    