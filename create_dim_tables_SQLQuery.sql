-- Create Dimensional tables

-- CREATE TABLE dim_product(
--     product_key INT IDENTITY(1,1) PRIMARY KEY,
--     product_name VARCHAR(100) NOT NULL,
--     description VARCHAR(100),
--     category_id INT NOT NULL,
--     category_name VARCHAR(100) NOT NULL,
--     type_id INT NOT NULL,
--     type_name VARCHAR(100) NOT NULL,
--     unit_price DECIMAL(10,2) NOT NULL,

--     FOREIGN KEY (category_id) REFERENCES production.category(category_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     FOREIGN KEY (type_id) REFERENCES production.product_type(type_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
-- )


-- CREATE TABLE dim_customer (
--     customer_key INT PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NULL,
--     gender VARCHAR(10) NULL,
--     dob DATE NULL,
--     phone VARCHAR(15) NULL,
--     email VARCHAR(50) NULL,
--     segment_type VARCHAR(50) NULL,
-- )


-- CREATE TABLE dim_promotion (
--     promotion_key INT PRIMARY KEY,
--     promotion_name VARCHAR(50) NOT NULL,
--     promotion_type VARCHAR(50) NOT NULL,
--     start_date DATETIME,
--     end_date DATETIME,
--     discount_value DECIMAL(4,2) NOT NULL,
--     description VARCHAR(100),
--     product_key INT NOT NULL,
--     isActive TINYINT NOT NULL DEFAULT 0,

--     FOREIGN KEY (product_key) REFERENCES dim_product(product_key) ON DELETE NO ACTION ON UPDATE NO ACTION
-- );


-- CREATE TABLE dim_store (
--     store_key  INT PRIMARY KEY,
--     store_name VARCHAR (100),
--     city        VARCHAR (100) NOT NULL,
--     store_state VARCHAR (50)
-- );


-- CREATE TABLE  dim_date (
--     date_key       SMALLINT      PRIMARY KEY,
--     date_string    DATE          NOT NULL,
--     year           SMALLINT,
--     month          TINYINT,
--     day            TINYINT,
--     weekday        NVARCHAR (50),
--     holiday        NVARCHAR (50),
--     fiscal_quarter TINYINT,
--     season         NVARCHAR (50),
-- );


-- CREATE TABLE fact_sales_info (
--     sales_key           SMALLINT        PRIMARY KEY,
--     product_key         INT             NOT NULL,
--     customer_key        INT             NOT NULL,
--     promotion_key       INT,
--     store_key           INT             NOT NULL,
--     date_key            SMALLINT,
--     order_item_key      INT             NOT NULL,
--     unit_sold           INT             NOT NULL,
--     gross_total         DECIMAL(10,2)   NOT NULL,
--     discount            DECIMAL(5,2)    NOT NULL,
--     net_total           DECIMAL(10,2)   NOT NULL,
--     order_created_date  DATETIME,
--     payment_date        DATETIME,

--     FOREIGN KEY (product_key) REFERENCES dim_product(product_key) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key) ON DELETE NO ACTION ON UPDATE NO ACTION,   
--     FOREIGN KEY (promotion_key) REFERENCES dim_promotion(promotion_key) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     FOREIGN KEY (store_key) REFERENCES dim_store(store_key) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     FOREIGN KEY (date_key) REFERENCES dim_date(date_key) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     FOREIGN KEY (order_item_key) REFERENCES sales.order_item (order_item_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
-- )

-- SELECT *
-- FROM fact_sales_info;

