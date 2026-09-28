SQL Employee, Department & Project Analysis
📌 Project Overview
This project demonstrates my practical SQL skills through analysis of employee, department, salary, and project data.

The project uses relational datasets to answer business-related questions involving employee information, departments, salaries, employment dates, and project assignments.

The analysis focuses on extracting meaningful information from multiple related tables using SQL queries, joins, filtering, aggregation, date analysis, and subqueries.

🎯 Objectives
The main objectives of this project were to:

Retrieve and analyse employee information
Analyse employee salaries across departments
Connect employees with their respective departments
Analyse employee joining dates and tenure
Calculate department-level salary metrics
Analyse employee project assignments
Identify employees working on multiple projects
Analyse project start and end dates
Calculate project and employee statistics
Use SQL to answer practical business questions

🗂️ Dataset
The project contains three main datasets:

1. employees_large.csv
Contains employee-related information used for analysing:

Employee names
Salaries
Joining dates
Department assignments
Employee-level metrics

2. departments_large.csv
Contains department information used to connect employees to their respective departments and perform department-level analysis.

3. projects_large.csv
Contains project assignment information, including:

Project ID
Project name
Employee ID
Project start date
Project end date
The project dataset allows analysis of employee project assignments, project timelines, ongoing projects, and employees working on multiple projects.

🔗 Data Relationships
The datasets are connected through common identifiers.

departments_large.csv
        │
        │ Department ID
        ▼
employees_large.csv
        │
        │ Employee ID
        ▼
projects_large.csv
This relational structure allows SQL queries to combine employee, department, and project information for more detailed analysis.

🛠️ SQL Skills Demonstrated
Data Retrieval & Filtering
SELECT
WHERE
ORDER BY
Filtering by salary
Filtering by department
Filtering by joining date
Filtering by project dates
Joins
INNER JOIN
LEFT JOIN
Joining employees with departments
Joining employees with projects
Combining employee, department and project information
Aggregation
COUNT()
SUM()
AVG()
MAX()
GROUP BY
Date Analysis
Employee joining-date analysis
Employee tenure analysis
Project start-date analysis
Project end-date analysis
Identifying ongoing projects
Advanced SQL Concepts
Subqueries
Multiple-table analysis
Conditional filtering
Department-level comparisons
Employee project-count analysis
Multiple-project analysis

🔍 Business Questions Explored
The project addresses practical questions such as:

Employee & Department Analysis
Which employees belong to each department?
Which employees earn more than 70,000?
Which employees joined after January 1, 2020?
How many employees are in each department?
Which employees belong to the Sales department?
Which employees have been with the company for more than two years?
Which employees have the highest salary in each department?
What is the total salary expense for each department?
What is the average salary in each department?
Which department has the highest average salary?
Project Analysis
Which employees are assigned to projects?
Which employees are working on the project Customer Satisfaction Analysis?
Which employees are not assigned to any project?
How many employees in each department are working on projects?
Which employees work on projects ending after December 31, 2021?
Which employees are working on more than one project?
Which employees are assigned to projects that started after January 1, 2021 and are still ongoing?
How many projects is each employee working on?
Which employees are working on Employee Performance Analytics?
How many projects is each department handling?
Which department has the maximum number of employees working on multiple projects?
These questions provide practical experience in combining employee, department and project data using SQL.

📊 Key Analysis Areas

👥 Employee Analysis
Analysis of employee salaries, joining dates, tenure, department membership and project participation.

🏢 Department Analysis
Comparison of employee counts, salary expenses, average salaries and project activity across departments.

📁 Project Analysis
Analysis of project assignments, project timelines, ongoing projects and employees participating in multiple projects.

💰 Salary Analysis
Analysis of employee compensation using total salary expenses, average salaries and highest-paid employees across departments.

🔎 Key Insights
1. Legal & Compliance had the highest total salary expense at $17.71M, followed by Human Resources ($17.32M) and Finance & Accounting ($17.05M).
 
2. Finance & Accounting recorded the highest average salary at $84,415.32.

3. Total Employees were highest in Legal & Compliance and Human Resources (216 employees each).

4. Hiring peaked in 2022 with 415 employees joining, followed by 2024 with 404 and 2021 with 394.

5. Customer Service Department handled the highest number of projects (4), while R&D, Sales, Procurement & Supply Chain, and HR handled 3 projects each.

6. No employee was assigned to more than one project, indicating that employees had single-project assignments in the dataset.

📁 Repository Structure
SQL-Employee-Department-Project-Analysis/
│
├── README.md
│
├── employees_large.csv
├── departments_large.csv
├── projects_large.csv
│
├── Practice questions.docx
│
└── SQL/
    ├── employee_analysis.sql
    ├── department_analysis.sql
    └── project_analysis.sql

💡 What I Learned
This project strengthened my ability to work with relational datasets and use SQL to transform raw data into meaningful business information.

Through this project, I developed practical experience in:

Writing SQL queries to answer business questions
Joining multiple relational datasets
Filtering and sorting data
Performing aggregation and grouping
Analysing employee salaries
Working with dates
Analysing employee tenure
Analysing project assignments and timelines
Identifying employees working across multiple projects
Using SQL to derive business insights
🚀 Future Improvements
I plan to continue expanding my SQL portfolio by working with larger and more complex datasets and applying SQL to areas such as:

Financial analysis
Customer analytics
Sales analysis
Business intelligence
Data quality analysis
Workforce analytics
👩🏽‍💻 About Me
I am an Economics and Data Analytics professional interested in using data to identify trends, solve business problems and support data-driven decision-making.

Skills: SQL | Power BI | Excel | Data Analytics | Economics

⭐ This project is part of my growing data analytics portfolio.

