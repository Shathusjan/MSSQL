
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

-- SELECT production.product.product_id, production.product.product_name, dim_product.product_key, dim_product.product_name
-- FROM dim_product
-- INNER JOIN production.product ON dim_product.product_key = production.product.product_id; 


ALTER TABLE fact_sales_info
ALTER COLUMN discount DECIMAL(5,2);

DROP TABLE fact_sales_info;

SELECT sales.orders.order_item_id, sales.order_item.promotion_id
FROM sales.order_item
INNER JOIN sales.orders ON sales.orders.order_item_id = sales.order_item.order_item_id;


