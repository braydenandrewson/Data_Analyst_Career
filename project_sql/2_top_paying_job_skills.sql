/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest paying Data Analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact  
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        (job_location = 'Orlando, FL' OR job_location = 'Anywhere') AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 100
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC


/*
SQL is essential — 82% of top-paying roles require it
Python is second — 56% of roles, making SQL + Python the core foundation
Tableau dominates BI tools — 44% vs Power BI at 23%
Most skills pay similarly — $144K–$152K range, suggesting skill combinations matter more than individual skills
R and SAS are specialty skills — Lower demand (36% and 31%) but valuable for statistical/enterprise roles
Cloud & Big Data emerging — AWS, Snowflake, Hadoop appear less frequently but correlate with higher salaries
Jobs require multiple skills — Median posting asks for 5–6 skills
Competitive profile: SQL + Python + Tableau + Excel + one cloud platform covers ~82% of postings
78 unique skills across 91 jobs — Wide variety, but top 15 account for most demand

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": "A-Line Staffing Solutions",
    "skills": "sql"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": "A-Line Staffing Solutions",
    "skills": "python"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": "A-Line Staffing Solutions",
    "skills": "azure"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": "Robert Half",
    "skills": "java"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": "Robert Half",
    "skills": "go"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": "Robert Half",
    "skills": "excel"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "sql"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "python"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "azure"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "databricks"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "skills": "power bi"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "swift"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "excel"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "tableau"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": "Uber",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": "Plexus Resource Solutions",
    "skills": "aws"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "sas"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "go"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "crystal"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "tableau"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": "CEDARS-SINAI",
    "skills": "sas"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "sql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "python"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "scala"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "r"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "mysql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "postgresql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "couchbase"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "azure"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "databricks"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "aws"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "redshift"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "oracle"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "snowflake"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "watson"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "pyspark"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "airflow"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "linux"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "tableau"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "ssis"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "cognos"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": "DIRECTV",
    "skills": "visio"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql server"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "azure"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sas"
  },
  {
    "job_id": 182813,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "ssrs"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Realtime Recruitment",
    "skills": "snowflake"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Realtime Recruitment",
    "skills": "power bi"
  },
  {
    "job_id": 475626,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "160000.0",
    "company_name": "Realtime Recruitment",
    "skills": "looker"
  },
  {
    "job_id": 783771,
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "salary_year_avg": "160000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 783771,
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "salary_year_avg": "160000.0",
    "company_name": "Robert Half",
    "skills": "java"
  },
  {
    "job_id": 485388,
    "job_title": "System Data Analyst",
    "salary_year_avg": "157500.0",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "skills": "sql"
  },
  {
    "job_id": 485388,
    "job_title": "System Data Analyst",
    "salary_year_avg": "157500.0",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "skills": "go"
  },
  {
    "job_id": 485388,
    "job_title": "System Data Analyst",
    "salary_year_avg": "157500.0",
    "company_name": "Edgewater Federal Solutions, Inc.",
    "skills": "oracle"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 266799,
    "job_title": "Applied Scientist - Maps",
    "salary_year_avg": "157500.0",
    "company_name": "Uber",
    "skills": "spark"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "sql"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "python"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "r"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "tableau"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "looker"
  },
  {
    "job_id": 25761,
    "job_title": "Data Analyst - Remote",
    "salary_year_avg": "155485.5",
    "company_name": "CaptivateIQ",
    "skills": "datarobot"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "sql"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "python"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "scala"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "java"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "c++"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "redshift"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "snowflake"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "spark"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "airflow"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "hadoop"
  },
  {
    "job_id": 105157,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "155000.0",
    "company_name": "Motion Recruitment",
    "skills": "tableau"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "sql"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "hadoop"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "excel"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "tableau"
  },
  {
    "job_id": 565646,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "looker"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "sql"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "hadoop"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "excel"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "tableau"
  },
  {
    "job_id": 795614,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "salary_year_avg": "152625.0",
    "company_name": "Zscaler",
    "skills": "looker"
  },
  {
    "job_id": 540057,
    "job_title": "Lead Data Analyst, Growth (Remote)",
    "salary_year_avg": "152500.0",
    "company_name": "Rocket Money",
    "skills": "sql"
  },
  {
    "job_id": 540057,
    "job_title": "Lead Data Analyst, Growth (Remote)",
    "salary_year_avg": "152500.0",
    "company_name": "Rocket Money",
    "skills": "looker"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "sql"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "r"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "go"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "databricks"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "tableau"
  },
  {
    "job_id": 72957,
    "job_title": "Management & Program Analyst (Data Analytics)",
    "salary_year_avg": "152221.5",
    "company_name": "US Patent and Trademark Office",
    "skills": "alteryx"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "sql"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "python"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "company_name": "Get It Recruit - Healthcare",
    "skills": "r"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "nosql"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "vba"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "oracle"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "hadoop"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 591850,
    "job_title": "Mid-Level Data BI Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "tableau"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sql"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "excel"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "tableau"
  },
  {
    "job_id": 73304,
    "job_title": "Mid-Level Data Analyst",
    "salary_year_avg": "150000.0",
    "company_name": "Patterned Learning AI",
    "skills": "sheets"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "sql"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "python"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "nosql"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "r"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "sas"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "vba"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "db2"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "oracle"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "hadoop"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "excel"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "tableau"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "sas"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "microstrategy"
  },
  {
    "job_id": 1402149,
    "job_title": "Lead Data Analyst - Retirement Product Management",
    "salary_year_avg": "148238.5",
    "company_name": "Edward Jones",
    "skills": "spss"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "sql"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "python"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "sas"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "t-sql"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "snowflake"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "hadoop"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "excel"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "sas"
  },
  {
    "job_id": 1694004,
    "job_title": "Manager - Data Analyst",
    "salary_year_avg": "147285.0",
    "company_name": "EXL Service",
    "skills": "ssis"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "sql"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "python"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "r"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "sas"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "excel"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "tableau"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "power bi"
  },
  {
    "job_id": 712558,
    "job_title": "Data Scientist Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "ALTA IT Services",
    "skills": "sas"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "python"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "java"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "r"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "javascript"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "c++"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "tableau"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "power bi"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "CyberCoders",
    "skills": "qlik"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "sql"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "excel"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "tableau"
  },
  {
    "job_id": 1329162,
    "job_title": "Data Analyst - up to 160K+",
    "salary_year_avg": "145000.0",
    "company_name": "Hire With Jarvis",
    "skills": "power bi"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "aws"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "pandas"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "kubernetes"
  },
  {
    "job_id": 149006,
    "job_title": "People Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Insight Global",
    "skills": "sql"
  },
  {
    "job_id": 149006,
    "job_title": "People Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Insight Global",
    "skills": "python"
  },
  {
    "job_id": 149006,
    "job_title": "People Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Insight Global",
    "skills": "oracle"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "swift"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "excel"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "tableau"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "company_name": "Uber",
    "skills": "looker"
  },
  {
    "job_id": 762220,
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "salary_year_avg": "140000.0",
    "company_name": "IT Pros",
    "skills": "bigquery"
  },
  {
    "job_id": 762220,
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "salary_year_avg": "140000.0",
    "company_name": "IT Pros",
    "skills": "power bi"
  },
  {
    "job_id": 762220,
    "job_title": "Qlik/Power BI Data Analyst | $130K-$150K + ESOP |100% USA-Remote",
    "salary_year_avg": "140000.0",
    "company_name": "IT Pros",
    "skills": "qlik"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "sql"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "python"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "r"
  },
  {
    "job_id": 1049000,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "140000.0",
    "company_name": "Sisense",
    "skills": "snowflake"
  },
  {
    "job_id": 208403,
    "job_title": "Data Manager",
    "salary_year_avg": "140000.0",
    "company_name": "Insight Global",
    "skills": "nosql"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "sql"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "python"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "scala"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "java"
  },
  {
    "job_id": 1300702,
    "job_title": "Data Analyst (Product Data Analyst)",
    "salary_year_avg": "139000.0",
    "company_name": "Revolut",
    "skills": "c++"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "sql"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "nosql"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "javascript"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "snowflake"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "hadoop"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "phoenix"
  },
  {
    "job_id": 388392,
    "job_title": "Digital Marketing Data Analyst (Hybrid)",
    "salary_year_avg": "138640.0",
    "company_name": "United Services Automobile Association",
    "skills": "tableau"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "company_name": "Overmind",
    "skills": "sql"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "company_name": "Overmind",
    "skills": "python"
  },
  {
    "job_id": 350382,
    "job_title": "Lead I - Power BI Data Analyst",
    "salary_year_avg": "138000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 350382,
    "job_title": "Lead I - Power BI Data Analyst",
    "salary_year_avg": "138000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "nosql"
  },
  {
    "job_id": 350382,
    "job_title": "Lead I - Power BI Data Analyst",
    "salary_year_avg": "138000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql server"
  },
  {
    "job_id": 350382,
    "job_title": "Lead I - Power BI Data Analyst",
    "salary_year_avg": "138000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "azure"
  },
  {
    "job_id": 350382,
    "job_title": "Lead I - Power BI Data Analyst",
    "salary_year_avg": "138000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 350382,
    "job_title": "Lead I - Power BI Data Analyst",
    "salary_year_avg": "138000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "dax"
  },
  {
    "job_id": 835092,
    "job_title": "Secret Data Analyst Remote / Telecommute Jobs",
    "salary_year_avg": "137500.0",
    "company_name": "Insight Global, Inc.",
    "skills": "sharepoint"
  },
  {
    "job_id": 740073,
    "job_title": "Data Analytics Manager",
    "salary_year_avg": "137000.0",
    "company_name": "WhiteCrow",
    "skills": "excel"
  },
  {
    "job_id": 740073,
    "job_title": "Data Analytics Manager",
    "salary_year_avg": "137000.0",
    "company_name": "WhiteCrow",
    "skills": "powerpoint"
  },
  {
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "EPIC Brokers",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "InvestM Technology LLC",
    "skills": "sql"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "InvestM Technology LLC",
    "skills": "excel"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "company_name": "InvestM Technology LLC",
    "skills": "power bi"
  },
  {
    "job_id": 777802,
    "job_title": "Lead Data Analyst / SQL Developer",
    "salary_year_avg": "135000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 777802,
    "job_title": "Lead Data Analyst / SQL Developer",
    "salary_year_avg": "135000.0",
    "company_name": "Robert Half",
    "skills": "python"
  },
  {
    "job_id": 777802,
    "job_title": "Lead Data Analyst / SQL Developer",
    "salary_year_avg": "135000.0",
    "company_name": "Robert Half",
    "skills": "go"
  },
  {
    "job_id": 777802,
    "job_title": "Lead Data Analyst / SQL Developer",
    "salary_year_avg": "135000.0",
    "company_name": "Robert Half",
    "skills": "c"
  },
  {
    "job_id": 777802,
    "job_title": "Lead Data Analyst / SQL Developer",
    "salary_year_avg": "135000.0",
    "company_name": "Robert Half",
    "skills": "sql server"
  },
  {
    "job_id": 513988,
    "job_title": "Data Analyst - Advanced Analytics",
    "salary_year_avg": "135000.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "sql"
  },
  {
    "job_id": 513988,
    "job_title": "Data Analyst - Advanced Analytics",
    "salary_year_avg": "135000.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "python"
  },
  {
    "job_id": 513988,
    "job_title": "Data Analyst - Advanced Analytics",
    "salary_year_avg": "135000.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "r"
  },
  {
    "job_id": 513988,
    "job_title": "Data Analyst - Advanced Analytics",
    "salary_year_avg": "135000.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "sas"
  },
  {
    "job_id": 513988,
    "job_title": "Data Analyst - Advanced Analytics",
    "salary_year_avg": "135000.0",
    "company_name": "Get It Recruit - Hospitality",
    "skills": "sas"
  },
  {
    "job_id": 311931,
    "job_title": "Data Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "SoftDev Incorporated",
    "skills": "sql"
  },
  {
    "job_id": 311931,
    "job_title": "Data Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "SoftDev Incorporated",
    "skills": "python"
  },
  {
    "job_id": 311931,
    "job_title": "Data Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "SoftDev Incorporated",
    "skills": "r"
  },
  {
    "job_id": 311931,
    "job_title": "Data Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "SoftDev Incorporated",
    "skills": "sheets"
  },
  {
    "job_id": 990420,
    "job_title": "Data Insights Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 990420,
    "job_title": "Data Insights Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 990420,
    "job_title": "Data Insights Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 990420,
    "job_title": "Data Insights Analyst III",
    "salary_year_avg": "132500.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 262837,
    "job_title": "Quantitative Scientist (Remote)",
    "salary_year_avg": "132500.0",
    "company_name": "Osmind",
    "skills": "sql"
  },
  {
    "job_id": 262837,
    "job_title": "Quantitative Scientist (Remote)",
    "salary_year_avg": "132500.0",
    "company_name": "Osmind",
    "skills": "python"
  },
  {
    "job_id": 262837,
    "job_title": "Quantitative Scientist (Remote)",
    "salary_year_avg": "132500.0",
    "company_name": "Osmind",
    "skills": "r"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "sql"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "python"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "r"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "databricks"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "aws"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "redshift"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "snowflake"
  },
  {
    "job_id": 447569,
    "job_title": "Lead Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "tableau"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "sql"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "azure"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "aws"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "snowflake"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "excel"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "tableau"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "power bi"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "dax"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "visio"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "flow"
  },
  {
    "job_id": 92703,
    "job_title": "Sr. Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Launch Consulting Group",
    "skills": "jira"
  },
  {
    "job_id": 21451,
    "job_title": "Data Analyst must have telecom domain experince",
    "salary_year_avg": "130000.0",
    "company_name": "ApTask",
    "skills": "sql"
  },
  {
    "job_id": 21451,
    "job_title": "Data Analyst must have telecom domain experince",
    "salary_year_avg": "130000.0",
    "company_name": "ApTask",
    "skills": "python"
  },
  {
    "job_id": 21451,
    "job_title": "Data Analyst must have telecom domain experince",
    "salary_year_avg": "130000.0",
    "company_name": "ApTask",
    "skills": "sheets"
  },
  {
    "job_id": 21451,
    "job_title": "Data Analyst must have telecom domain experince",
    "salary_year_avg": "130000.0",
    "company_name": "ApTask",
    "skills": "flow"
  },
  {
    "job_id": 1531276,
    "job_title": "System Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Alpha Silicon",
    "skills": "sql"
  },
  {
    "job_id": 1531276,
    "job_title": "System Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Alpha Silicon",
    "skills": "python"
  },
  {
    "job_id": 1531276,
    "job_title": "System Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Alpha Silicon",
    "skills": "sheets"
  },
  {
    "job_id": 1531276,
    "job_title": "System Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Alpha Silicon",
    "skills": "flow"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "sql"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "python"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "spark"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "pandas"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "numpy"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "unix"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "git"
  },
  {
    "job_id": 1209798,
    "job_title": "Data Analyst",
    "salary_year_avg": "130000.0",
    "company_name": "Doximity",
    "skills": "github"
  },
  {
    "job_id": 1686779,
    "job_title": "Data Insights Manager",
    "salary_year_avg": "130000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1686779,
    "job_title": "Data Insights Manager",
    "salary_year_avg": "130000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 1686779,
    "job_title": "Data Insights Manager",
    "salary_year_avg": "130000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 1686779,
    "job_title": "Data Insights Manager",
    "salary_year_avg": "130000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql server"
  },
  {
    "job_id": 1686779,
    "job_title": "Data Insights Manager",
    "salary_year_avg": "130000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1686779,
    "job_title": "Data Insights Manager",
    "salary_year_avg": "130000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 1686779,
    "job_title": "Data Insights Manager",
    "salary_year_avg": "130000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 1566076,
    "job_title": "Manager, Data Analytics (Bioscience) - Remote",
    "salary_year_avg": "129000.0",
    "company_name": "Lonza",
    "skills": "python"
  },
  {
    "job_id": 1566076,
    "job_title": "Manager, Data Analytics (Bioscience) - Remote",
    "salary_year_avg": "129000.0",
    "company_name": "Lonza",
    "skills": "power bi"
  },
  {
    "job_id": 1791785,
    "job_title": "Marketing Data Analyst (Remote)",
    "salary_year_avg": "127000.0",
    "company_name": "Cash App",
    "skills": "sql"
  },
  {
    "job_id": 1791785,
    "job_title": "Marketing Data Analyst (Remote)",
    "salary_year_avg": "127000.0",
    "company_name": "Cash App",
    "skills": "go"
  },
  {
    "job_id": 1791785,
    "job_title": "Marketing Data Analyst (Remote)",
    "salary_year_avg": "127000.0",
    "company_name": "Cash App",
    "skills": "c"
  },
  {
    "job_id": 1791785,
    "job_title": "Marketing Data Analyst (Remote)",
    "salary_year_avg": "127000.0",
    "company_name": "Cash App",
    "skills": "twilio"
  },
  {
    "job_id": 1148444,
    "job_title": "Data Analyst",
    "salary_year_avg": "127000.0",
    "company_name": "Acorns",
    "skills": "outlook"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "sql"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "python"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "r"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "tableau"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "spss"
  },
  {
    "job_id": 116211,
    "job_title": "Sr Data Analyst - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealthcare",
    "skills": "sql"
  },
  {
    "job_id": 116211,
    "job_title": "Sr Data Analyst - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealthcare",
    "skills": "sql server"
  },
  {
    "job_id": 116211,
    "job_title": "Sr Data Analyst - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealthcare",
    "skills": "ssis"
  },
  {
    "job_id": 116211,
    "job_title": "Sr Data Analyst - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealthcare",
    "skills": "ssrs"
  },
  {
    "job_id": 502626,
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealth Group",
    "skills": "sql"
  },
  {
    "job_id": 502626,
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealth Group",
    "skills": "python"
  },
  {
    "job_id": 502626,
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealth Group",
    "skills": "r"
  },
  {
    "job_id": 502626,
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealth Group",
    "skills": "sas"
  },
  {
    "job_id": 502626,
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealth Group",
    "skills": "aws"
  },
  {
    "job_id": 502626,
    "job_title": "Sr Data Analyst, Consultant - Client Facing - Remote",
    "salary_year_avg": "126000.0",
    "company_name": "UnitedHealth Group",
    "skills": "sas"
  },
  {
    "job_id": 1735665,
    "job_title": "Mid-Level Decision Science Analyst",
    "salary_year_avg": "125930.0",
    "company_name": "USAA",
    "skills": "sql"
  },
  {
    "job_id": 1735665,
    "job_title": "Mid-Level Decision Science Analyst",
    "salary_year_avg": "125930.0",
    "company_name": "USAA",
    "skills": "sas"
  },
  {
    "job_id": 1735665,
    "job_title": "Mid-Level Decision Science Analyst",
    "salary_year_avg": "125930.0",
    "company_name": "USAA",
    "skills": "phoenix"
  },
  {
    "job_id": 1735665,
    "job_title": "Mid-Level Decision Science Analyst",
    "salary_year_avg": "125930.0",
    "company_name": "USAA",
    "skills": "sas"
  },
  {
    "job_id": 748965,
    "job_title": "Strategy and Data Analyst, Sustainability",
    "salary_year_avg": "125500.0",
    "company_name": "Uber",
    "skills": "sql"
  },
  {
    "job_id": 748965,
    "job_title": "Strategy and Data Analyst, Sustainability",
    "salary_year_avg": "125500.0",
    "company_name": "Uber",
    "skills": "python"
  },
  {
    "job_id": 748965,
    "job_title": "Strategy and Data Analyst, Sustainability",
    "salary_year_avg": "125500.0",
    "company_name": "Uber",
    "skills": "r"
  },
  {
    "job_id": 748965,
    "job_title": "Strategy and Data Analyst, Sustainability",
    "salary_year_avg": "125500.0",
    "company_name": "Uber",
    "skills": "go"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "sql"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "python"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "r"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "sas"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "databricks"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "snowflake"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "sas"
  },
  {
    "job_id": 900945,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "The Walt Disney Company",
    "skills": "spss"
  },
  {
    "job_id": 285447,
    "job_title": "Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Robert Half",
    "skills": "flow"
  },
  {
    "job_id": 1229773,
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "salary_year_avg": "125000.0",
    "company_name": "Infinity Consulting Solutions, Inc.",
    "skills": "sql"
  },
  {
    "job_id": 1229773,
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "salary_year_avg": "125000.0",
    "company_name": "Infinity Consulting Solutions, Inc.",
    "skills": "go"
  },
  {
    "job_id": 1229773,
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "salary_year_avg": "125000.0",
    "company_name": "Infinity Consulting Solutions, Inc.",
    "skills": "excel"
  },
  {
    "job_id": 1229773,
    "job_title": "Manager, Data Analytics & Reporting - Remote",
    "salary_year_avg": "125000.0",
    "company_name": "Infinity Consulting Solutions, Inc.",
    "skills": "notion"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "sql"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "python"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "r"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "bash"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "postgresql"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "bigquery"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "airflow"
  },
  {
    "job_id": 1216840,
    "job_title": "Data Analyst, Operations (Remote)",
    "salary_year_avg": "125000.0",
    "company_name": "hims & hers",
    "skills": "looker"
  },
  {
    "job_id": 400967,
    "job_title": "Healthcare Data Analyst (Manager)- $120,000-130,000/yr | Remote in PST",
    "salary_year_avg": "125000.0",
    "company_name": "PWR Staffing & Recruiting",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "python"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "shell"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "bigquery"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "redshift"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "spark"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "airflow"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "jupyter"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "python"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "r"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "vba"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "alteryx"
  },
  {
    "job_id": 1551308,
    "job_title": "Investment Data and Analytics Manager",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "flow"
  },
  {
    "job_id": 595967,
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "salary_year_avg": "125000.0",
    "company_name": "Starbridge Partners",
    "skills": "sql"
  },
  {
    "job_id": 595967,
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "salary_year_avg": "125000.0",
    "company_name": "Starbridge Partners",
    "skills": "python"
  },
  {
    "job_id": 595967,
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "salary_year_avg": "125000.0",
    "company_name": "Starbridge Partners",
    "skills": "r"
  },
  {
    "job_id": 595967,
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "salary_year_avg": "125000.0",
    "company_name": "Starbridge Partners",
    "skills": "sas"
  },
  {
    "job_id": 595967,
    "job_title": "Data Science Analyst 2 (Pop Health)",
    "salary_year_avg": "125000.0",
    "company_name": "Starbridge Partners",
    "skills": "sas"
  },
  {
    "job_id": 1682817,
    "job_title": "Data Analyst: regional physical security",
    "salary_year_avg": "124500.0",
    "company_name": "Blackstone Consulting, Inc.",
    "skills": "excel"
  },
  {
    "job_id": 1682817,
    "job_title": "Data Analyst: regional physical security",
    "salary_year_avg": "124500.0",
    "company_name": "Blackstone Consulting, Inc.",
    "skills": "power bi"
  },
  {
    "job_id": 1682817,
    "job_title": "Data Analyst: regional physical security",
    "salary_year_avg": "124500.0",
    "company_name": "Blackstone Consulting, Inc.",
    "skills": "word"
  },
  {
    "job_id": 1682817,
    "job_title": "Data Analyst: regional physical security",
    "salary_year_avg": "124500.0",
    "company_name": "Blackstone Consulting, Inc.",
    "skills": "sharepoint"
  },
  {
    "job_id": 1682817,
    "job_title": "Data Analyst: regional physical security",
    "salary_year_avg": "124500.0",
    "company_name": "Blackstone Consulting, Inc.",
    "skills": "powerpoint"
  },
  {
    "job_id": 1682817,
    "job_title": "Data Analyst: regional physical security",
    "salary_year_avg": "124500.0",
    "company_name": "Blackstone Consulting, Inc.",
    "skills": "microsoft teams"
  },
  {
    "job_id": 821092,
    "job_title": "Data Analyst, Support Operations",
    "salary_year_avg": "124000.0",
    "company_name": "Cloudflare",
    "skills": "sql"
  },
  {
    "job_id": 821092,
    "job_title": "Data Analyst, Support Operations",
    "salary_year_avg": "124000.0",
    "company_name": "Cloudflare",
    "skills": "python"
  },
  {
    "job_id": 821092,
    "job_title": "Data Analyst, Support Operations",
    "salary_year_avg": "124000.0",
    "company_name": "Cloudflare",
    "skills": "r"
  },
  {
    "job_id": 821092,
    "job_title": "Data Analyst, Support Operations",
    "salary_year_avg": "124000.0",
    "company_name": "Cloudflare",
    "skills": "tableau"
  },
  {
    "job_id": 821092,
    "job_title": "Data Analyst, Support Operations",
    "salary_year_avg": "124000.0",
    "company_name": "Cloudflare",
    "skills": "looker"
  },
  {
    "job_id": 631753,
    "job_title": "Data Analytics Manager",
    "salary_year_avg": "123000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sql"
  },
  {
    "job_id": 631753,
    "job_title": "Data Analytics Manager",
    "salary_year_avg": "123000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 631753,
    "job_title": "Data Analytics Manager",
    "salary_year_avg": "123000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 631753,
    "job_title": "Data Analytics Manager",
    "salary_year_avg": "123000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "looker"
  },
  {
    "job_id": 596565,
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "salary_year_avg": "122769.0",
    "company_name": "ICF",
    "skills": "sql"
  },
  {
    "job_id": 596565,
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "salary_year_avg": "122769.0",
    "company_name": "ICF",
    "skills": "python"
  },
  {
    "job_id": 596565,
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "salary_year_avg": "122769.0",
    "company_name": "ICF",
    "skills": "tableau"
  },
  {
    "job_id": 596565,
    "job_title": "Lead Analyst - Data Analytics - Remote",
    "salary_year_avg": "122769.0",
    "company_name": "ICF",
    "skills": "power bi"
  },
  {
    "job_id": 1015777,
    "job_title": "Decision Science Analyst - Consumer Lending",
    "salary_year_avg": "122500.0",
    "company_name": "Analytic Recruiting Inc.",
    "skills": "sql"
  },
  {
    "job_id": 1015777,
    "job_title": "Decision Science Analyst - Consumer Lending",
    "salary_year_avg": "122500.0",
    "company_name": "Analytic Recruiting Inc.",
    "skills": "python"
  },
  {
    "job_id": 1015777,
    "job_title": "Decision Science Analyst - Consumer Lending",
    "salary_year_avg": "122500.0",
    "company_name": "Analytic Recruiting Inc.",
    "skills": "sas"
  },
  {
    "job_id": 1015777,
    "job_title": "Decision Science Analyst - Consumer Lending",
    "salary_year_avg": "122500.0",
    "company_name": "Analytic Recruiting Inc.",
    "skills": "snowflake"
  },
  {
    "job_id": 1015777,
    "job_title": "Decision Science Analyst - Consumer Lending",
    "salary_year_avg": "122500.0",
    "company_name": "Analytic Recruiting Inc.",
    "skills": "tableau"
  },
  {
    "job_id": 1015777,
    "job_title": "Decision Science Analyst - Consumer Lending",
    "salary_year_avg": "122500.0",
    "company_name": "Analytic Recruiting Inc.",
    "skills": "sas"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "sql"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "aws"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "jira"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "confluence"
  },
  {
    "job_id": 298860,
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "Cloudflare",
    "skills": "sql"
  },
  {
    "job_id": 298860,
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "Cloudflare",
    "skills": "bigquery"
  },
  {
    "job_id": 298860,
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "Cloudflare",
    "skills": "tableau"
  },
  {
    "job_id": 298860,
    "job_title": "Sales Ops Data Analyst (Austin, TX or Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "Cloudflare",
    "skills": "sheets"
  },
  {
    "job_id": 426033,
    "job_title": "Sales Ops Data Analyst (Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "CloudFlare",
    "skills": "sql"
  },
  {
    "job_id": 426033,
    "job_title": "Sales Ops Data Analyst (Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "CloudFlare",
    "skills": "bigquery"
  },
  {
    "job_id": 426033,
    "job_title": "Sales Ops Data Analyst (Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "CloudFlare",
    "skills": "tableau"
  },
  {
    "job_id": 426033,
    "job_title": "Sales Ops Data Analyst (Remote)",
    "salary_year_avg": "122000.0",
    "company_name": "CloudFlare",
    "skills": "sheets"
  },
  {
    "job_id": 1191992,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 1191992,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Robert Half",
    "skills": "tableau"
  },
  {
    "job_id": 1191992,
    "job_title": "Business Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Robert Half",
    "skills": "power bi"
  },
  {
    "job_id": 1611348,
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "salary_year_avg": "120000.0",
    "company_name": "M13",
    "skills": "sql"
  },
  {
    "job_id": 1611348,
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "salary_year_avg": "120000.0",
    "company_name": "M13",
    "skills": "r"
  },
  {
    "job_id": 1611348,
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "salary_year_avg": "120000.0",
    "company_name": "M13",
    "skills": "sas"
  },
  {
    "job_id": 1611348,
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "salary_year_avg": "120000.0",
    "company_name": "M13",
    "skills": "sas"
  },
  {
    "job_id": 1611348,
    "job_title": "Lifeforce: Data Analyst (Remote)",
    "salary_year_avg": "120000.0",
    "company_name": "M13",
    "skills": "spss"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "sql"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "go"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "excel"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "tableau"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "word"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "kubernetes"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "jira"
  },
  {
    "job_id": 999820,
    "job_title": "Business Intelligence Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "LAI",
    "skills": "confluence"
  },
  {
    "job_id": 236172,
    "job_title": "Data Analytics Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "excel"
  },
  {
    "job_id": 236172,
    "job_title": "Data Analytics Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "tableau"
  },
  {
    "job_id": 236172,
    "job_title": "Data Analytics Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "power bi"
  },
  {
    "job_id": 236172,
    "job_title": "Data Analytics Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "sharepoint"
  },
  {
    "job_id": 236172,
    "job_title": "Data Analytics Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "powerpoint"
  },
  {
    "job_id": 236172,
    "job_title": "Data Analytics Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "outlook"
  },
  {
    "job_id": 236172,
    "job_title": "Data Analytics Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skills": "visio"
  },
  {
    "job_id": 1813730,
    "job_title": "Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Planet Technology",
    "skills": "sql"
  },
  {
    "job_id": 1813730,
    "job_title": "Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Planet Technology",
    "skills": "t-sql"
  },
  {
    "job_id": 1813730,
    "job_title": "Data Analyst",
    "salary_year_avg": "120000.0",
    "company_name": "Planet Technology",
    "skills": "power bi"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "sql"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "azure"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "aws"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "bigquery"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "redshift"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "snowflake"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "gcp"
  },
  {
    "job_id": 587198,
    "job_title": "Data Architect",
    "salary_year_avg": "120000.0",
    "company_name": "Motion Recruitment",
    "skills": "tableau"
  },
  {
    "job_id": 1132443,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "119908.0",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "skills": "python"
  },
  {
    "job_id": 1132443,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "119908.0",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "skills": "vba"
  },
  {
    "job_id": 1132443,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "119908.0",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "skills": "tableau"
  },
  {
    "job_id": 1132443,
    "job_title": "Risk Data Analyst",
    "salary_year_avg": "119908.0",
    "company_name": "US Development Finance Corporation (formerly Overseas Private Investment Corporation)",
    "skills": "power bi"
  }
]
*/