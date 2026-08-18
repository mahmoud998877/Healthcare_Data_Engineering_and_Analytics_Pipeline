--1. Basic Exploration

SELECT COUNT(*) AS Total_Admissions
FROM healthcare_admissions;

SELECT COUNT(DISTINCT Hospital) AS Total_Hospitals
FROM healthcare_admissions;

SELECT COUNT(DISTINCT Doctor) AS Total_Doctors
FROM healthcare_admissions;

--2. Billing Analysis

SELECT
    SUM([Billing Amount]) AS Total_Billing
FROM healthcare_admissions;

SELECT
    AVG([Billing Amount]) AS Average_Billing
FROM healthcare_admissions;

SELECT
    MAX([Billing Amount]) AS Max_Billing,
    MIN([Billing Amount]) AS Min_Billing
FROM healthcare_admissions;

SELECT
    [Medical Condition],
    COUNT(*) AS Admissions,
    AVG([Billing Amount]) AS Avg_Billing,
    SUM([Billing Amount]) AS Total_Billing
FROM healthcare_admissions
GROUP BY [Medical Condition]
ORDER BY Avg_Billing DESC;

--3. Hospital Analysis

SELECT TOP 10
    Hospital,
    COUNT(*) AS Admissions
FROM healthcare_admissions
GROUP BY Hospital
ORDER BY Admissions DESC;

SELECT TOP 10
    Hospital,
    COUNT(*) AS Admissions,
    AVG([Billing Amount]) AS Avg_Billing
FROM healthcare_admissions
GROUP BY Hospital
ORDER BY Avg_Billing DESC;

-- 4. Length of Stay

SELECT
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Length_Of_Stay
FROM healthcare_admissions;

SELECT
    [Medical Condition],
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Stay
FROM healthcare_admissions
GROUP BY [Medical Condition]
ORDER BY Avg_Stay DESC;

-- 5. Admission Type

SELECT
    [Admission Type],
    COUNT(*) AS Admissions,
    AVG([Billing Amount]) AS Avg_Billing,
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Stay
FROM healthcare_admissions
GROUP BY [Admission Type]
ORDER BY Avg_Billing DESC;

-- 6. Insurance Analysis

SELECT
    [Insurance Provider],
    COUNT(*) AS Admissions,
    AVG([Billing Amount]) AS Avg_Billing,
    SUM([Billing Amount]) AS Total_Billing
FROM healthcare_admissions
GROUP BY [Insurance Provider]
ORDER BY Total_Billing DESC;

-- 7. Medication Analysis

SELECT TOP 10
    Medication,
    COUNT(*) AS Usage_Count
FROM healthcare_admissions
GROUP BY Medication
ORDER BY Usage_Count DESC;

-- 8. Test Results

SELECT
    [Test Results],
    COUNT(*) AS Result_Count
FROM healthcare_admissions
GROUP BY [Test Results]
ORDER BY Result_Count DESC;

