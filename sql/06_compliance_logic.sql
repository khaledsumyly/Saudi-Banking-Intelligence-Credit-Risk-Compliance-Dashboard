USE saudi_banking_intelligence;

-- Compliance & Governance Logic

SELECT
    LoanID,
    Income,
    LoanAmount,
    CreditScore,
    DTIRatio,
    Risk_Category,
    DefaultStatus,

    CASE
        WHEN CreditScore < 500
             AND LoanAmount > 100000
             THEN 'Policy Exception'

        ELSE 'Compliant'
    END AS Policy_Exception_Flag,

    CASE
        WHEN Risk_Category = 'High Risk'
             AND DefaultStatus = 0
             THEN 'Manual Review Required'

        ELSE 'No Review Required'
    END AS Review_Status,

    CASE
        WHEN Income IS NULL
             OR EmploymentType IS NULL
             THEN 'Missing Documentation'

        ELSE 'Documentation Complete'
    END AS Documentation_Status

FROM loan_default_cleaned;