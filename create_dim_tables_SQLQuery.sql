-- Create Dimensional tables

CREATE TABLE dim_product(
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description VARCHAR(100),
    category_id INT NOT NULL,
    category_name VARCHAR(100) NOT NULL,
    type_id INT NOT NULL,
    type_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (category_id) REFERENCES production.category(category_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (type_id) REFERENCES production.product_type(type_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
)