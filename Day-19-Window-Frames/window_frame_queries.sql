-- Day 19: Window Frames & UNBOUNDED PRECEDING
-- Database: MySQL / PostgreSQL compatible

------------------------------------------------
-- 1. Running Total Salary (Department-wise)
------------------------------------------------
SELECT emp_name,
       dept_id,
       salary,
       SUM(salary) OVER (
           PARTITION BY dept_id
           ORDER BY salary
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM employees;

------------------------------------------------
-- 2. Running Total Salary (Company-wide)
------------------------------------------------
SELECT emp_name,
       salary,
       SUM(salary) OVER (
           ORDER BY salary
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS company_running_total
FROM employees;

------------------------------------------------
-- 3. ROWS vs RANGE Example
------------------------------------------------

-- Using ROWS
SELECT emp_name,
       salary,
       SUM(salary) OVER (
           ORDER BY salary
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS rows_running_total
FROM employees;

-- Using RANGE
SELECT emp_name,
       salary,
       SUM(salary) OVER (
           ORDER BY salary
           RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS range_running_total
FROM employees;

------------------------------------------------
-- 4. Cumulative Average Salary
------------------------------------------------
SELECT emp_name,
       salary,
       AVG(salary) OVER (
           ORDER BY salary
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS cumulative_avg_salary
FROM employees;

------------------------------------------------
-- 5. Department-wise Salary Growth
------------------------------------------------
SELECT emp_name,
       dept_id,
       salary,
       salary - LAG(salary) OVER (
           PARTITION BY dept_id
           ORDER BY salary
       ) AS salary_difference
FROM employees;

------------------------------------------------
-- END OF DAY 19
------------------------------------------------
