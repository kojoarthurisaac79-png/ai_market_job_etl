 ETL Process
	1.	Extract: Loaded ai_job_market.csv into Python using pandas.
	2.	Transform:
	•	Cleaned text columns using RegEx
	•	Standardized column names (snake_case)
	•	Converted posted_date to DATETIME
	•	Replaced missing values with zeros or “Unknown”
	3.	Load: Exported clean dataset to MySQL database ai_job_db.



 Key SQL Concepts Used

This project applied both foundational and advanced SQL techniques:
	•	Data exploration: SELECT, WHERE, ORDER BY, GROUP BY, HAVING
	•	Aggregation: COUNT, AVG, DISTINCT
	•	Subqueries and CTEs (Common Table Expressions)
	•	Window functions: RANK(), ROW_NUMBER()
	•	Views for reusable queries
	•	Stored procedures for automation
	•	Indexes for performance optimization
	•	Date-based filtering and conditional logic



 Insights and Findings
	•	Top industries hiring AI professionals include Technology, Finance, and Healthcare.
	•	Python, SQL, and Machine Learning are the most in-demand skills.
	•	Senior-level roles have the highest salary averages.
	•	Major hiring hubs include San Francisco, New York, and Remote roles.
	•	Full-time jobs dominate the AI job landscape.



 Tech Stack
	•	Language: SQL, Python (for ETL)
	•	Database: MySQL
	•	Libraries: Pandas, SQLAlchemy
	•	Tools: MySQL Workbench, VS Code



 Project Goals

✔ Apply ETL workflow using a real-world job dataset
✔ Strengthen SQL querying and optimization skills
✔ Uncover trends in the global AI job market
✔ Create a polished, portfolio-ready project