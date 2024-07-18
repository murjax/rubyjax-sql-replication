-- Primary Setup
CREATE USER 'replica_user'@'%' IDENTIFIED WITH sha256_password BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;

-- Demo
CREATE DATABASE pizza_deliveries;
USE pizza_deliveries;

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  email varchar(255),
  first_name varchar(255),
  last_name varchar(255),
  PRIMARY KEY (id)
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
DROP DATABASE pizza_deliveries;
DROP USER 'replica_user'@'%';