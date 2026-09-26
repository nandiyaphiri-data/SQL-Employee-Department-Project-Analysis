-- Creating Departments Table
CREATE TABLE departments_large (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);


-- Creating Employees Table (FACT TABLE)
CREATE TABLE employees_large (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT REFERENCES departments_large(DepartmentID),
    Salary NUMERIC(10, 2),
    JoiningDate TEXT,
	Full_name VARCHAR (50)
);


-- Creating Projects Table
CREATE TABLE projects_large (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(150),
    EmployeeID INT REFERENCES employees_large(EmployeeID),
    StartDate TEXT,
    EndDate TEXT
);

SELECT*
FROM employees_large


-- ============================================================
-- 1. List all employees along with the department they belong to
-- ============================================================

SELECT 
    employees_large.EmployeeID,
    employees_large.Full_name,
    departments_large.DepartmentName
FROM employees_large
JOIN departments_large
    ON employees_large.DepartmentID = departments_large.DepartmentID;


-- ============================================================
-- 2. Retrieve the first and last names of employees who earn
--    more than 70,000
-- ============================================================

SELECT 
    FirstName,
    LastName,
	Salary
FROM employees_large
WHERE Salary > 70000
ORDER BY Salary DESC;


-- ============================================================
-- 3. Find all employees who joined after 01/01/2020
-- ============================================================

SELECT 
    EmployeeID,
    Full_name,
    JoiningDate
FROM employees_large
WHERE TO_DATE(JoiningDate, 'MM/DD/YYYY') > DATE '2020-01-01'
ORDER BY TO_DATE(JoiningDate, 'MM/DD/YYYY') DESC;


-- ============================================================
-- 4. List all department names and the number of employees
--    in each department
-- ============================================================

SELECT 
    departments_large.DepartmentName,
    COUNT(employees_large.EmployeeID) AS Total_Employees
FROM departments_large
LEFT JOIN employees_large
    ON departments_large.DepartmentID = employees_large.DepartmentID
GROUP BY 
    departments_large.DepartmentID,
    departments_large.DepartmentName
ORDER BY Total_Employees DESC;
-- ============================================================
-- 5. Get the names of employees who belong to the Sales
--    department
-- ============================================================
SELECT 
    employees_large.Full_name, departments_large.DepartmentName
FROM employees_large 
JOIN departments_large 
    ON employees_large.DepartmentID = departments_large.DepartmentID
WHERE TRIM(LOWER(departments_large.DepartmentName)) = 'sales';


-- ============================================================
-- 6. Show the names of employees and their departments,
--    ordered by salary in descending order
-- ============================================================

SELECT 
    employees_large.Full_name,
    departments_large.DepartmentName,
    employees_large.Salary
FROM employees_large 
JOIN departments_large 
    ON employees_large.DepartmentID = departments_large.DepartmentID
ORDER BY employees_large.Salary DESC;


-- ============================================================
-- 7. List employees who have been with the company
--    for more than 2 years
-- ============================================================

SELECT 
    EmployeeID,
    Full_name,
    JoiningDate
FROM employees_large
WHERE TO_DATE(JoiningDate, 'MM/DD/YYYY') < CURRENT_DATE - INTERVAL '2 years'
ORDER BY TO_DATE(JoiningDate, 'MM/DD/YYYY') ASC;


-- ============================================================
-- 8. Find the employee with the highest salary in each
--    department
-- ============================================================

SELECT 
    DepartmentName,
    Full_name,
    Salary
FROM (
    SELECT 
        departments_large.DepartmentName,
        employees_large.Full_name,
        employees_large.Salary,
        RANK() OVER (
            PARTITION BY employees_large.DepartmentID
            ORDER BY employees_large.Salary DESC
        ) AS salary_rank
    FROM employees_large 
    JOIN departments_large 
        ON employees_large.DepartmentID = departments_large.DepartmentID
) ranked_employees
WHERE salary_rank = 1;


-- ============================================================
-- 9. Retrieve all employees who belong to the HR department
--    and have been with the company for more than 3 years
-- ============================================================
SELECT 
    employees_large.EmployeeID,
    employees_large.Full_name,
    employees_large.JoiningDate,
    departments_large.DepartmentName
