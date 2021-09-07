CONN system/appd@//localhost:1521/XE
DROP TABLE airports;
CREATE TABLE airports (id INT, airportCode VARCHAR2(20), airportCity VARCHAR2(20));
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 1, 'BSB', 'Brasilia');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 2, 'CGH', 'Congonhas');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 3, 'GRU', 'Guarulhos');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 4, 'SDU', 'Rio de Janeiro');
INSERT INTO airports (id, airportCode, airportCity) VALUES ( 5, 'IPN', 'Ipatinga');
COMMIT;
exit;
