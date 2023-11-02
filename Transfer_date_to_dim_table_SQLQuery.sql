-- Transfer data from source to target

--Transfer Data to dim_product
---------------------------------

-- INSERT INTO dim_product (
--     product_name,
--     unit_price,
--     description,
--     category_id,
--     category_name,
--     type_id,
--     type_name
-- )

-- SELECT
--     production.product.product_name,
--     production.product.unit_price,
--     production.product.description,
--     production.category.category_id,
--     production.category.category_name,
--     production.product_type.type_id,
--     production.product_type.type_name

-- FROM production.product

-- JOIN production.category ON production.product.category_id = production.category.category_id
-- JOIN production.product_type ON production.category.type_id = production.product_type.type_id;

-- SELECT *
-- FROM dim_product;


--Transfer Data to dim_customer
---------------------------------

-- INSERT INTO dim_customer(
--     customer_key,
--     first_name,
--     last_name,
--     gender,
--     dob,
--     phone,
--     email,
--     segment_type
-- )

-- SELECT 
--     sales.customer.customer_id,
--     sales.customer.first_name,
--     sales.customer.last_name,
--     sales.customer.gender,
--     sales.customer.dob,
--     sales.customer.phone,
--     sales.customer.email,
--     sales.customer.segment_type

-- FROM sales.customer;

-- -- Calculate AGE 

-- UPDATE dim_customer
-- SET age = DATEDIFF(YEAR, dob,GETDATE());


-- SELECT *
-- FROM dim_customer;


-- Create Store Table dim_store
-----------------------------

-- INSERT INTO dim_store (
--     store_key,
--     store_name,
--     city,
--     store_state
-- )

-- SELECT 

--     sales.store.store_id,
--     sales.store.store_name,
--     sales.store.city,
--     sales.store.store_state

-- FROM sales.store

-- SELECT *
-- FROM dim_store;


--Transfer Data to dim_promotion
---------------------------------

-- INSERT INTO dim_promotion (
--     promotion_key,
--     promotion_name,
--     promotion_type,
--     start_date,
--     end_date,
--     discount_value,
--     description,
--     product_id,
--     isActive
-- )

-- SELECT

--     sales.promotion.promotion_id,
--     sales.promotion.promotion_name,
--     sales.promotion.promotion_type,
--     sales.promotion.start_date,
--     sales.promotion.end_date,
--     sales.promotion.discount_value,
--     sales.promotion.[description],
--     sales.promotion.product_id,
--     sales.promotion.is_active

-- FROM sales.promotion;

-- SELECT *
-- FROM dim_promotion;


-- Store data in dim_date table
-------------------------------

-- INSERT INTO dim_date(
--     date_key,
--     date_string,
--     year,
--     month,
--     day,
--     weekday,
--     weekend,
--     holiday,
--     fiscal_quarter,
--     season
-- )

-- SELECT 

--     date_key,
--     date_string,
--     year,
--     month,
--     day,
--     weekday,
--     weekend,
--     holiday,
--     quarter,
--     season

-- FROM (
--     SELECT *
--     FROM openrowset(
--         BULK '/Users/shathusiva/Downloads/2023_date.csv',
--         formatfile = '/Users/shathusiva/Downloads/2023_date.xml',
--         firstrow = 2
--     ) As csv_data
-- ) AS csv_data


-- SELECT *
-- FROM dim_date;

-- BULK INSERT dim_date
-- FROM '/host_shared_directory/2023_date.csv' -- Replace with the actual file path
-- WITH (
--     FIRSTROW = 2,
--     FIELDTERMINATOR = ',',
--     ROWTERMINATOR = '\n'
-- );


-- INSERT INTO fact_sales_info(
--     sales_key,
--     product_key,
--     customer_key,
--     promotion_key,
--     store_key,
--     order_item_key,
--     unit_sold,
--     gross_total,
--     discount,
--     net_total,
--     order_created_date,
--     payment_date
-- )

-- SELECT 
--     sales.orders.orders_id,
--     dim_product.product_key,
--     dim_customer.customer_key,
--     dim_promotion.promotion_key,
--     dim_store.store_key,
--     sales.order_item.order_item_id,
--     sales.order_item.quantity,
--     sales.orders.gross_total,
--     sales.orders.discount,
--     sales.orders.net_total,
--     sales.order_item.created_at,
--     sales.orders.created_at

-- FROM sales.orders

-- INNER JOIN sales.order_item ON sales.orders.order_item_id = sales.order_item.order_item_id
-- INNER JOIN dim_product ON sales.order_item.product_id = dim_product.product_key
-- INNER JOIN dim_customer ON sales.orders.customer_id = dim_customer.customer_key
-- LEFT JOIN dim_promotion ON sales.order_item.promotion_id = dim_promotion.promotion_key
-- INNER JOIN dim_store ON sales.order_item.store_id = dim_store.store_key

-- SELECT * 
-- FROM fact_sales_info;


