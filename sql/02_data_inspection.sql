-- Check total records

SELECT COUNT(*) AS total_records
FROM loan_default_raw;

-- Preview dataset

SELECT *
FROM loan_default_raw
LIMIT 10;

-- Check missing values

SELECT
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS missing_income,
    SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS missing_credit_score,
    SUM(CASE WHEN LoanAmount IS NULL THEN 1 ELSE 0 END) AS missing_loan_amount
FROM loan_default_raw;

-- Risk overview

SELECT
    DefaultStatus,
    COUNT(*) AS total_customers
FROM loan_default_raw
GROUP BY DefaultStatus;

-- Average loan amount by default status

SELECT
    DefaultStatus,
    AVG(LoanAmount) AS avg_loan_amount
FROM loan_default_raw
GROUP BY DefaultStatus;