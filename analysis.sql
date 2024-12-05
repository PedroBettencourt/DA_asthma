-- CLEAN DATA --

-- Check for duplicates
SELECT Age, Gender, Ethnicity, EducationLevel, BMI, COUNT(*) as count
FROM asthma
GROUP BY 1, 2, 3, 4, 5
HAVING count > 1;


-- Check for nulls
SELECT * FROM asthma WHERE Diagnosis IS NULL;


-- ANALYSIS --

-- Check number of asthmatics
SELECT diagnosis, COUNT(*) FROM asthma GROUP BY diagnosis;


-- Age
SELECT diagnosis, 
CASE 
	WHEN age < 18 THEN '<18'
	WHEN age BETWEEN 18 AND 24 THEN '18-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
	WHEN age BETWEEN 55 AND 64 THEN '55-64'
	ELSE '65+'
END AS age_group, COUNT(*) AS pop,
ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY diagnosis), 2) AS percentage
FROM asthma 
GROUP BY 1, 2 
ORDER BY 1, 2;


-- Gender
SELECT diagnosis, gender, COUNT(*) AS pop,
ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY diagnosis), 2) AS percentage
FROM asthma 
GROUP BY 1, 2 
ORDER BY 1, 2;


-- Ethnicity
SELECT diagnosis, ethnicity, COUNT(*) AS pop,
ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY diagnosis), 2) AS percentage
FROM asthma 
GROUP BY 1, 2 
ORDER BY 1, 2;


-- Education Percentage
SELECT diagnosis, EducationLevel, COUNT(*) AS pop,
ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY diagnosis), 2) AS education_percentage
FROM asthma 
GROUP BY 1, 2 
ORDER BY 1, 2;


-- BMI
SELECT diagnosis,
CASE
	WHEN BMI < 18.5 THEN 'underweight'
    WHEN BMI BETWEEN 18.5 AND 25 THEN 'healthy'
    WHEN BMI BETWEEN 25 AND 30 THEN 'overweight'
    WHEN BMI > 30 THEN 'obese'
END AS bmi_group, COUNT(*) AS pop,
ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY diagnosis), 2) AS percentage
FROM asthma 
GROUP BY 1, 2 
ORDER BY 1, 2;


-- Smoking Percentage
SELECT diagnosis, smoking, COUNT(*) AS pop,
ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY diagnosis), 2) AS percentage
FROM asthma 
GROUP BY 1, 2 
ORDER BY 1, 2;


-- PhysicalActivity


-- Symptoms
SELECT 
    Diagnosis, 
    CASE 
		WHEN Wheezing + ShortnessOfBreath + ChestTightness + Coughing + NighttimeSymptoms + ExerciseInduced = 0 THEN 'no symptoms'
		WHEN Wheezing + ShortnessOfBreath + ChestTightness + Coughing + NighttimeSymptoms + ExerciseInduced <= 2 THEN 'mild symptoms'
		WHEN Wheezing + ShortnessOfBreath + ChestTightness + Coughing + NighttimeSymptoms + ExerciseInduced  <= 4 THEN 'moderate symptoms'
		ELSE 'severe'
	END AS symptoms,
    COUNT(*) AS pop,
	ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY diagnosis), 2) AS percentage
FROM asthma
GROUP BY 1, 2
ORDER BY 1, 2;


-- Symptoms vs environment
SELECT symptoms, AVG(PhysicalActivity),	AVG(DietQuality), AVG(SleepQuality), 
				 AVG(PollutionExposure), AVG(PollenExposure), AVG(DustExposure)
FROM (
	SELECT 
		Diagnosis, PhysicalActivity, DietQuality, SleepQuality, PollutionExposure, PollenExposure, DustExposure,
		CASE 
			WHEN Wheezing + ShortnessOfBreath + ChestTightness + Coughing + NighttimeSymptoms + ExerciseInduced = 0 THEN 'no symptoms'
			WHEN Wheezing + ShortnessOfBreath + ChestTightness + Coughing + NighttimeSymptoms + ExerciseInduced <= 2 THEN 'mild symptoms'
			WHEN Wheezing + ShortnessOfBreath + ChestTightness + Coughing + NighttimeSymptoms + ExerciseInduced  <= 4 THEN 'moderate symptoms'
			ELSE 'severe'
		END AS symptoms
	FROM asthma) sub
GROUP BY symptoms;


-- Environment vs ethnicity, gender, age, education