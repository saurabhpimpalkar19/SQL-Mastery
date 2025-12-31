-- Day 13: Window Functions
-- LAG example: Salary difference from previous employee

SELECT emp_name,
       salary,
       salary - LAG(salary) OVER (ORDER BY salary DESC) AS salary_diff
FROM employees;
