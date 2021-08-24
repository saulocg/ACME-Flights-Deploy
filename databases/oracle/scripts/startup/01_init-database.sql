-- Create test user
-- GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO ACME IDENTIFIED BY appd;
-- Connect as test user
CONN system/appd@//localhost:1521/XE
-- Create starter set
DROP TABLE airlines;
CREATE TABLE airlines (id INT, airlineName VARCHAR2(20), airlinePrefix VARCHAR2(2));
INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 1, 'America Airlines', 'AA');
INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 2, 'Delta Airlines', 'DL');
INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 3, 'Azul', 'AD');
INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 4, 'Gol', 'G3');
INSERT INTO airlines (id, airlineName, airlinePrefix) VALUES ( 5, 'Latam Airlines', 'JJ');
COMMIT;
exit;

-- ALTER SESSION SET CONTAINER=XE;
-- CREATE USER ACME IDENTIFIED BY appd;
-- GRANT CONNECT, RESOURCE TO ACME;
-- ALTER USER ACME QUOTA UNLIMITED ON USERS;
-- exit;

-- ALTER SESSION SET CONTAINER=CUSTOMSCRIPTS;
-- CREATE USER TEST IDENTIFIED BY test;
-- GRANT CONNECT, RESOURCE TO TEST;
-- ALTER USER TEST QUOTA UNLIMITED ON USERS;
-- exit;