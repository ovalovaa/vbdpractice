USE store;

DELIMITER //
DROP TRIGGER IF EXISTS reduce_stock_after_insert;

CREATE TRIGGER reduce_stock_after_insert
AFTER INSERT ON order_items
FOR EACH ROW
UPDATE products
SET quantity = quantity - NEW.quantity
WHERE product_id = NEW.product_id;
DELIMITER ;
