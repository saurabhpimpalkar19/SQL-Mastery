-- Day 12: Subqueries
-- Question: Employees earning above company average
-- Type: Non-Correlated Subquery

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
