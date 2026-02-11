--PHASE 2: Data Profiling and Validation
--Data Exploration Queries
SELECT * FROM bank_transactions LIMIT 10;

--Get table structure
SELECT 
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'bank_transactions';

--Get total number of records
SELECT COUNT(*)
FROM bank_transactions;


--Check for NULL Values
SELECT
    COUNT(*) FILTER (WHERE account_id IS NULL) AS missing_account_id,
    COUNT(*) FILTER (WHERE transaction_amount IS NULL) AS missing_transaction_amount,
    COUNT(*) FILTER (WHERE account_balance IS NULL) AS missing_account_balance,
    COUNT(*) FILTER (WHERE channel IS NULL) AS missing_channel
FROM bank_transactions;

--Check for duplicates
SELECT
    transaction_id, COUNT(*) AS duplicates
    FROM bank_transactions
    GROUP BY transaction_id
    having count(*) > 1;

--Check for missing transaction_date
SELECT
COUNT(*) FILTER (WHERE transaction_date IS NULL) AS missing_date
FROM bank_transactions;

--PHASE 3: Data Quality Checks
--Check for negative transaction amount
SELECT transaction_amount 
FROM bank_transactions 
WHERE transaction_amount <0;

--Check transaction type
SELECT DISTINCT transaction_type
FROM bank_transactions;

--Check for invalid channnels
SELECT DISTINCT channel
FROM bank_transactions;

--Check for disinct locations
SELECT  COUNT (DISTINCT location)
FROM bank_transactions;