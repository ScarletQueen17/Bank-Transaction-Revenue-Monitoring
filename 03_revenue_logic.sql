--PHASE 4: Revenue Logic
CREATE OR REPLACE VIEW bank_transactions_revenue AS 
SELECT *,
    CASE WHEN transaction_type ='Debit' AND channel = 'ATM' THEN  50
        WHEN transaction_type = 'Debit' AND channel = 'Online' THEN 20
        WHEN transaction_type ='Debit' AND channel = 'Branch' THEN  100
        ELSE  0
    END AS transaction_fee
FROM bank_transactions;

--View to see revenue generating transactions
SELECT transaction_type, channel, transaction_amount, transaction_fee
FROM bank_transactions_revenue
WHERE transaction_fee > 0
LIMIT 15;