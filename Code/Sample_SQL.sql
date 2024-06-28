CREATE TABLE IF NOT EXISTS brands (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(50),
    zip_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS staffs (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    active BOOLEAN,
    store_id INT REFERENCES stores(store_id),
    manager_id INT REFERENCES staffs(staff_id)
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(50),
    zip_code VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT REFERENCES brands(brand_id),
    category_id INT REFERENCES categories(category_id),
    model_year INT,
    list_price REAL
);

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_status DATE,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT REFERENCES stores(store_id),
    staff_id INT REFERENCES staffs(staff_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_id INT REFERENCES orders(order_id),
    item_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    quantity INT,
    list_price REAL,
    discount REAL
);

CREATE TABLE IF NOT EXISTS stocks (
    store_id INT REFERENCES stores(store_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    PRIMARY KEY (store_id, product_id)
);
