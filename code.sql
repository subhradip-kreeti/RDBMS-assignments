CREATE TABLE regions(
    region_id  SERIAL PRIMARY KEY,
    region_name VARCHAR(255)
);

CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT REFERENCES regions(region_id)
)

CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(255),
    postal_code VARCHAR(255),
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id INT REFERENCES countries(country_id)
)

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(255),
    location_id INT REFERENCES locations(location_id)
)

CREATE TABLE jobs(
    job_id SERIAL PRIMARY KEY,
    job_title VARCHAR(255),
    min_salary INT,
    max_salary INT
)q

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    hire_date DATE,
    job_id INT REFERENCES jobs(job_id),
    salary INT,
    manager_id INT,
    department_id INT REFERENCES departments(department_id)
)

CREATE TABLE dependents(
    dependents_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    relationship VARCHAR(255),
    employee_id INT REFERENCES employees(employee_id)
)


-- constraints

ALTER TABLE employees
ALTER COLUMN first_name SET NOT NULL,
ALTER COLUMN last_name SET NOT NULL;


ALTER TABLE dependents
ALTER COLUMN first_name SET NOT NULL,
ALTER COLUMN last_name SET NOT NULL;

ALTER TABLE jobs
ADD
CHECK(min_salary > 1000)

ALTER TABLE locations
ADD
CHECK(LENGTH(pincode)<=10)


-- column

ALTER TABLE employees
ADD COLUMN manager_name varchar(255);

ALTER TABLE jobs
DROP COLUMN max_salary;

ALTER TABLE locations
RENAME COLUMN postal_code to pincode;

-- insert data

INSERT INTO regions(region_name) VALUES ('south_asia');
INSERT INTO regions(region_name) VALUES ('europe');
INSERT INTO regions(region_name) VALUES ('north_america');
INSERT INTO regions(region_name) VALUES ('australia');
INSERT INTO regions(region_name) VALUES ('south_america');

INSERT INTO countries(country_name,region_id) VALUES ('india',1);
INSERT INTO countries(country_name,region_id) VALUES ('germany',2);
INSERT INTO countries(country_name,region_id) VALUES ('srilanka',1);
INSERT INTO countries(country_name,region_id) VALUES ('italy',2);
INSERT INTO countries(country_name,region_id) VALUES ('canada',3);


INSERT INTO locations(street_address,pincode,city,country_id) VALUES ('ep_block_sec_v','700064','kolkata',1);
INSERT INTO locations(street_address,pincode,city,country_id) VALUES ('chinar_park','700136','kolkata',1);
INSERT INTO locations(street_address,pincode,city,country_id) VALUES ('rr_nagar','560098','bengaluru',1);
INSERT INTO locations(street_address,pincode,city,country_id) VALUES ('downtown','66777','toronto',5);
INSERT INTO locations(street_address,pincode,city,country_id) VALUES ('piemonte','10125','turin',4);


INSERT INTO departments(department_name,location_id) VALUES ('hr',1);
INSERT INTO departments(department_name,location_id) VALUES ('engineer',1);
INSERT INTO departments(department_name,location_id) VALUES ('accounts',1);
INSERT INTO departments(department_name,location_id) VALUES ('it',3);
INSERT INTO departments(department_name,location_id) VALUES ('marketing',4);

INSERT INTO jobs(job_title,min_salary,max_salary)
VALUES ('software engineer',720000,1500000);
INSERT INTO jobs(job_title,min_salary,max_salary)
VALUES ('hr executive',280000,540000);
INSERT INTO jobs(job_title,min_salary,max_salary)
VALUES ('manager',1000000,2000000);
INSERT INTO jobs(job_title,min_salary,max_salary)
VALUES ('analyst',250000,600000);
INSERT INTO jobs(job_title,min_salary,max_salary)
VALUES ('sales head',400000,1000000);

INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,department_id)
VALUES ('subhradip','barik','subhradip.barik@kreeti.com','+91 9564808428','2022-12-23','1',750000,2);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,department_id)
VALUES ('tuhin','hazra','tuhin.hazra@lims.com','+91 8617474240','2022-01-18','1',780000,2);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,department_id)
VALUES ('soham','dey sarkar','soham@gmail.com','+91 9339856470','2022-07-23','1',820000,2);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,department_id)
VALUES ('rupam','islam','rupam.islam@pwc.com','+91 9564807841','2021-12-23','1',500000,1);
INSERT INTO employees(first_name,last_name,email,phone_number,hire_date,job_id,salary,department_id)
VALUES ('animesh','mondal','mondalani@jio.com','+91 9564124528','2023-01-22','1',450000,2);


INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('anamika','mondal','wife',2);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('hira','hazra','mother',2);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('julekha','islam','wife',4);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('jahira','islam','mother',4);
INSERT INTO dependents(first_name,last_name,relationship,employee_id) VALUES ('antara','ghosh','wife',5);
