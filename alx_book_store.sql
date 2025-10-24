use alx_book_store;

-- Optional: Create a new database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- ==============================================
-- TABLE: Authors
-- ==============================================
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    author_name VARCHAR(215) NOT NULL
);

-- ==============================================
-- TABLE: Books
-- ==============================================
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- ==============================================
-- TABLE: Customers
-- ==============================================
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);

-- ==============================================
-- TABLE: Orders
-- ==============================================
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ==============================================
-- TABLE: Order_Details
-- ==============================================
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
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
