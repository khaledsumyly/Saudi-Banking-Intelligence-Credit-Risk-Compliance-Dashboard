USE saudi_banking_intelligence;

DROP TABLE IF EXISTS loan_default_cleaned;

CREATE TABLE loan_default_cleaned AS
...
-- Create cleaned version of dataset

DROP TABLE IF EXISTS loan_default_cleaned;

CREATE TABLE loan_default_cleaned AS

SELECT
    LoanID,

    Age,

    ROUND(Income, 2) AS Income,

    ROUND(LoanAmount, 2) AS LoanAmount,

    CreditScore,

    MonthsEmployed,

    NumCreditLines,

    ROUND(InterestRate, 2) AS InterestRate,

    LoanTerm,

    ROUND(DTIRatio, 2) AS DTIRatio,

    TRIM(Education) AS Education,

    TRIM(EmploymentType) AS EmploymentType,

    TRIM(MaritalStatus) AS MaritalStatus,

    TRIM(HasMortgage) AS HasMortgage,

    TRIM(HasDependents) AS HasDependents,

    TRIM(LoanPurpose) AS LoanPurpose,

    TRIM(HasCoSigner) AS HasCoSigner,

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