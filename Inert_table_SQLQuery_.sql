-- SELECT *
-- FROM sales.promotion;

-- Made the promotion Nullable

-- ALTER TABLE sales.order_item
-- ALTER COLUMN promotion_id INT;

-- Order item Table
-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (1,1,NULL,3);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (2,1,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (3,1,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (4,1,NULL,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (5,1,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (5,1,NULL,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (2,1,NULL,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (7,1,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (7,1,3,9);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (8,1,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (10,1,4,7);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (11,1,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (12,1,NULL,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (10,1,NULL,5);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (4,1,NULL,5);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (5,1,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (1,1,1,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (1,2,1,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (1,4,1,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (3,2,NULL,1);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (2,2,NULL,2);

-- INSERT INTO sales.order_item (product_id, store_id, promotion_id, quantity)
-- VALUES (10,4,NULL,2);

-- SELECT *
-- FROM sales.order_item;

-- Orders Table

-- DECLARE @order_item_id INT = 22;
-- DECLARE @customer_id INT = 4;

-- DECLARE @product_id INT = (SELECT product_id FROM sales.order_item WHERE order_item_id=@order_item_id);

-- DECLARE @quantity INT = (SELECT quantity FROM sales.order_item WHERE order_item_id = @order_item_id);
-- DECLARE @discount_value DECIMAL(5,2) = (SELECT discount_value FROM sales.promotion WHERE product_id = @product_id);

-- DECLARE @unit_amount DECIMAL(10,2) = (SELECT unit_price FROM production.product WHERE product_id=@product_id);
-- DECLARE @gross_amount DECIMAL(10,2) = @unit_amount * @quantity;

-- -- Handle null discount using ISNULL
-- DECLARE @discount DECIMAL(5, 2) = ISNULL(@discount_value, 0);

-- SET @discount = (@gross_amount * (@discount/100));

-- DECLARE @netTotal DECIMAL(10,2) = @gross_amount - @discount

-- INSERT INTO sales.orders (order_item_id, customer_id, gross_total, discount, net_total, note)
-- VALUES (@order_item_id,@customer_id,@gross_amount, @discount, @netTotal, NULL);

-- SELECT *
-- FROM sales.orders;

