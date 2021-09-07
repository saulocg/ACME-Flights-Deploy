CONN system/appd@//localhost:1521/XE
DROP TABLE customer_class;
CREATE TABLE customer_class (id INT, customerClass VARCHAR2(20));
INSERT INTO customer_class (id, customerClass) VALUES ( 1, 'Silver');
INSERT INTO customer_class (id, customerClass) VALUES ( 2, 'Platinum');
INSERT INTO customer_class (id, customerClass) VALUES ( 3, 'Gold');
INSERT INTO customer_class (id, customerClass) VALUES ( 4, 'Diamond');
COMMIT;
exit;
