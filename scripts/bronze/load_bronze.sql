-- ========================================================
-- Table to store raw order data from orders.csv
-- ========================================================
CREATE TABLE bronze.orders_raw (
    order_id INT,
    user_id INT,
    eval_set NVARCHAR(20), -- Evaluation set (e.g., 'train', 'prior', 'test')
    order_number INT,      -- Order sequence number for the user
    order_dow INT,         -- Day of week (0=Sunday)
    order_hour_of_day INT, -- Hour of day when the order was placed
    days_since_prior_order FLOAT -- Time since the user's last order
);

-- ========================================================
-- Table to store prior order products from order_products__prior.csv
-- ========================================================
CREATE TABLE bronze.order_products_prior_raw (
    order_id INT,
    product_id INT,
    add_to_cart_order INT, -- Position in which the product was added to the cart
    reordered INT          -- Whether the product was reordered (0 or 1)
);

-- ========================================================
-- Table to store training order products from order_products__train.csv
-- ========================================================
CREATE TABLE bronze.order_products_train_raw (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);

-- ========================================================
-- Table to store product metadata from products.csv
-- ========================================================
DROP TABLE IF EXISTS bronze.products_raw;
CREATE TABLE bronze.products_raw (
    product_id INT,                -- Unique identifier for the product
    product_name VARCHAR(255),     -- Name of the product
    aisle_id INT,                  -- Foreign key referencing aisles
    department_id INT              -- Foreign key referencing departments
);

-- ========================================================
-- Table to store department metadata from departments.csv
-- ========================================================
CREATE TABLE bronze.departments_raw (
    department_id INT,         -- Unique department identifier
    department NVARCHAR(50)    -- Department name
);

-- ========================================================
-- Table to store aisle metadata from aisles.csv
-- ========================================================
CREATE TABLE bronze.aisles_raw (
    aisle_id INT,              -- Unique aisle identifier
    aisle NVARCHAR(50)         -- Aisle name
);
