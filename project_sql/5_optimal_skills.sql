/*
Question: What are the most optimal skills to learn (aka it's in high demand and  high paying skill?)
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrates on remote positions with specified salaries.
- Why? Targets skills that off job security and financial benefits,
    offering strategic insights for career development in data anlysis.
*/


SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = True AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(skills_job_dim.job_id) > 50
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;


/*
Below are some insights and results from this query. 
SQL is table stakes, not premium — Highest demand (398 jobs) but lowest salary ($97K), meaning it's essential but not a differentiator in remote roles
Python/R command a premium — Python ($101K) and R ($100K) both pay more than SQL despite lower demand (236 and 148), showing programming languages are more valuable than query skills
Tableau beats Power BI — Higher demand (230 vs 110) and higher salary ($99K vs $97K), reinforcing Tableau as the dominant BI tool even in remote work
Excel is the paradox — Second-highest demand (256) but lowest salary ($87K), suggesting it's a supporting skill paired with others rather than a standalone value driver
[
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "110",
    "avg_salary": "97431"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "398",
    "avg_salary": "97237"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "58",
    "avg_salary": "88701"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "256",
    "avg_salary": "87288"
  }
]
*/