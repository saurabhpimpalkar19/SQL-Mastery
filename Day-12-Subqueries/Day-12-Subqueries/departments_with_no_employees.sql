-- Day 12: Subqueries
-- Question: Departments having no employees
-- Type: LEFT JOIN / NOT EXISTS

SELECT d.dept_id, d.dept_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;
