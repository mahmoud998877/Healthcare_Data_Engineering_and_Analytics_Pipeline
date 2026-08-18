-- Which medical conditions have the highest healthcare costs?

CREATE VIEW vw_Condition_Cost_Analysis AS
SELECT
    [Medical Condition],
    COUNT(*) AS Total_Admissions,
    SUM([Billing Amount]) AS Total_Billing,
    AVG([Billing Amount]) AS Avg_Billing,
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Length_of_Stay
FROM healthcare_admissions
GROUP BY [Medical Condition];

-- Which hospitals have the highest workload and cost?

CREATE VIEW vw_Hospital_Performance AS
SELECT
    Hospital,
    COUNT(*) AS Total_Admissions,
    SUM([Billing Amount]) AS Total_Billing,
    AVG([Billing Amount]) AS Avg_Billing,
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Length_of_Stay
FROM healthcare_admissions
GROUP BY Hospital;

-- Does admission type affect cost and length of stay?

CREATE VIEW vw_Admission_Type_Analysis AS
SELECT
    [Admission Type],
    COUNT(*) AS Total_Admissions,
    SUM([Billing Amount]) AS Total_Billing,
    AVG([Billing Amount]) AS Avg_Billing,
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Length_of_Stay
FROM healthcare_admissions
GROUP BY [Admission Type];

-- Which insurance providers are associated with higher costs?

CREATE VIEW vw_Insurance_Cost_Analysis AS
SELECT
    [Insurance Provider],
    COUNT(*) AS Total_Admissions,
    SUM([Billing Amount]) AS Total_Billing,
    AVG([Billing Amount]) AS Avg_Billing,
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Length_of_Stay
FROM healthcare_admissions
GROUP BY [Insurance Provider];

-- What factors are associated with longer hospital stays?

CREATE VIEW vw_Length_of_Stay_Analysis AS
SELECT
    [Medical Condition],
    [Admission Type],
    COUNT(*) AS Total_Admissions,
    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Length_of_Stay,
    AVG([Billing Amount]) AS Avg_Billing,
    SUM([Billing Amount]) AS Total_Billing
FROM healthcare_admissions
GROUP BY
    [Medical Condition],
    [Admission Type];

    -- Which age groups have higher healthcare costs?

    CREATE VIEW vw_Age_Group_Analysis AS
SELECT
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 49 THEN '35-49'
        WHEN Age BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS Age_Group,

    COUNT(*) AS Total_Admissions,

    AVG([Billing Amount]) AS Avg_Billing,

    SUM([Billing Amount]) AS Total_Billing,

    AVG(CAST([Length of Stay] AS DECIMAL(10,2))) AS Avg_Length_of_Stay

FROM healthcare_admissions

GROUP BY
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 49 THEN '35-49'
        WHEN Age BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END;

    -- What are the most common conditions and their associated costs?

    CREATE VIEW vw_Condition_Volume_Cost AS
SELECT
    [Medical Condition],
    COUNT(*) AS Total_Admissions,
    SUM([Billing Amount]) AS Total_Billing,
    AVG([Billing Amount]) AS Avg_Billing
FROM healthcare_admissions
GROUP BY [Medical Condition];

