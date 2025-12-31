-- Day 13: Window Functions
-- LEAD example: Next employee salary

SELECT emp_name,
       salary,
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;
