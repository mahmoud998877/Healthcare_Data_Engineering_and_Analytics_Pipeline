-- Ranking of hospitals by average bill

SELECT
    Hospital,
    AVG([Billing Amount]) AS Avg_Billing,
    RANK() OVER (
        ORDER BY AVG([Billing Amount]) DESC
    ) AS Hospital_Rank
FROM healthcare_admissions
GROUP BY Hospital;

-- Hospitals with an average bill higher than the average of data

WITH HospitalBilling AS (
    SELECT
        Hospital,
        AVG([Billing Amount]) AS Avg_Billing
    FROM healthcare_admissions
    GROUP BY Hospital
)
SELECT *
FROM HospitalBilling
WHERE Avg_Billing > (
    SELECT AVG([Billing Amount])
    FROM healthcare_admissions
);

-- Length of Stay Classification

SELECT
    Admission_ID,
    [Length of Stay],
    CASE
        WHEN [Length of Stay] <= 3 THEN 'Short Stay'
        WHEN [Length of Stay] <= 7 THEN 'Medium Stay'
        ELSE 'Long Stay'
    END AS Stay_Category
FROM healthcare_admissions;