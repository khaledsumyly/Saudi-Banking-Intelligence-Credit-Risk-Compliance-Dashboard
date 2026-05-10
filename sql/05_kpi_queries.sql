USE saudi_banking_intelligence;

-- Total Customers

SELECT
    COUNT(*) AS total_customers
FROM loan_default_cleaned;

--------------------------------------------------

-- Default Rate

SELECT
    ROUND(
        (SUM(DefaultStatus) / COUNT(*)) * 100,
        2
    ) AS default_rate_percentage
FROM loan_default_cleaned;

--------------------------------------------------

-- Risk Distribution

SELECT
    Risk_Category,
    COUNT(*) AS total_customers
FROM loan_default_cleaned
GROUP BY Risk_Category;

--------------------------------------------------

-- Average Loan Amount by Risk Category

SELECT
    Risk_Category,
    ROUND(AVG(LoanAmount), 2) AS avg_loan_amount
FROM loan_default_cleaned
GROUP BY Risk_Category;

--------------------------------------------------

-- Average Income by Risk Category

SELECT
    Risk_Category,
    ROUND(AVG(Income), 2) AS avg_income
FROM loan_default_cleaned
GROUP BY Risk_Category;

--------------------------------------------------

-- High Risk Customers

SELECT
    COUNT(*) AS high_risk_customers
FROM loan_default_cleaned
WHERE Risk_Category = 'High Risk';

--------------------------------------------------

-- Average Credit Score by Risk Category

SELECT
    Risk_Category,
    ROUND(AVG(CreditScore), 0) AS avg_credit_score
FROM loan_default_cleaned
GROUP BY Risk_Category;