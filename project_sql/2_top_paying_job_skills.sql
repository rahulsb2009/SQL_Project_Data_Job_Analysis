
WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name

    FROM
        job_postings_fact

    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

    WHERE 
        job_title_short='Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL

    ORDER BY 
        salary_year_avg DESC

    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_job_dim.skill_id,
    skills_dim.skills

FROM top_paying_jobs

INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id


/*

The analysis of the skills column reveals the following insights about the most common skills required for the top analyst roles in 2023:

SQL is the most frequently mentioned skill, appearing 8 times.
Python is close behind, appearing 7 times.
Tableau is also highly sought after, with 6 mentions.
R is mentioned 4 times.
Snowflake, Pandas, and Excel each appear 3 times.
Azure, Bitbucket, and Go are mentioned 2 times each.


  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 5,
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 74,
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 75,
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 76,
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 93,
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 95,
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 102,
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 181,
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 182,
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 183,
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skill_id": 196,
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skill_id": 5,
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skill_id": 97,
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "skill_id": 182,
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skill_id": 23,
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skill_id": 79,
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skill_id": 182,
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "skill_id": 215,
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 8,
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 80,
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 93,
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 94,
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 181,
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 182,
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "skill_id": 220,
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 74,
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 76,
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 79,
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 80,
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 182,
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 183,
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 189,
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 211,
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 218,
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 219,
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 233,
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "skill_id": 234,
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 5,
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 210,
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 218,
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 219,
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 233,
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "skill_id": 234,
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 8,
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 80,
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 93,
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 94,
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 181,
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 182,
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "skill_id": 220,
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skill_id": 0,
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skill_id": 1,
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "skill_id": 5,
    "skills": "r"
  }
]

*/