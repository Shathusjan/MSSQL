
-- Joined Product and promotion

SELECT sales.promotion.promotion_id, production.product.product_id
FROM sales.promotion
INNER JOIN production.product ON sales.promotion.product_id = production.product.product_id;


-- -- ADD three columns in orders table

-- ALTER TABLE sales.orders
-- ADD gross_total DECIMAL(10, 2), discount DECIMAL(5, 2), net_total DECIMAL(10, 2);

-- Changed the value of promotion 

-- UPDATE sales.order_item
-- SET promotion_id = 1
-- WHERE order_item_id = 1;

SELECT *
FROM production.product;

23.68

SELECT *
FROM sales.order_item;

SELECT *
FROM sales.promotion;

DELETE FROM sales.orders
WHERE orders_id = 3;

SELECT *
FROM sales.customer;

