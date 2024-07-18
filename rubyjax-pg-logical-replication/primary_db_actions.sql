-- Primary Setup
CREATE PUBLICATION my_publication FOR ALL TABLES;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email varchar(255),
  first_name varchar(255),
  last_name varchar(255)
);
ALTER TABLE users REPLICA IDENTITY FULL;
-- Demo

INSERT INTO users (email, first_name, last_name)
VALUES ('foo@gmail.com', 'Foo', 'Bar');

SELECT * FROM users;

UPDATE users
SET email = 'foobar@gmail.com'
WHERE id = 1;

DELETE FROM users
WHERE id = 1;

-- Primary Teardown
SELECT pg_drop_replication_slot('replica_subscription');
DROP PUBLICATION IF EXISTS my_publication;