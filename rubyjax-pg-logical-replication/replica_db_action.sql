-- Replica Setup
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email varchar(255),
  first_name varchar(255),
  last_name varchar(255)
);
CREATE SUBSCRIPTION replica_subscription CONNECTION 'dbname=pizza_deliveries host=primary_db user=postgres password=postgres' PUBLICATION my_publication;

-- Demo

SELECT * FROM users;

UPDATE users
SET email = 'barbar@gmail.com'
WHERE id = 1;

DELETE FROM users
WHERE id = 1;

-- Replica Teardown
DROP SUBSCRIPTION replica_subscription;

-- Alternate Replica Teardown
DELETE FROM pg_subscription;
DELETE FROM pg_subscription_rel;
DELETE FROM pg_replication_origin;