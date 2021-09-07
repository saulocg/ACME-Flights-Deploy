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

DROP TABLE airports;
CREATE TABLE airports (id INT, airportCode VARCHAR2(20), airportCity VARCHAR2(20));
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 1, 'BSB', 'Brasilia');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 2, 'CGH', 'Congonhas');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 3, 'GRU', 'Guarulhos');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 4, 'SDU', 'Rio de Janeiro');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 5, 'IPN', 'Ipatinga');
COMMIT;

DROP TABLE ticket_class;
CREATE TABLE ticket_class (id INT, ticketClassCode VARCHAR2(20), ticketClassName VARCHAR2(20));
INSERT INTO ticket_class (id, ticketClassCode, ticketClassName) VALUES ( 1, 'FC', 'First Class');
INSERT INTO ticket_class (id, ticketClassCode, ticketClassName) VALUES ( 2, 'BC', 'Business Class');
INSERT INTO ticket_class (id, ticketClassCode, ticketClassName) VALUES ( 3, 'EC', 'Economy Class');
COMMIT;

DROP TABLE customer_class;
CREATE TABLE customer_class (id INT, customerClass VARCHAR2(20));
INSERT INTO customer_class (id, customerClass) VALUES ( 1, 'Silver');
INSERT INTO customer_class (id, customerClass) VALUES ( 2, 'Platinum');
INSERT INTO customer_class (id, customerClass) VALUES ( 3, 'Gold');
INSERT INTO customer_class (id, customerClass) VALUES ( 4, 'Diamond');
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