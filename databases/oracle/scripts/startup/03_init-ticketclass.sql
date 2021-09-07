CONN system/appd@//localhost:1521/XE
DROP TABLE ticket_class;
CREATE TABLE ticket_class (id INT, ticketClassCode VARCHAR2(20), ticketClassName VARCHAR2(20));
INSERT INTO ticket_class (id, ticketClassCode, ticketClassName) VALUES ( 1, 'FC', 'First Class');
INSERT INTO ticket_class (id, ticketClassCode, ticketClassName) VALUES ( 2, 'BC', 'Business Class');
INSERT INTO ticket_class (id, ticketClassCode, ticketClassName) VALUES ( 3, 'EC', 'Economy Class');
COMMIT;
exit;
