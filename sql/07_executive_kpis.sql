USE saudi_banking_intelligence;

-- Executive Banking KPIs

SELECT
    COUNT(*) AS Total_Customers,

    ROUND(AVG(Income), 2) AS Avg_Income,

    ROUND(AVG(CreditScore), 2) AS Avg_Credit_Score,

    ROUND(AVG(LoanAmount), 2) AS Avg_Loan_Amount,

    ROUND(AVG(InterestRate), 2) AS Avg_Interest_Rate,

    ROUND(AVG(DTIRatio), 2) AS Avg_DTI_Ratio,

    SUM(DefaultStatus) AS Total_Defaults,

    ROUND(
        (SUM(DefaultStatus) / COUNT(*)) * 100,
        2
    ) AS Default_Rate_Percentage

FROM loan_default_cleaned;