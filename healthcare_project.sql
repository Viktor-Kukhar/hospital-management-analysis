-- Project: Hospital Management Analysis
-- Dataset: Hospital Management Dataset
-- Source: https://www.kaggle.com/datasets/kanakbaghel/hospital-management-dataset
-- Purpose: Analyze key operational, patient, and financial metrics within the hospital management system.
-- Author: [Viktor Kukhar]
-- Date: July 2025



-- 1. Which doctor has conducted the most appointments in the last 6 months? Including doctor’s name, specialization, and total appointment count.
SELECT first_name, specialization, COUNT(appointment_id) AS num_appointments
FROM Doctor
JOIN Appointment ON Doctor.doctor_id = Appointment.doctor_id
WHERE appointment_date BETWEEN '2023-06-30' AND '2023-12-30'
GROUP BY first_name, specialization
ORDER BY num_appointments DESC
LIMIT 1;

-- 2. Summary of each patient’s total bill amount, number of treatments, and average cost per treatment.
SELECT first_name, last_name, SUM(amount) AS total_bill_amount, COUNT(Bill.treatment_id) AS num_treatments, AVG(cost) avg_cost_treatment
FROM Patient
JOIN Bill ON Patient.patient_id = Bill.patient_id
JOIN Treatment ON Bill.treatment_id = Treatment.treatment_id
GROUP BY first_name, last_name;

-- 3. Insurance providers that are most frequently used by patients, and what is the average bill amount per provider.
SELECT insurance_provider, COUNT(insurance_provider) AS frequency, AVG(amount) AS avg_bill_amount
FROM Patient
JOIN Bill ON Patient.patient_id = Bill.patient_id
GROUP BY insurance_provider
ORDER BY frequency DESC;

-- 4. What are the top 5 most expensive treatments ever done? Including the description, patient name, doctor name, and treatment date.
SELECT description, cost, Patient.first_name, Patient.last_name, Doctor.first_name, Doctor.last_name, treatment_date
FROM Treatment
JOIN Appointment ON Treatment.appointment_id = Appointment.appointment_id
JOIN Patient ON Appointment.patient_id = Patient.patient_id
JOIN Doctor ON Appointment.doctor_id = Doctor.doctor_id
ORDER BY cost DESC
LIMIT 5;

-- 5. How many appointments resulted in a treatment, and how many didn’t? What’s the overall follow-through rate?
SELECT Appointment.appointment_id, Treatment.appointment_id
FROM Appointment
LEFT JOIN Treatment On Appointment.appointment_id = Treatment.appointment_id
where status = 'Cancelled' or 'No-show'; -- Checking if Cancelled and No-show appointments still had a treatment

-- 6. List of all patients who have had more than 3 appointments. Including their contact information and number of appointments.
SELECT Patient.patient_id, first_name, last_name, contact_number, COUNT(appointment_id) AS num_appointments
FROM Patient
JOIN Appointment ON Patient.patient_id = Appointment.patient_id
GROUP BY patient_id
HAVING num_appointments > 3;

-- 7. Month-by-month breakdown of appointment volume for each doctor for the last year.
SELECT first_name, last_name, COUNT(appointment_id) AS num_appointments, SUBSTRING(appointment_date, 6, 2) AS month
FROM Appointment
JOIN Doctor ON Appointment.doctor_id = Doctor.doctor_id
WHERE appointment_date BETWEEN '2023-01-01' AND '2023-12-30'
GROUP BY first_name, last_name, month
ORDER BY month;

-- 8. Rolling 3-month total of billed amounts over time.
SELECT bill_date, SUM(amount) OVER(ORDER BY bill_date) rolling_total_bill_amount
FROM Bill
WHERE bill_date BETWEEN '2023-10-01' AND '2023-12-30';

-- 9. Do more experienced doctors tend to administer more expensive treatments? Showing average treatment cost by years of experience buckets.
SELECT
CASE
WHEN years_experience BETWEEN 0 AND 5 THEN '0-5 years'
WHEN years_experience BETWEEN 6 AND 10 THEN '5-10 years'
WHEN years_experience BETWEEN 11 AND 15 THEN '10-15 years'
WHEN years_experience BETWEEN 16 AND 20 THEN '15-20 years'
WHEN years_experience > 20 THEN '20+ years' END AS experience_brackets, AVG(cost)
FROM Doctor
JOIN Appointment ON Doctor.doctor_id = Appointment.doctor_id
JOIN Treatment ON Appointment.appointment_id = Treatment.appointment_id
GROUP BY experience_brackets
ORDER BY MIN(years_experience);

-- 10. Top 3 most common treatment types administered by each doctor specialization.
SELECT specialization, treatment_type, COUNT(*) as treatment_count
FROM Treatment
JOIN Appointment ON Treatment.appointment_id = Appointment.appointment_id
JOIN Doctor ON Appointment.doctor_id = Doctor.doctor_id
GROUP BY specialization, treatment_type
ORDER BY specialization, COUNT(*) DESC
LIMIT 3;