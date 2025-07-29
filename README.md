# Hospital Management SQL Project

## Project Background

This project analyzes data from a [Hospital Management Dataset](https://www.kaggle.com/datasets/kanakbaghel/hospital-management-dataset) to understand the operational and financial performance of a hospital. The analysis focuses on key metrics related to doctors, patients, appointments, and treatments to identify trends and areas for improvement. The business model revolves around providing medical services, with key metrics including appointment volume, treatment costs, and revenue from insurance providers.

Insights and recommendations are provided on the following key areas:

-   **Doctor Performance:** Appointment volume and treatment costs by experience level.
-   **Patient & Financials:** Billing amounts, treatment costs, and insurance provider analysis.
-   **Appointment Trends:** Volume by month and cancellation rates.
-   **Treatment Analysis:** Highest cost treatments and treatment follow-through rates.

The SQL queries used to inspect and analyze the data for this project can be found in the `healthcare_project.sql` file.

An interactive Tableau dashboard to report this findings can be found here: [Hospital Management Dashboard](https://public.tableau.com/views/HospitalManagement_17528395711840/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Data Structure & Initial Checks

The database I created consists of five interconnected tables:

-   **Doctor:** Contains doctor information, including `doctor_id`, `first_name`, `specialization`, and `years_experience`.
-   **Patient:** Stores patient details like `patient_id`, `first_name`, `last_name`, and `insurance_provider`.
-   **Appointment:** Holds appointment data, including `appointment_id`, `appointment_date`, `doctor_id`, `patient_id`, and `status`.
-   **Treatment:** Details treatments administered, with columns like `treatment_id`, `description`, `cost`, and `appointment_id`.
-   **Bill:** Records billing information, such as `bill_id`, `amount`, `bill_date`, `patient_id`, and `treatment_id`.

<img width="1049" height="792" alt="hospital management erd" src="https://github.com/user-attachments/assets/3f30eacd-6e64-4642-8f7c-57783b8c954d" />

## Executive Summary

### Overview of Findings

The analysis of the hospital management data reveals several key operational and financial trends. **Dr. Sarah Taylor consistently handles the highest number of appointments**, while appointment volumes peak in the spring and decline towards the end of the year. A significant portion of appointments are either **cancelled or no-shows**, impacting resource allocation. Financially, a few insurance providers, particularly **Medicare Plus**, dominate the patient base, and treatment costs vary significantly based on the procedure and the experience level of the doctor. The **3-month rolling bill amount shows a peak in the start of summer**, suggesting seasonal variations in revenue.

<img width="1512" height="920" alt="Screenshot 2025-07-18 at 14 07 21" src="https://github.com/user-attachments/assets/6e1ada25-0571-4dfa-8a16-5260ebf3b458" />

## Insights Deep Dive

### Doctor Performance & Experience

-   **Top Performing Doctor:** Dr. Sarah Taylor is the leading dermatologist by appointment volume, closely followed by David Taylor who is also a dermatologist indicating that dermatology services is in high demand.
-   **Experience vs. Cost:** Doctors with **0-5 years of experience have the highest average treatment cost**, while those with more experience have lower average costs. This may suggest that less experienced doctors are being assigned more complex or initial consultations which tend to be more expensive.
-   **Appointment Distribution:** The number of appointments per doctor varies, with some doctors having a much lighter schedule compared to others.

<img width="505" height="298" alt="Screenshot 2025-07-18 at 13 54 34" src="https://github.com/user-attachments/assets/1a421abc-2376-4161-9bef-96b9236b5722" />

<img width="506" height="388" alt="Screenshot 2025-07-18 at 14 13 01" src="https://github.com/user-attachments/assets/309a4049-784a-4e3c-9838-c4459bc50f36" />

### Financial & Patient Analysis

-   **Top Insurance Providers:** **Medicare Plus, PulseSecure, and WellnessCorp** are the most frequently used insurance providers by patients.
-   **Revenue Concentration:** The majority of the revenue is concentrated among these top insurance providers, highlighting their importance to the hospital's financial stability.
-   **Costly Treatments:** **"Basic Screening"** and **"Standard procedure"** are among the highest cost treatments, driving a significant portion of the revenue.

<img width="453" height="328" alt="Screenshot 2025-07-18 at 14 18 23" src="https://github.com/user-attachments/assets/4b60038d-6a93-420c-a3d6-d02b268f1b0c" />

<img width="457" height="378" alt="Screenshot 2025-07-18 at 14 18 33" src="https://github.com/user-attachments/assets/d1620f30-e850-438f-ab95-84e8bb7d938b" />

### Appointment & Operational Trends

-   **Seasonal Appointment Volume:** The number of appointments fluctuates monthly, with a noticeable **peak in April and a decline since**.
-   **High Cancellation Rate:** A **cancellation or no-show rate of 52%** indicates a significant operational challenge that needs to be addressed to improve efficiency.
-   **Rolling Bill Amount:** The 3-month rolling bill amount peaks in July, which could be attributed to a higher number of expensive treatments during that period.

<img width="567" height="691" alt="Screenshot 2025-07-18 at 14 22 21" src="https://github.com/user-attachments/assets/222e9d9a-e1dc-43a7-9710-9ee013d7b7f8" />

## Recommendations

Based on the insights and findings above, I would recommend the following to the **Hospital Administration**:

-   **Balance Doctor Workload:** Investigate the reasons for the high volume of appointments for Dr. Sarah Taylor and Dr. David Taylor and consider hiring more Dermatology specialists to reallocate patients to other qualified doctors to balance the workload and prevent burnout.
-   **Address High Cancellation Rate:** Implement strategies to reduce the high cancellation and no-show rate, such as automated appointment reminders, a clearer cancellation policy, or a small fee for last-minute cancellations.
-   **Optimize Insurance Partnerships:** Strengthen relationships with top insurance providers like Medicare Plus and WellnessCorp, and explore opportunities for partnerships with other providers to diversify the patient base.
-   **Investigate Cost Variations:** Analyze why less experienced doctors are associated with higher treatment costs. This could lead to better training programs or a review of how treatments are assigned to doctors.

## Assumptions and Caveats

Throughout the analysis, the following assumptions and caveats were noted:

-   **Data Integrity:** The analysis assumes that the data in the dataset is accurate and complete, with no significant errors. However when doing the analysis on Follow-through rate I noticed that patients who cancelled or haven't showed up to appoinments still had a treatment, resulting in all patients having a treatment after appointments which means 100% follow through rate. This is likely a mistake in the dataset that's why cancellation and no-show rate was calculated instead follow-through rate.
-   **Timeframe:** The analysis is based on data from a specific period (2023) and may not reflect long-term trends.
-   **Causation vs. Correlation:** The analysis identifies correlations between variables (e.g., doctor experience and treatment cost), but does not prove the cause of this. Further investigation would be needed to determine the underlying reasons for these trends.
