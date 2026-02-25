CREATE DATABASE job_market_analysis;
USE job_market_analysis;

rename table clean_job_market_data to jobs;

# total job available
SELECT COUNT(*) AS total_jobs
FROM jobs;

# top hiring compant
SELECT company, COUNT(*) AS total_jobs
FROM jobs
GROUP BY company
ORDER BY total_jobs DESC
LIMIT 10;

#job by location
SELECT location, COUNT(*) AS jobs
FROM jobs
GROUP BY location
ORDER BY jobs DESC;

# avg salary in market
SELECT ROUND(AVG(avg_salary),2) AS avg_market_salary
FROM jobs;

# highest paying location
SELECT location,ROUND(AVG(avg_salary),2) AS avg_salary
FROM jobs
GROUP BY location
ORDER BY avg_salary DESC;

# salary by experience level
SELECT experience_level, ROUND(AVG(avg_salary),2) AS avg_salary
FROM jobs
GROUP BY experience_level
ORDER BY avg_salary DESC;

# highest paying company
SELECT company, ROUND(AVG(avg_salary),2) AS avg_salary
FROM jobs
GROUP BY company
ORDER BY avg_salary DESC
LIMIT 5;

# monthly hiring trends
SELECT month, COUNT(*) AS total_jobs
FROM jobs
GROUP BY month
ORDER BY month;

# experience level demand
SELECT experience_level,COUNT(*) AS demand
FROM jobs
GROUP BY experience_level
ORDER BY demand DESC;

# job above avg salary
SELECT * FROM jobs
WHERE avg_salary > (SELECT AVG(avg_salary) FROM jobs);

CREATE VIEW salary_insights AS
SELECT company, location, avg_salary
FROM jobs
WHERE avg_salary > 800000;
select * from salary_insights;