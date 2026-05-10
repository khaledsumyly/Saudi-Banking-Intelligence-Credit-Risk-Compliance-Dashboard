USE saudi_banking_intelligence;

-- Customer Segmentation Logic

SELECT
    LoanID,
    Age,
    Income,
    LoanAmount,
    CreditScore,
    Risk_Category,

    CASE
        WHEN Income < 30000
             THEN 'Low Income'

        WHEN Income BETWEEN 30000 AND 70000
             THEN 'Middle Income'

        ELSE 'High Income'
    END AS Income_Segment,

    CASE
        WHEN LoanAmount < 50000
             THEN 'Small Loan'

        WHEN LoanAmount BETWEEN 50000 AND 150000
             THEN 'Medium Loan'

        ELSE 'Large Loan'
    END AS Loan_Size_Category,

    CASE
        WHEN Age < 30
             THEN 'Young Customers'

        WHEN Age BETWEEN 30 AND 50
             THEN 'Middle Age Customers'

        ELSE 'Senior Customers'
    END AS Customer_Age_Group

FROM loan_default_cleaned;