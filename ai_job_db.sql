USE ai_job_db;
SHOW COLUMNS FROM ai_job_db;

SELECT * FROM ai_job_db LIMIT 10;

SELECT job_title, company_name, location FROM ai_job_db;

SELECT DISTINCT industry FROM ai_job_db;

SELECT COUNT(*) AS total_jobs FROM ai_job_db;

SELECT * FROM ai_job_db
WHERE YEAR(posted_date) = 2024;

SELECT * FROM ai_job_db
WHERE employment_type = 'Full-time';

SELECT * FROM ai_job_db
WHERE location LIKE 'S%';

SELECT company_name, COUNT(*) AS total_jobs
FROM ai_job_db
GROUP BY company_name
ORDER BY total_jobs DESC
LIMIT 10;

SELECT * FROM ai_job_db
WHERE salary_range_usd > 100000;

SELECT * FROM ai_job_db
ORDER BY posted_date DESC;

SELECT industry, COUNT(*) AS total_jobs
FROM ai_job_db
GROUP BY industry
ORDER BY total_jobs DESC;

SELECT experience_level, AVG(salary_range_usd) AS avg_salary
FROM ai_job_db
GROUP BY experience_level;

SELECT * FROM ai_job_db
WHERE skills_required LIKE '%Python%';

SELECT * FROM ai_job_db
WHERE skills_required LIKE '%TensorFlow%' OR skills_required LIKE '%PyTorch%';

SELECT employment_type, COUNT(*) AS total_jobs
FROM ai_job_db
GROUP BY employment_type;

SELECT location, COUNT(*) AS total_jobs
FROM ai_job_db
GROUP BY location
ORDER BY total_jobs DESC
LIMIT 5;

SELECT company_name, COUNT(*) AS total_jobs
FROM ai_job_db
GROUP BY company_name
HAVING total_jobs > 2;

SELECT * FROM ai_job_db
WHERE company_size = '51-200' OR industry = 'Tech';

SELECT * FROM ai_job_db
WHERE salary_range_usd BETWEEN 80000 AND 120000;

SELECT * FROM ai_job_db
WHERE salary_range_usd > (
    SELECT AVG(salary_range_usd) FROM ai_job_db
);

WITH industry_avg AS (
    SELECT industry, AVG(salary_range_usd) AS avg_salary
    FROM ai_job_db
    GROUP BY industry
)
SELECT * FROM industry_avg
ORDER BY avg_salary DESC;

CREATE VIEW high_salary_jobs AS
SELECT * FROM ai_job_db
WHERE salary_range_usd > 150000;

SELECT * FROM high_salary_jobs WHERE salary_range_usd >150000;

SELECT industry, job_title, company_name, salary_range_usd,
RANK() OVER (PARTITION BY industry ORDER BY salary_range_usd DESC) AS rank_position
FROM ai_job_db;

SELECT job_title, company_name, location, salary_range_usd
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary_range_usd DESC) AS row_num
    FROM ai_job_db
) ranked_jobs
WHERE row_num <= 3;

SELECT company_name, COUNT(DISTINCT tools_preferred) AS total_tools
FROM ai_job_db
GROUP BY company_name;

CREATE INDEX idx_job_title_industry
ON ai_job_db (job_title(50), industry(50));

SELECT job_title,industry FROM ai_job_db;

DELIMITER //
CREATE PROCEDURE GetJobsByExperience(IN exp_level VARCHAR(50))
BEGIN
    SELECT * FROM ai_job_db
    WHERE experience_level = exp_level;
END //
DELIMITER ;

CALL GetJobsByExperience("Mid") ; 

SELECT company_name, COUNT(*) AS total_jobs
FROM ai_job_db
GROUP BY company_name
HAVING total_jobs > 1;
 








