-- Transfer data from source to target

-- Product Dimensions dim_product

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

