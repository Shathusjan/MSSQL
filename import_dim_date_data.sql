-- SELECT *
-- FROM dim_date;

-- DROP TABLE dim_date;

-- -- Import data from CSV file

-- BULK INSERT dim_date
-- FROM '/Users/shathusiva/Documents/GitHub/MSSQL/2023_date.csv' -- Replace with the actual file path
-- WITH (
--     FIRSTROW = 2,
--     FIELDTERMINATOR = ',',
--     ROWTERMINATOR = '\n'
-- );
