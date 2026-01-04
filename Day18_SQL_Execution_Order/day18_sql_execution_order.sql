-- DAY 18 : SQL EXECUTION ORDER

SELECT dept_id,
       COUNT(*) AS total_employees
FROM employees
WHERE salary > 50000
GROUP BY dept_id
HAVING COUNT(*) > 2
ORDER BY total_employees DESC
LIMIT 3;
