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
    AUTHOR_ID INT AUTO_INCREMENT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(215) NOT NULL
);

-- =======================================================
-- TABLE: BOOKS
-- =======================================================
CREATE TABLE IF NOT EXISTS BOOKS (
    BOOK_ID INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(130) NOT NULL,
    AUTHOR_ID INT NOT NULL,
    PRICE DOUBLE NOT NULL,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =======================================================
-- TABLE: CUSTOMERS
-- =======================================================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) UNIQUE,
    ADDRESS TEXT
);

-- =======================================================
-- TABLE: ORDERS
-- =======================================================
CREATE TABLE IF NOT EXISTS ORDERS (
    ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =======================================================
-- TABLE: ORDER_DETAILS
-- =======================================================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    ORDERDETAILID INT AUTO_INCREMENT PRIMARY KEY,
    ORDER_ID INT NOT NULL,
    BOOK_ID INT NOT NULL,
    QUANTITY DOUBLE NOT NULL CHECK (QUANTITY > 0),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- =======================================================
-- END OF SCRIPT
-- =======================================================
