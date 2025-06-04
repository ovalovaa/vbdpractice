
USE store;


DROP USER IF EXISTS 'store_manager'@'localhost';
DROP USER IF EXISTS 'sales_clerk'@'localhost';
DROP USER IF EXISTS 'analyst'@'localhost';


CREATE USER 'store_manager'@'localhost' IDENTIFIED BY 'Manager123!';
CREATE USER 'sales_clerk'@'localhost' IDENTIFIED BY 'Clerk456!';
CREATE USER 'analyst'@'localhost' IDENTIFIED BY 'Analyst789!';


GRANT ALL PRIVILEGES ON store.* TO 'store_manager'@'localhost';

GRANT SELECT ON store.products TO 'sales_clerk'@'localhost';
GRANT SELECT, INSERT ON store.orders TO 'sales_clerk'@'localhost';
GRANT SELECT, INSERT ON store.order_items TO 'sales_clerk'@'localhost';

GRANT SELECT ON store.* TO 'analyst'@'localhost';

ALTER USER 'store_manager'@'localhost'
IDENTIFIED BY 'Manager123!'
REQUIRE NONE;

FLUSH PRIVILEGES;
