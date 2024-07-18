-- Primary Setup
CREATE ROLE replica_role WITH REPLICATION PASSWORD 'postgres' LOGIN;

-- Demo
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email varchar(255),
  first_name varchar(255),
  last_name varchar(255)
);

INSERT INTO users (email, first_name, last_name)
VALUES ('foo@gmail.com', 'Foo', 'Bar');

SELECT * FROM users;

UPDATE users
SET email = 'foobar@gmail.com'
WHERE id = 1;

DELETE FROM users
WHERE id = 1;

-- Primary Teardown
DROP ROLE replica_role;
