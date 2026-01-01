-- Day 15: Recursive CTE Practice
-- Author: Saurabh Pimpalkar
-- Topic: Employee Hierarchy using Recursive CTE

/* =====================================================
   Sample Scenario:
   Employee - Manager hierarchy
===================================================== */

/*
employees table structure:
emp_id | emp_name   | manager_id
--------------------------------
1      | CEO        | NULL
2      | Manager A  | 1
3      | Manager B  | 1
4      | Dev A      | 2
5      | Dev B      | 2
6      | Intern     | 4
*/


/* =====================================================
   Example 1: Display complete employee hierarchy
===================================================== */

WITH RECURSIVE emp_hierarchy AS (

    -- Anchor member: Top-level employee (CEO)
    SELECT 
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive member: Fetch subordinates
    SELECT 
        e.emp_id,
        e.emp_name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    JOIN emp_hierarchy eh
        ON e.manager_id = eh.emp_id
)

SELECT *
FROM emp_hierarchy;


/* =====================================================
   Example 2: Find all subordinates under a specific manager
===================================================== */

WITH RECURSIVE subordinates AS (

    -- Anchor: Selected manager
    SELECT emp_id, emp_name, manager_id
    FROM employees
    WHERE emp_id = 2   -- Manager A

    UNION ALL

    -- Recursive: Employees reporting to manager
    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM employees e
    JOIN subordinates s
        ON e.manager_id = s.emp_id
)

SELECT *
FROM subordinates;


/* =====================================================
   Example 3: Employee hierarchy with reporting path
===================================================== */

WITH RECURSIVE emp_path AS (

    -- Anchor: CEO
    SELECT 
        emp_id,
        emp_name,
        manager_id,
        CAST(emp_name AS CHAR(100)) AS path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive: Build reporting path
    SELECT 
        e.emp_id,
        e.emp_name,
        e.manager_id,
        CONCAT(ep.path, ' -> ', e.emp_name)
    FROM employees e
    JOIN emp_path ep
        ON e.manager_id = ep.emp_id
)

SELECT *
FROM emp_path;