FROM employees_large
JOIN departments_large
    ON employees_large.DepartmentID = departments_large.DepartmentID
WHERE departments_large.DepartmentName = 'Human Resources (HR)'
  AND TO_DATE(employees_large.JoiningDate, 'MM/DD/YYYY')
      < CURRENT_DATE - INTERVAL '3 years'
ORDER BY TO_DATE(employees_large.JoiningDate, 'MM/DD/YYYY') ASC;


-- ============================================================
-- 10. Show the total salary expense for each department
-- ============================================================

SELECT 
    departments_large.DepartmentName,
    SUM(employees_large.Salary) AS Total_Salary_Expense
FROM departments_large 
JOIN employees_large 
    ON departments_large.DepartmentID = employees_large.DepartmentID
GROUP BY departments_large.DepartmentID, departments_large.DepartmentName
ORDER BY Total_Salary_Expense DESC;


-- ============================================================
-- 11. List all employees along with the projects they
--     are working on
-- ============================================================

SELECT 
    employees_large.EmployeeID,
    employees_large.Full_name,
    projects_large.ProjectName
FROM employees_large 
JOIN projects_large 
    ON employees_large.EmployeeID = projects_large.EmployeeID
ORDER BY employees_large.EmployeeID;


-- ============================================================
-- 12. Show the names of employees who are working on the
--     project "Customer Satisfaction Analysis"
-- ============================================================

SELECT 
    employees_large.Full_name,
    projects_large.ProjectName
FROM employees_large
JOIN projects_large 
    ON employees_large.EmployeeID = projects_large.EmployeeID
WHERE projects_large.ProjectName = 'Customer Satisfaction Analysis';

-- ============================================================
-- 13. Retrieve all employees who are not assigned to
--     any project
-- ============================================================

SELECT 
    employees_large.Full_name
FROM employees_large 
LEFT JOIN projects_large 
    ON employees_large.EmployeeID = projects_large.EmployeeID
WHERE projects_large.EmployeeID IS NULL;


-- ============================================================
-- 14. Show the department name and the number of employees
--     working on a project in each department
-- ============================================================

SELECT 
departments_large.DepartmentName, 
COUNT(DISTINCT employees_large.EmployeeID) AS Employees_with_Projects 
FROM departments_large 
JOIN employees_large 
ON departments_large.DepartmentID = employees_large.DepartmentID 
JOIN projects_large  
ON employees_large.EmployeeID = projects_large.EmployeeID 
GROUP BY departments_large.DepartmentID, departments_large.DepartmentName 
ORDER BY Employees_with_Projects DESC;
-- ============================================================
-- 15. Find the names of employees who work on a project
--     that ends after 2021-12-31
-- ============================================================

SELECT 
    employees_large.Full_name,
    projects_large.ProjectName,
    projects_large.EndDate
FROM employees_large 
JOIN projects_large 
    ON employees_large.EmployeeID = projects_large.EmployeeID
WHERE TO_DATE(projects_large.EndDate, 'MM/DD/YYYY') > DATE '2021-12-31'
ORDER BY TO_DATE(projects_large.EndDate, 'MM/DD/YYYY') ASC;



-- ============================================================
-- 16. List the employees who work on more than one project
-- ============================================================

SELECT 
    employees_large.EmployeeID,
    employees_large.Full_name,
    COUNT(projects_large.ProjectID) AS Number_Of_Projects
FROM employees_large
JOIN projects_large
    ON employees_large.EmployeeID = projects_large.EmployeeID
GROUP BY employees_large.EmployeeID, employees_large.Full_name
HAVING COUNT(projects_large.ProjectID) > 1
ORDER BY Number_Of_Projects DESC;



-- ============================================================
-- 17. Find employees assigned to projects that started after
--     2021-01-01 and are still ongoing
-- ============================================================

SELECT 
    employees_large.Full_name,
    projects_large.ProjectName,
    projects_large.StartDate
FROM employees_large 
JOIN projects_large 
    ON employees_large.EmployeeID = projects_large.EmployeeID
