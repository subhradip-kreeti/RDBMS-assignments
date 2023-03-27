-- postgresql

-- 1. From the following tables write a SQL query to find the details of an employee.
-- Return full name, email, salary, Department Name, postal code, and City.

    select CONCAT(e.first_name,' ',e.last_name) as full_name,e.email,e.salary,d.department_name,l.pincode,l.city
    from employees e join departments d
    on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id;


-- 2. From the following tables write a SQL query to find the departments whose location is
-- in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province,
-- street_address.

    select d.department_name,l.state_province,l.street_address
    from departments d join locations l
    on d.location_id = l.location_id
    where l.state_province in ('Jammu Kashmir','Jharkhand');

-- 3. From the following tables write a SQL query to find the count of employees present in
-- different jobs whose average salary is greater than 10,000. Return all the jobs with
-- employee count, Job Name, and average salary.

    select count(e.employee_id) as employee_count,j.job_title,avg(e.salary) as avg_salary
    from employees e join jobs j on e.job_id = j.job_id
    where e.salary > 10000
    group by j.job_id ;

---4. From the following table write a SQL query to find all the first_names and
-- last_names in both dependents and employees tables. Return the duplicate records as
-- well and order the records in descending order of the last_name column.

    select first_name ,last_name
    from employees
    union all
    select first_name ,last_name
    from dependents
    order by last_name desc;

-- 5. From the following table write a SQL query to list every employee that has a manager
-- with the name of his or her manager.

    select concat(e.first_name,' ',e.last_name),concat(m.first_name,' ',m.last_name)
    from employees e join employees m
    on e.manager_id = m.employee_id;

-- 6. Find the departments that have more than 5 employees earning a salary greater than
-- 50,000 and are located in either New York or California. Include the department name,
-- location, and the number of employees meeting the criteria.

    select d.department_name,l.city,count(e.employee_id)
    from employees e join departments d
    on e.department_id = d.department_id
    join locations l on l.location_id = d.location_id
    where e.salary > 50000 and l.city in ('New York','California')
    group by d.department_id,l.city
    having count(e.employee_id) > 5;

-- 7. List any employees who have dependents and have a job title that includes the word
-- 'manager', and sort the results by department name in ascending order.

    select concat(e.first_name,' ',e.last_name) as employee_name,concat(d.first_name,' ',d.last_name) as dependent_name,j.job_title,dept.department_name
    from employees e join dependents d
    on e.employee_id = d.employee_id
    join jobs j on e.job_id =j.job_id
    join departments dept on dept.department_id = e.department_id
    where j.job_title like '%manager%'
    order by dept.department_name;

-- 8. Add a column in the dependent table called “city” depicting their current location of
-- stay.
-- Find all employees who have been hired in the past 3 years and have dependents
-- living in a city that is different from the city they work in (if I work in Kolkata, then my
-- dependent should not be in Kolkata).
-- Additionally, only include employees whose salary is greater than the average salary of
-- their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average
-- salary under the same job_title “developer” is 70k), and whose manager's job title
-- includes the word 'director'. Finally, include the department name and location of each
-- employee, and sort the results by department name in ascending order

    -- adding city column
    alter table dependents add column city varchar(255);

    ---inserting values in city column
    update dependents set city = 'kolkata' where dependents_id = 1;
    update dependents set city = 'mumbai' where dependents_id = 2;
    update dependents set city = 'mumbai' where dependents_id = 3;
    update dependents set city = 'mumbai' where dependents_id = 4;
    update dependents set city = 'kolkata' where dependents_id = 5;

    -- main query

    select concat(emp.first_name,' ',emp.last_name) as employee_name,dep.department_name,loc.city,depend.city,depend.city,manager.first_name
    from employees emp join departments dep on emp.department_id = dep.department_id
    join locations loc on dep.location_id = loc.location_id
    join dependents depend on depend.employee_id = emp.employee_id
    join jobs job on emp.job_id = job.job_id
    join employees manager on manager.employee_id = emp.manager_id
    where emp.hire_date >= CURRENT_DATE - INTERVAL '3 YEARS'
    AND loc.city != depend.city
    AND emp.salary > (select avg(salary) from employees where job_id = job.job_id)
    and job.job_title like '%developer%'
    and manager.job_id in (select job_id from jobs where job_title like '%director%')
    order by dep.department_name;

