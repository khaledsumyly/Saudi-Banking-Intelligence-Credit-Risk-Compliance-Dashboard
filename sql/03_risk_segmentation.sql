-- Risk Segmentation Logic

SELECT
    LoanID,
    Age,
    Income,
    LoanAmount,
    CreditScore,
    DTIRatio,
    DefaultStatus,

    CASE
        WHEN CreditScore < 500
             AND DTIRatio > 0.50
             THEN 'High Risk'

        WHEN CreditScore BETWEEN 500 AND 700
             AND DTIRatio BETWEEN 0.30 AND 0.50
             THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS Risk_Category

FROM loan_default_raw;