-- 1.Create a trigger to fill up the full_name column in the dependents table while
-- inserting any new records.

  --function:
    CREATE OR REPLACE FUNCTION fill_full_name()
    RETURNS TRIGGER AS $$
    BEGIN
      NEW.full_name := Concat(NEW.first_name,' ',NEW.last_name);
      return new;
    end;
    $$ language plpgsql;

  --trigger
    CREATE TRIGGER fill_full_name BEFORE INSERT ON dependents
    FOR EACH ROW EXECUTE FUNCTION fill_full_name();

-- 2. Create a trigger that stores the transaction records of each insert, update and
-- delete operations performed on the locations table into locations_info table.

CREATE TABLE locations_info (
    id SERIAL PRIMARY KEY,
    operation VARCHAR(10) NOT NULL,
    location_id INT,
    street_address VARCHAR(255),
    pincode VARCHAR(10),
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id INT
);

CREATE OR REPLACE FUNCTION trigger_location()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO locations_info (operation, location_id, street_address, pincode, city, state_province, country_id)
        VALUES ('INSERT', NEW.location_id, NEW.street_address, NEW.pincode, NEW.city, NEW.state_province, NEW.country_id);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO locations_info (operation, location_id, street_address, pincode, city, state_province, country_id)
        VALUES ('UPDATE', NEW.location_id, NEW.street_address, NEW.pincode, NEW.city, NEW.state_province, NEW.country_id);
        RETURN NEW;
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO locations_info (operation, location_id, street_address, pincode, city, state_province, country_id)
        VALUES ('DELETE', OLD.location_id, OLD.street_address, OLD.pincode, OLD.city, OLD.state_province, OLD.country_id);
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_location
AFTER INSERT OR UPDATE OR DELETE ON locations
FOR EACH ROW EXECUTE FUNCTION trigger_location();


-- 3. For the following tables create a view named employee_information with
-- employee first name, last name, salary, department name, city, postal code insert
-- only those records whose postal code length is less than 5.

  CREATE VIEW emp_view AS SELECT
  emp.first_name,emp.last_name,emp.salary,dept.department_name,loc.pincode from
  employees emp join departments dept on emp.department_id = dept.department_id
  join locations loc on loc.location_id = dept.location_id where length(loc.pincode)<5;

-- 4. Explain ACID properties with an example

  ACID is an acronym for a set of properties that ensure reliable and consistent transaction processing in a database system.
  Here's what each of the properties means:

  Atomicity: All actions within a transaction must either complete successfully or be rolled back. In other words, a transaction
  is treated as a single, indivisible unit of work.

  Consistency: A transaction must leave the database in a valid state. This means that any constraints, such as foreign key constraints,
  must not be violated by the transaction.

  Isolation: Concurrent transactions must be isolated from each other, so that each transaction appears to be executed in isolation.
  This prevents interference between transactions.

  Durability: Once a transaction is committed, its effects must be permanent and survive any subsequent system failures.

-- 5. Answer the above question with explanation

  Indexing will be on occupation column because if we sort the occupation lexographically then it will give the sequence like 1,3,2,5,4

  CON - 1
  ENG - 3
  DOC - 2
  SER - 5
  MUS - 4
