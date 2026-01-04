-- ===============================
-- DAY 17 : QUERY OPTIMIZATION
-- ===============================

-- Sample Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    join_date DATE
);

-- --------------------------------
-- 1. FULL TABLE SCAN (BAD)
-- --------------------------------
EXPLAIN
SELECT emp_name, salary
FROM employees
WHERE dept_id = 10;

-- --------------------------------
-- 2. ADD INDEX (GOOD)
-- --------------------------------
CREATE INDEX idx_dept_id ON employees(dept_id);

-- --------------------------------
-- 3. AVOID SELECT *
-- --------------------------------
-- Bad
SELECT * FROM employees;

-- Good
SELECT emp_name, salary FROM employees;

-- --------------------------------
-- 4. FUNCTION ON COLUMN (BAD)
-- --------------------------------
SELECT emp_name
FROM employees
WHERE YEAR(join_date) = 2024;

-- Optimized
SELECT emp_name
FROM employees
WHERE join_date >= '2024-01-01'
  AND join_date < '2025-01-01';

-- --------------------------------
-- 5. WHERE vs HAVING
-- --------------------------------
-- Bad
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id
HAVING dept_id = 20;

-- Good
SELECT dept_id, COUNT(*)
FROM employees
WHERE dept_id = 20
GROUP BY dept_id;

-- --------------------------------
-- 6. EXISTS vs IN
-- --------------------------------
-- IN
SELECT emp_name
FROM employees
WHERE dept_id IN (
    SELECT dept_id FROM departments
);

-- EXISTS
SELECT emp_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.dept_id = e.dept_id
);

-- --------------------------------
-- 7. JOIN OPTIMIZATION
-- --------------------------------
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.salary > 70000;

-- --------------------------------
-- 8. ORDER BY OPTIMIZATION
-- --------------------------------
CREATE INDEX idx_salary ON employees(salary);

SELECT emp_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- --------------------------------
-- 9. INTERVIEW QUERY
-- Top 3 salaries per department
-- --------------------------------
SELECT *
FROM (
    SELECT emp_name,
           dept_id,
           salary,
           ROW_NUMBER() OVER (
               PARTITION BY dept_id
               ORDER BY salary DESC
           ) rn
    FROM employees
) t
WHERE rn <= 3;
