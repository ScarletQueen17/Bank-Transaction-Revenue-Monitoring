--Database and Table creation
CREATE DATABASE bank_monitoring;

CREATE TABLE bank_transactions (
    transaction_id VARCHAR PRIMARY KEY,
    account_id VARCHAR,
    transaction_amount NUMERIC,
    transaction_date TIMESTAMP,
    transaction_type VARCHAR,
    location VARCHAR,
    device_id VARCHAR,
    ip_address VARCHAR,
    merchant_id VARCHAR,
    channel VARCHAR,
    customer_age INTEGER,
    customer_occupation VARCHAR,
    transaction_duration INTEGER,
    login_attempts INTEGER,
    account_balance NUMERIC,
    previous_transaction_date TIMESTAMP
);

--PHASE 1: Data Loading
--Load data from CSV file into the table
COPY bank_transactions 
FROM 'C:\bank_transactions_data_2.csv'
DELIMITER ','
CSV HEADER;