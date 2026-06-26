# Introduction
This project analyzes real job postings data to uncover what skills are in demand, how they correlate with salary, and what the remote work landscape looks like for Data Analysts. Through SQL queries and data exploration, it identifies skill gaps, salary trends, and the most valuable skill combinations based on the used database from 2023. 

SQL Queries? Check them out here: [project_sql](/project_sql/)
# Background
This project represents my intentional transition into technology. After years working outside the tech industry, I committed to building the skills necessary for a career pivot. At 26, I'm pursuing my long-standing interest in tech through deliberate, hands-on learning.
Using a real job postings database, I've built SQL expertise while analyzing the Data Analyst market — identifying skill demand, salary correlations, and career pathways. This is both a learning exercise and a practical tool: understanding what the market values helps me target my skill development strategically.
### The questions I wanted to answer through my SQL queries were:
1. What are the top paying data analyst jobs?
2. What skills are required for these top paying jobs?
3. What skills are most in demand for Data 
Analysts?
4. Which skills are associated with higher 
salaries?
5. What are the most optimal skills to learn? 
# Tools I Used
- **SQL** This allowed me to be able to actually query the database I was using and find insights based on the questions that I answered. 
- **PostgreSQL** This was the database management system used for the job posting data.
- **Visual Studio Code** Used for Database Management and executing my SQL queries. 
- **Git and Github** This was used for essential version control and allowing me to track my queries and building a repository that the data can be shared and collaberated on.
# The Analysis
Each query for this projects intention were to investigate the Data Analyst job market and find out what skills are necessary for breaking into this field along with what deep dive skills can get you the highest paying positions. 
Here's how I approached each question: 
### 1. Top Paying Data Analyst Jobs
To find out what the highest paying roles were in the Data Analyst field I filtered through this database by the avg_yearly_salary for specifically positions that included the title of 'Data Analyst' as well as location set to remote or my current city and state of Orlando, FL. 