WHERE TO_DATE(projects_large.StartDate, 'MM/DD/YYYY') > DATE '2021-01-01'
  AND projects_large.EndDate IS NULL;

-- ============================================================
-- 18. Get the total number of projects for each employee
-- ============================================================

SELECT 
    employees_large.EmployeeID,
    employees_large.Full_name,
    COUNT(projects_large.ProjectID) AS TotalProjects
FROM employees_large 
LEFT JOIN projects_large 
    ON employees_large.EmployeeID = projects_large.EmployeeID
GROUP BY employees_large.EmployeeID, employees_large.Full_name
ORDER BY TotalProjects DESC;


-- ============================================================
-- 19. Retrieve the names and project details of employees
--     who work on "Employee Performance Analytics"
-- ============================================================

SELECT 
    employees_large.FirstName,
    employees_large.LastName,
    projects_large.ProjectID,
    projects_large.ProjectName,
    projects_large.StartDate,
    projects_large.EndDate
FROM employees_large 
JOIN projects_large 
    ON employees_large.EmployeeID = projects_large.EmployeeID
WHERE projects_large.ProjectName = 'Employee Performance Analytics';


-- ============================================================
-- 20. Find the average salary of employees in each department
-- ============================================================

SELECT 
    departments_large.DepartmentName,
    ROUND(AVG(employees_large.Salary), 2) AS AverageSalary
FROM departments_large 
JOIN employees_large 
    ON departments_large.DepartmentID = employees_large.DepartmentID
GROUP BY departments_large.DepartmentID, departments_large.DepartmentName
ORDER BY AverageSalary DESC;


-- ============================================================
-- 21. List all departments and the total salary expense
--     for employees in each department
-- ============================================================

SELECT 
    d.DepartmentName,
    COALESCE(SUM(e.Salary), 0) AS Total_Salary_Expense
FROM departments_large d
LEFT JOIN employees_large e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY Total_Salary_Expense DESC;


-- ============================================================
-- 22. Get the department with the highest average salary
-- ============================================================

SELECT 
    departments_large.DepartmentName,
    ROUND(AVG(employees_large.Salary), 2) AS AverageSalary
FROM departments_large 
JOIN employees_large 
    ON departments_large.DepartmentID = employees_large.DepartmentID
GROUP BY departments_large.DepartmentID, departments_large.DepartmentName
ORDER BY AverageSalary DESC
LIMIT 1;


-- ============================================================
-- 23. Count the number of employees who joined each year
-- ============================================================

SELECT 
    EXTRACT(YEAR FROM TO_DATE(JoiningDate, 'MM/DD/YYYY')) AS Joining_Year,
    COUNT(*) AS Number_Of_Employees
FROM employees_large
GROUP BY EXTRACT(YEAR FROM TO_DATE(JoiningDate, 'MM/DD/YYYY'))
ORDER BY Joining_Year;


-- ============================================================
-- 24. Show the number of projects each department is handling
-- ============================================================

SELECT 
    departments_large.DepartmentName,
    COUNT(projects_large.ProjectID) AS NumberOfProjects
FROM departments_large 
JOIN employees_large 
    ON departments_large.DepartmentID = employees_large .DepartmentID
JOIN projects_large 
    ON employees_large .EmployeeID = projects_large.EmployeeID
GROUP BY departments_large.DepartmentID, departments_large.DepartmentName
ORDER BY NumberOfProjects DESC;


-- ============================================================
-- 25. Find the department with the maximum number of
--     employees working on multiple projects
-- ============================================================

WITH employees_multiple_projects AS (
    SELECT 
        employees_large.EmployeeID,
       employees_large.DepartmentID
    FROM employees_large 
    JOIN projects_large 
        ON employees_large.EmployeeID = projects_large.EmployeeID
    GROUP BY employees_large.EmployeeID, employees_large.DepartmentID
    HAVING COUNT(projects_large.ProjectID) > 1
)
SELECT 
    d.DepartmentName,
    COUNT(emp.EmployeeID) AS EmployeesWithMultipleProjects
FROM departments_large d
JOIN employees_multiple_projects emp
    ON d.DepartmentID = emp.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY EmployeesWithMultipleProjects DESC
LIMIT 1;