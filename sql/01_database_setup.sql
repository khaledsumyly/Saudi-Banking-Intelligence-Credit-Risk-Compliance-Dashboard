-- Saudi Banking Intelligence, Credit Risk & Compliance Dashboard
-- Step 1: Database Setup

CREATE DATABASE IF NOT EXISTS saudi_banking_intelligence;

USE saudi_banking_intelligence;

DROP TABLE IF EXISTS loan_default_raw;

CREATE TABLE loan_default_raw (
    LoanID VARCHAR(50),
    Age INT,
    Income DECIMAL(12,2),
    LoanAmount DECIMAL(12,2),
    CreditScore INT,
    MonthsEmployed INT,
    NumCreditLines INT,
    InterestRate DECIMAL(5,2),
    LoanTerm INT,
    DTIRatio DECIMAL(5,2),
    Education VARCHAR(100),
    EmploymentType VARCHAR(100),
    MaritalStatus VARCHAR(100),
    HasMortgage VARCHAR(10),
    HasDependents VARCHAR(10),
    LoanPurpose VARCHAR(100),
    HasCoSigner VARCHAR(10),
    DefaultStatus INT
);


USE saudi_banking_intelligence;

SELECT * 
FROM loan_default_raw
LIMIT 10;