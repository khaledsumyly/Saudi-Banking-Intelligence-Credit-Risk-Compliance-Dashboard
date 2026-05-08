# Risk Logic & Compliance Rules

## Risk Classification Logic

### High Risk
Conditions:
- CreditScore < 500
- DTIRatio > 0.50
- Income < 30000

Action:
- High Risk Flag

---

### Medium Risk
Conditions:
- CreditScore between 500 and 700
- DTIRatio between 0.30 and 0.50

Action:
- Manual Review Recommended

---

### Low Risk
Conditions:
- CreditScore > 700
- DTIRatio < 0.30

Action:
- Eligible for Fast Approval

---

## Compliance Rules

### Policy Exception Flag
Triggered when:
- CreditScore < 500
AND
- LoanAmount > 100000

---

### Approval Override Flag
Triggered when:
- Default Risk = High
AND
- Approval Recommendation = Approved

---

### Documentation Compliance Flag
Triggered when:
- Missing customer information
- Missing employment details
- Missing income values

---

## Derived Business Columns

- Risk_Category
- Income_Level
- Approval_Recommendation
- Compliance_Flag
- Customer_Value_Segment