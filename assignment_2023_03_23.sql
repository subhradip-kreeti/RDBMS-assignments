--postgresql



-- 1) Find all the departments where the minimum salary is less than 2000.

    SELECT d.department_name FROM departments d WHERE EXISTS (
    SELECT e.employee_id FROM employees e
    WHERE e.department_id = d.department_id AND
    e.salary < 2000
    );

-- 2) Find all the countries where no employees exist.

    select c.country_id,c.country_name from countries c where c.country_id not in (
    select l.country_id from locations l where exists (
    select d.location_id from departments d where exists (
    select e.department_id from employees e where e.department_id = d.department_id
    )and d.location_id = l.location_id
    )
    );

-- 3) From the following tables write a query to find all the jobs, having at least 2 employees in a
-- single department.(don’t use joins)

    SELECT job_title FROM jobs WHERE job_id IN(
    SELECT job_id FROM
    (SELECT DISTINCT job_id,
    (SELECT COUNT(employee_id)
    FROM employees e2
    WHERE e2.job_id = e1.job_id) AS num_employees
    FROM employees e1) t1 WHERE num_employees >= 2);

-- 4)From the following tables write a query to find all the countries, having cities with all the city
-- names starting with 'a'.(don’t use joins)

    SELECT country_name FROM countries WHERE country_id IN
    (SELECT country_id FROM
    (SELECT DISTINCT country_id,
    (SELECT city FROM locations l2
    WHERE l2.location_id = l1.location_id) AS same_cities
    FROM locations l1) t1 WHERE same_cities LIKE 'k%');

-- 5)From the following tables write a query to find all the departments, having no cities.

    select department_name from departments where location_id not in(select location_id from locations where city is not null);

