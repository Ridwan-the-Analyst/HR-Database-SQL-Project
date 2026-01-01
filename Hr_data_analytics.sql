--1. How many employees are currently in the company?

SELECT COUNT(employee_id) AS Total_employees
FROM employees;

--2. Please provide a list of the top 10 highest-paid employees (name and salary).

SELECT CONCAT(first_name,' ', last_name) full_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 10

-- 3. What are all the distinct job titles in the organization?

SELECT DISTINCT(job_title)
FROM jobs
ORDER BY job_title;


---4. How many employees are there in each department?
SELECT department_name, COUNT(employee_id) AS employee_count
FROM employees JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY employee_count DESC


--5. Which department has the largest number of employees?

SELECT department_name, COUNT(employee_id) AS employee_count
FROM employees JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY employee_count DESC
LIMIT 1

--6. Which department has the highest average salary?
SELECT department_name, ROUND(AVG(salary), 2) AS avg_salary
FROM employees JOIN departments 
USING(department_id)
GROUP BY department_name
ORDER BY avg_salary
LIMIT 1


--7. What is the minimum, maximum, and average salary across the company?
SELECT MIN(salary) AS min_salary,
MAX(salary) AS max_salary,
ROUND(AVG(salary), 2) AS avg_salary
FROM employees;


--8. Who are the top 5 highest-paid employees?
SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
ORDER BY salary DESC
FETCH NEXT 5 ROW ONLY


--9. How many employees earn more than $10,000, and can you list some examples?
SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
WHERE salary > 10000
ORDER BY salary DESC


--10. What is the total annual payroll cost for each department?
SELECT department_name, COUNT(employee_id) AS headcount, sum(salary) AS total_payroll
FROM employees JOIN departments USING(department_id)
GROUP BY department_name
ORDER BY total_payroll  DESC

--11. Which employees earn above the company-wide average salary?
WITH company_avg AS(
SELECT AVG(salary) AS avg_salary FROM employees
)
SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees, company_avg
WHERE salary > company_avg.avg_salary
ORDER BY salary DESC


SELECT AVG(salary) AS avg_salary FROM employees

SELECT first_name || ' ' || last_name AS full_name, salary
FROM employees
WHERE salary > 8060

--12. Are there any employees whose current salary exceeds the maximum defined for their job title?
SELECT first_name || ' ' || last_name AS full_name, salary, job_title,max_salary
FROM employees JOIN jobs USING(job_id)
WHERE salary > max_salary


--13. Who is the most recently hired employee?
SELECT first_name || ' ' || last_name AS full_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 1

--14. Who are the five longest-serving employees (earliest hire dates)?
SELECT first_name || ' ' || last_name AS full_name, hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 5