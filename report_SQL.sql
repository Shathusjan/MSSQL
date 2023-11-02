-- List of customers order toys DESC 

SELECT dim_customer.first_name, COUNT(*) AS order_count
FROM fact_sales_info
INNER JOIN dim_customer ON fact_sales_info.customer_key = dim_customer.customer_key
GROUP BY dim_customer.first_name
ORDER BY order_count DESC;


-- Revenue of each store

SELECT dim_store.store_name ,SUM(fact_sales_info.net_total) AS Revenue
FROM fact_sales_info
INNER JOIN dim_store ON fact_sales_info.store_key = dim_store.store_key
GROUP BY dim_store.store_name
ORDER BY Revenue DESC

-- City wise Revenue

SELECT dim_store.city, SUM(fact_sales_info.net_total) AS Revenue
FROM fact_sales_info
INNER JOIN dim_store ON fact_sales_info.store_key = dim_store.store_key
GROUP BY dim_store.city
ORDER BY Revenue DESC


-- Which product sold higher

SELECT dim_product.product_name , COUNT(*) AS sold_value
FROM fact_sales_info
INNER JOIN dim_product ON fact_sales_info.product_key = dim_product.product_key
GROUP BY dim_product.product_name
ORDER BY sold_value DESC
