# Data Requirements

## Core Data Tables

### 1. Customers Table

Fields:
- Customer_ID
- Full_Name
- Gender
- Age
- Region
- Occupation
- Monthly_Income
- Customer_Segment
- Digital_Usage_Flag
- Customer_Status

---

### 2. Loans Table

Fields:
- Loan_ID
- Customer_ID
- Loan_Type
- Loan_Amount
- Interest_Rate
- Loan_Term
- Credit_Score
- Debt_to_Income_Ratio
- Approval_Status
- Default_Flag
- Risk_Category
- Approval_Date

---

### 3. Transactions Table

Fields:
- Transaction_ID
- Customer_ID
- Transaction_Date
- Transaction_Type
- Transaction_Channel
- Transaction_Amount
- Branch_Region

---

### 4. Compliance Table

Fields:
- Compliance_ID
- Customer_ID
- Policy_Exception_Flag
- Approval_Override_Flag
- Missing_Documentation_Flag
- Compliance_Status
- Review_Required_Flag

---

## Expected Relationships

- Customers → Loans
- Customers → Transactions
- Customers → Compliance

---

## Planned Data Model

Fact Tables:
- Loans
- Transactions

Dimension Tables:
- Customers
- Time
- Region
- Compliance