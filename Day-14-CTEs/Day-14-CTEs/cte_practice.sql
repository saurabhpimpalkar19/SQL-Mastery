-- Day 14: Common Table Expressions (CTEs)

-- 1. Employees earning above company average
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT emp_name, salary
FROM employees e
JOIN company_avg c
ON e.salary > c.avg_salary;


-- 2. Department-wise average salary
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT d.dept_name, da.avg_salary
FROM dept_avg da
JOIN departments d
ON da.dept_id = d.dept_id;


-- 3. Employees earning above department average
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT e.emp_name, e.salary, e.dept_id
FROM employees e
JOIN dept_avg da
ON e.dept_id = da.dept_id
WHERE e.salary > da.avg_salary;


-- 4. Department with highest average salary
WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT dept_id, avg_salary
FROM dept_avg
ORDER BY avg_salary DESC
LIMIT 1;
