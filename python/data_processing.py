import pandas as pd
import os

# =========================
# 1. Load Data
# =========================
print("Loading dataset...")

file_path = os.path.join('..', 'data', 'raw', 'Loan_default.csv')
df = pd.read_csv(file_path)

print(f"Dataset loaded successfully.")
print(f"Rows: {df.shape[0]}, Columns: {df.shape[1]}")

# =========================
# 2. Data Cleaning
# =========================
print("\nCleaning data...")

# Remove missing values
df.dropna(inplace=True)

print(f"Remaining rows after cleaning: {df.shape[0]}")

# =========================
# 3. Feature Engineering
# =========================
print("\nCreating features...")

# Income Segmentation
def income_segment(x):
    if x < 30000:
        return 'Low Income'
    elif x <= 70000:
        return 'Middle Income'
    else:
        return 'High Income'

df['Income_Segment'] = df['Income'].apply(income_segment)

# Loan Size Segmentation
def loan_size(x):
    if x < 50000:
        return 'Small Loan'
    elif x <= 150000:
        return 'Medium Loan'
    else:
        return 'Large Loan'

df['Loan_Size_Category'] = df['LoanAmount'].apply(loan_size)

# =========================
# =========================
# 4. KPI Calculations
# =========================
print("\nCalculating KPIs...")

# نطبع الأعمدة عشان نتأكد
print("\nColumns:")
print(df.columns)

# إنشاء عمود default بشكل صحيح
if 'Default' in df.columns:
    df['DefaultFlag'] = df['Default']
elif 'loan_status' in df.columns:
    df['DefaultFlag'] = df['loan_status'].apply(lambda x: 1 if x == 'Default' else 0)
else:
    raise Exception("No default column found!")

# حساب KPIs
avg_loan = df['LoanAmount'].mean()
total_loans = df['LoanAmount'].sum()
default_rate = df['DefaultFlag'].mean() * 100

print("\n===== KPI RESULTS =====")
print(f"Average Loan Amount: {round(avg_loan, 2)}")
print(f"Total Loan Amount: {round(total_loans, 2)}")
print(f"Default Rate (%): {round(default_rate, 2)}")
print("========================")
# =========================
# 5. Export Clean Data
# =========================
output_path = os.path.join('..', 'data', 'processed', 'cleaned_data_python.csv')

# تأكد أن مجلد processed موجود
os.makedirs(os.path.dirname(output_path), exist_ok=True)

df.to_csv(output_path, index=False)

print(f"\nCleaned data saved to: {output_path}")

print("\nData processing completed successfully.")