USE saudi_banking_intelligence;

-- Risk Analytics Layer

-- 1. Risk distribution by income segment

SELECT
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income BETWEEN 30000 AND 70000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS Income_Segment,

    Risk_Category,

    COUNT(*) AS Total_Customers,

    ROUND(AVG(LoanAmount), 2) AS Avg_Loan_Amount,

    ROUND(AVG(CreditScore), 0) AS Avg_Credit_Score,

    ROUND(
        (SUM(DefaultStatus) / COUNT(*)) * 100,
        2
    ) AS Default_Rate_Percentage

FROM loan_default_cleaned

GROUP BY
    Income_Segment,
    Risk_Category

ORDER BY
    Income_Segment,
    Risk_Category;