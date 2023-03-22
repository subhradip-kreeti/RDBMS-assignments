-- postgresql

-- 1. Write the query to get the department and department wise total(sum) salary,
-- display it in ascending order according to salary.

    SELECT departments.department_name,sum(employees.salary) as total_salary
    FROM departments,employees
    where departments.department_id = employees.department_id
    GROUP BY departments.department_name
    ORDER BY total_salary;

-- 2. Write the query to get the department, total no. employee of each department,
-- total(sum) salary with respect to department from "Employee" table.

    SELECT departments.department_name,count(employees.employee_id) as emp_count_dept_wise,sum(employees.salary) as total_salary
    FROM departments,employees
    WHERE employees.department_id = departments.department_id
    GROUP BY departments.department_name
    ORDER BY total_salary;

-- 4. Write a query to get the departments where average salary is more than 60k

    SELECT department_name
    FROM departments
    WHERE department_id
    IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > 60000
    );

-- 5. Write down the query to fetch department name assign to more than one
-- Employee

    SELECT departments.department_name
    FROM departments,employees
    WHERE employees.department_id = departments.department_id
    GROUP BY departments.department_name
    HAVING count(employees.employee_id)>1;

-- 6. Write a query to show department_name and assignedTo where assignedTo
-- will be “One candidate” if its assigned to only one employee otherwise
-- “Multiple candidates”


    SELECT departments.department_name,
    case
    WHEN count(*)=1 THEN 'One candidate'
    ELSE 'Multiple candidates'
    END as assignedTo
    FROM departments,employees
    WHERE employees.department_id = departments.department_id
    GROUP BY departments.department_name;