```SQL
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Salary Range** Based on the results from this query the salaries ranged from $184,000 to $650,000 indicating a huge range of financial oppurtunity in the data analyst market. 
- **Diverse Employers** Big company names like AT&T and Meta and more top this list showing their commitment to this field.


![Top Paying Roles](assets\1_top_paying_jobs.png)
*Bar graph visualizing the top 10 salaries for Data Analysts; I had Claude generate this graph from my SQL query results.

### 2. Top Paying Data Analyst Job Skills
This was to determine the skills necessary for some of the highest paying jobs in the Data Analyst market. I limited it to 10 and recieved 66 results due to it giving me the multitude of skills for each company. 


```sql
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
```
Here's the breakdown of the top paying skills for Data Analysts in 2023:
- **Skill Stacking** As expected the results from this query are that a multitude of skills are required for a higher paying role in the Data Analyst field. Knowing the foundational skills is a must on a path to get into these higher paying roles. 


![Top Paying Job Skills](assets\2_top_paying_job_skills.png)
*Bar graph visualizing top paying skills in the Data Analyst field. 

### 3. Top Skills In Demand For Data Analysts
The intention for this one was to find the most mentioned skills in the entire database. For this I used aggregate functions to be able to determine the amount of times each skills was mentioned across the job postings. 

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Here's the breakdown for the most in demand skills required for a Data Analyst role:
- **Skills** The 5 most in demand skills for a Data Analyst role is SQL, Excel, Python, Tableau, and Power Bi.


![Top Skills In Demand](assets\3_Job_skills_demand.png)
*Bar graph visualizing the most demanded skills based on the total job postings. 


### 4. Top Paying Skills
This query was performed to identify what skills actually translate to the highest financial compensation.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_work_from_home = True AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
Here's the breakdown for the highest paying skills in the Data Analyst field:
- **Pyspark** This skill set pertains to the highest earners in the field.
- **SQL Missing** The data shows the among the top 25 highest salary jobs SQL is not part of this list. This means that upon learning SQL more specialization is required in other skills to earn a higher compensated position.  


![Top Paying Skills](assets\4_skills_by_salary.png)
*Bar graph visualizing the skills that correlate to the highest earnings. 

### 5. Optimal Skills 
This query shows the skills that are foundational to a data analysts path. By increasing the demand_count in the code block below it shows how many times skills like SQL, Excel, Python, Tableau, and Power BI are mentioned across the board as those prime skills needed. 

```sql
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
```
Here's the breakdown for the optimal skills in the Data Analyst field:
- **SQL #1** SQL is by far the most sought after skill in the Data Analyst field but correlates to the lowest salary. 
This is because it is a foundational stepping stone skill to be able to qualify for Data Analytics. 
- **The Stack** Python + Tableau + SQL are the top 3 most demanded skills that correspond to highest paid among foundational skills. This is the foundational stack to get into Data Analytics. 

![Optimal Skills](assets\5_skills_in_demand.png)
*Bar graph visualizing the skills optimal to obtaining a job among Data Analysts.  

# What I Learned
- **My Skill Learning** I started this project with simple queries using SELECT, FROM, and one table. Through this project I learned how to make complex queries using cases, CTE's, aggregates, Joins, multiple tables, and many more key commands.
- **Building A Database** I learned the proper software necessary to build, implement, manipulate, and query through a database. Examples include **pgAdmin4**- (Used for database management), **Visual Studio Code**- (Allows for connection to the database, writing and executing queries, navigating results, and Version control through GitHub), **GitHub**- (Teaches and allows me to build a repository that I can share and to collaborate on), **Claude/Generative AI**- (Used to work through mistakes made in syntax. Helps quicken some processes like helping me search through the results that I have queried. And overall a tool to make learning and navigating much easier.)
- **SQL is table stakes, not premium** — Despite being the most in-demand skill (7,291 jobs), SQL correlates to the lowest salaries ($97K). - - -This means SQL alone won't break into higher-paying roles; you need specialization on top of it. The path to $150K+ requires SQL + Python + Tableau + specialized tools (PySpark, DataRobot, etc.).
- **Skill stacking pays significantly more** — Top-paying roles ($184K–$650K) require 5–7 skills working together, not just one expertise. The data shows that programming languages (Python, R) outpay traditional tools by $2K–$4K on average. Combining SQL + Python + cloud tools (AWS, Azure, Databricks) is where the premium salaries live.
- **Remote work compresses but doesn't eliminate pay gaps** — Remote data analyst roles show only a $14K spread ($87K–$101K) vs. all roles which span $121K–$208K. Remote work filters for mid-tier positions, but Python still commands the highest remote salary. The strategic move is Python + Tableau for stable remote work at $99K–$101K, or add specialization (PySpark, BigData tools) for breakthrough roles above $180K.

# Conclusions
### Insights 
1. The SQL Trap — SQL is the #1 most demanded skill (7,291 jobs) but correlates to the lowest salary ($97K). High demand ≠ high pay. It's table stakes to enter the field, not a differentiator. You need SQL + specialization to break into $150K+ roles.
2. Programming > Query Skills (Financially) — Python ($101K remote, $149K overall) and R ($100K remote) outpay Tableau ($99K) and Power BI ($97K) by $2K–$4K on average. The market values people who can code and manipulate data, not just visualize it.
3. Skill Stacking = Salary Jump — Top-paying roles ($184K–$650K) require 5–7 skills combined. The winning stack is: SQL + Python + Tableau + Cloud (AWS/Azure) for $150K+. Add PySpark/Databricks and you hit $200K+. Single skills ceiling around $101K.
4. Remote Work Trades Ceiling for Stability — Remote analyst roles compress to $87K–$101K range (14K spread) vs. all roles spanning $121K–$208K. Remote work is reliable mid-tier ($99K with Python/Tableau), but breaking $180K requires in-person or director-level roles.
5. Your Optimal Path — Start with SQL (non-negotiable), add Python (highest remote ROI), then Tableau (closes salary gap with programming). This triple stack is demanded across 82% of postings and delivers $99K–$101K stable remote income. From there, layer in specialization (PySpark, cloud, DataRobot) to reach $150K+.

### Closing Thoughts
I've thoroughly enjoyed building this project portfolio. Coming from zero SQL knowledge to designing my own databases and querying them confidently represents a significant milestone in my data analyst journey.
This analysis was built on a dataset from Luke Barousse, a respected voice in the data analyst field whose teachings provided the foundation for this work. Beyond his curriculum, I've reinforced my learning through practice on platforms like HackerRank, building muscle memory in writing queries, debugging logic, and extracting meaningful insights from data.
What started as unfamiliar syntax has become a toolkit — I can now navigate databases confidently, construct efficient queries, and translate raw data into actionable career intelligence. This project proved to be both a learning exercise and a practical guide for my own path forward.
The insights I've uncovered here aren't just academic. They directly inform my skill development strategy: SQL as the foundation, Python as the differentiator, and specialization as the accelerator toward higher-paying roles.
I'm committed to stacking the skills this market demands — daily practice, deliberate learning, and continuous refinement. Tech has always been my dream, and this project is evidence that intentional effort compounds. The work continues.