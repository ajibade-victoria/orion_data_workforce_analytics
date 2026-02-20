-- Name: Victoria_Ajibade
-- Project: Orion Data System Workforce Analytics

SELECT * FROM departments;
SELECT * FROM employees;
USE capstone;

-- Work force Distribution
SELECT d.department_name, COUNT(employee_id) AS employee_count
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;

-- Salary Comparison, Highest
SELECT department_name, ROUND(AVG(salary),0) as average_salary
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY AVG(salary) DESC
 LIMIT 1;
-- Lowest
SELECT department_name, ROUND(AVG(salary),0) as average_salary
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY AVG(salary) ASC
LIMIT 1;

-- Salary bands for employees
SELECT 
CASE 
WHEN salary < 5000 THEN 'Low'
WHEN salary BETWEEN 5000 AND 10000 THEN 'Medium'
ELSE 'High'
END AS Salary_band,
COUNT(*) AS employees_count
FROM employees
GROUP BY 
CASE
WHEN salary < 5000 THEN 'Low'
WHEN salary BETWEEN 5000 AND 10000 THEN 'Medium'
ELSE 'High'
END;

-- country level Analysis
SELECT c.country_name,
COUNT(DISTINCT e.department_id) AS Number_of_departments
FROM countries c 
JOIN employees e ON c.country_id = e.country_id
GROUP BY c.country_name;

-- High Earners
SELECT ROUND(AVG(salary),0) FROM employees;
SELECT emp_name, salary FROM employees
WHERE salary > 6462;

-- Job Role Analysis
SELECT job_title,ROUND((min_salary + max_salary) / 2,0) AS calculated_avg
FROM jobs
HAVING calculated_Avg > 12000;

-- Salary growth trend
SELECT c.country_name,
SUM(e.salary) AS total_salary_cost
FROM countries c
JOIN employees e ON c.country_id = e.country_id
GROUP BY c.country_name
ORDER BY total_salary_cost DESC;

-- Work force GaPS
SELECT * FROM jobs;
SELECT j.job_title
FROM jobs j
 JOIN employees e ON j.job_id = e.job_id
WHERE e.employee_id IS NULL;






 

