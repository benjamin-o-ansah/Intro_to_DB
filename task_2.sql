-- =======================================================
-- DATABASE: alx_book_store
-- PURPOSE:  Create all required tables for the bookstore
-- AUTHOR:   Your Name
-- =======================================================

USE alx_book_store;

-- =======================================================
-- TABLE: AUTHORS
-- =======================================================
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- =======================================================
-- TABLE: BOOKS
-- =======================================================
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id  INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =======================================================
-- TABLE: CUSTOMERS
-- =======================================================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
   customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);

-- =======================================================
-- TABLE: ORDERS
-- =======================================================
CREATE TABLE IF NOT EXISTS ORDERS (
 order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =======================================================
-- TABLE: ORDER_DETAILS
-- =======================================================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =======================================================
-- END OF SCRIPT
-- =======================================================
