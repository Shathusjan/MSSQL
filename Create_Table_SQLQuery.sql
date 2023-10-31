/*
--------------------------------------------------------------------
--------------------------------------------------------------------
Name   : ToyStore
Version: 1.0
--------------------------------------------------------------------
*/
-- create schemas
CREATE SCHEMA production;
go

CREATE SCHEMA sales;
go

-- create tables

CREATE TABLE production.product_type (
    type_id INT IDENTITY (1, 1) PRIMARY KEY,
    type_name VARCHAR (255) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE production.category (
    category_id INT IDENTITY (1, 1) PRIMARY KEY,
    category_name VARCHAR (255) NOT NULL,
    type_id INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY (type_id) REFERENCES production.product_type (type_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE production.product (
    product_id INT IDENTITY (1, 1) PRIMARY KEY,
    product_name VARCHAR (255) NOT NULL,
    description VARCHAR(225) NULL,
    unit_price DECIMAL (10,2) NOT NULL,
    category_id INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (category_id) REFERENCES production.category (category_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE sales.store (
    store_id INT IDENTITY (1,1) PRIMARY KEY,
    store_name VARCHAR(225) NOT NULL,
    phone VARCHAR (25),
    email VARCHAR (255),
    city VARCHAR(100) NOT NULL,
    store_state VARCHAR(50),
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP

);


CREATE TABLE production.stock (
    stock_id INT IDENTITY (1,1) PRIMARY KEY,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    product_quantity INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (store_id) REFERENCES sales.store (store_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (product_id) REFERENCES production.product (product_id) ON DELETE NO ACTION ON UPDATE NO ACTION

);



-- CREATE TABLE sales.customer_segment (
--     segment_id INT IDENTITY (1,1)  PRIMARY KEY,
--     segement_name VARCHAR(100) NOT NULL,
--     created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP
-- );

CREATE TABLE sales.customer (
    customer_id INT IDENTITY (1, 1) PRIMARY KEY,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    gender VARCHAR(10),
    dob DATETIME,
    phone VARCHAR (25),
    email VARCHAR (255) ,
    segment_type VARCHAR(20) NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- FOREIGN KEY (segment_id) REFERENCES sales.customer_segment (segment_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE sales.promotion(
    promotion_id INT IDENTITY (1, 1) PRIMARY KEY,
    promotion_name VARCHAR(100) NOT NULL,
    promotion_type VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NULL,
    discount_value DECIMAL(4,2) NOT NULL DEFAULT 0,
    description VARCHAR(100) NULL,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id) REFERENCES sales.customer (customer_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (product_id) REFERENCES production.product (product_id) ON DELETE NO ACTION ON UPDATE NO ACTION

);

CREATE TABLE sales.order_item (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    store_id INT NOT NULL,
    promotion_id INT NOT NULL,
    quantity INT NOT NULL,
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (store_id) REFERENCES sales.store (store_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (product_id) REFERENCES production.product (product_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (promotion_id) REFERENCES sales.promotion (promotion_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE sales.orders (
    orders_id INT IDENTITY (1, 1) PRIMARY KEY,
    order_item_id INT NOT NULL,
    customer_id INT NOT NULL,
    note VARCHAR(225),
    created_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_item_id) REFERENCES sales.order_item (order_item_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (customer_id) REFERENCES sales.customer (customer_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);



-- CREATE TABLE production.stocks (
--  store_id INT,
--  product_id INT,
--  quantity INT,
--  PRIMARY KEY (store_id, product_id),
--  FOREIGN KEY (store_id) REFERENCES sales.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
--  FOREIGN KEY (product_id) REFERENCES production.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
-- );