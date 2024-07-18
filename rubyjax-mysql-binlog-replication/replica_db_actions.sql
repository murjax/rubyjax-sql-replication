-- Replica Setup
CHANGE REPLICATION SOURCE TO
   SOURCE_HOST='primary_db',
   SOURCE_PORT=3306,
   SOURCE_USER='replica_user',
   SOURCE_PASSWORD='password',
   SOURCE_LOG_FILE='binlog.000002',
   SOURCE_LOG_POS=2474;
   
START REPLICA;

-- Demo
USE pizza_deliveries;

SELECT * FROM users;

-- Replica Teardown
STOP REPLICA;