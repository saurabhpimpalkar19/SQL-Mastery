-- Day 13: Window Functions
-- Compare salary with department average

SELECT emp_name,
       salary,
       dept_id,
       AVG(salary) OVER (PARTITION BY dept_id) AS dept_avg,
       salary - AVG(salary) OVER (PARTITION BY dept_id) AS diff
FROM employees;
