# Hospital Management Analysis (2023)

**Dataset:** [Hospital Management Dataset](https://www.kaggle.com/datasets/kanakbaghel/hospital-management-dataset)

Analysis of hospital operational data to identify trends in doctor performance, patient billing, appointment efficiency, and treatment costs to improve resource allocation and revenue optimization.

**Quick Stats:** 5 tables analyzed | 52% cancellation rate | Top doctor handles 3x average appointments

**Tools:** SQL, Tableau

[**→ View Interactive Dashboard**](https://public.tableau.com/views/HospitalManagement_17528395711840/Dashboard1)

---

## Executive Summary

The hospital faces significant operational challenges with a 52% appointment cancellation rate driving revenue loss and a concentrated workload among dermatology specialists (Dr. Sarah Taylor handling 3x average volume). Financial analysis reveals heavy dependence on three insurance providers (Medicare Plus, PulseSecure, WellnessCorp) creating concentration risk, while counterintuitively, less experienced doctors (0-5 years) show the highest average treatment costs, suggesting misaligned case assignment protocols that require investigation.

<img width="1512" height="920" alt="Dashboard Overview" src="https://github.com/user-attachments/assets/6e1ada25-0571-4dfa-8a16-5260ebf3b458" />

---

## Key Findings

- **Dr. Sarah Taylor handles disproportionate appointment volume** as the leading dermatologist, closely followed by David Taylor (also dermatology) - indicating high demand for dermatology services but potential burnout risk.

- **52% of appointments are cancelled or no-shows**, creating massive operational inefficiency and revenue loss from unused appointment slots.

- **Less experienced doctors (0-5 years) show highest average treatment costs**, suggesting they're assigned more complex initial consultations or expensive procedures rather than routine care.

- **Three insurance providers dominate the patient base** - Medicare Plus, PulseSecure, and WellnessCorp drive the majority of revenue, creating concentration risk.

- **Appointment volume peaks in April then declines steadily**, with a corresponding revenue peak in July suggesting seasonal patterns in both volume and treatment complexity.

---

## Recommendations

Based on these insights, Hospital Administration should consider the following:

- Hire additional dermatology specialists to redistribute Dr. Taylor's workload and prevent burnout
- Implement automated appointment reminders and clearer cancellation policies to reduce 52% no-show rate
- Strengthen partnerships with top three insurance providers (Medicare Plus, PulseSecure, WellnessCorp)
- Investigate why junior doctors show higher treatment costs - may indicate need for better case assignment protocols

---

## Data & Methodology

**Dataset Structure:**

<img width="1049" height="792" alt="hospital management erd" src="https://github.com/user-attachments/assets/3f30eacd-6e64-4642-8f7c-57783b8c954d" />

Five interconnected tables:
- **Doctor:** doctor_id, first_name, specialization, years_experience
- **Patient:** patient_id, first_name, last_name, insurance_provider
- **Appointment:** appointment_id, appointment_date, doctor_id, patient_id, status
- **Treatment:** treatment_id, description, cost, appointment_id
- **Bill:** bill_id, amount, bill_date, patient_id, treatment_id

**Analysis Approach:**
SQL queries examined doctor performance, patient financials, appointment trends, and treatment costs. Full queries available in `healthcare_project.sql`.

**Key Assumptions:**
- Dataset is from 2023 only - may not reflect long-term trends
- Data integrity issue noted: cancelled/no-show patients still show treatments in dataset (likely data error)
- Analysis identifies correlations, not causation - further investigation needed for underlying causes
