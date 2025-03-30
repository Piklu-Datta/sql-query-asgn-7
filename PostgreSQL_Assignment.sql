CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0) NOT NULL,
    stock INT CHECK (stock >= 0) NOT NULL,
    published_year INT 
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

INSERT INTO customers (name, email, joined_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');

INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 2, 1, '2024-03-10'),
(2, 1, 1, '2024-02-20'),
(1, 3, 2, '2024-03-05');

-- Number1:-
SELECT * FROM books
 WHERE stock = 0;

--Number2:-
SELECT * FROM books 
ORDER BY price DESC 
LIMIT 1;

--Number3:-


--Number4:-
SELECT sum(orders.quantity*books.price) as total_revenue
 from books
 INNER JOIN orders on orders.book_id = books.id

--Number5:-
SELECT customers.name, count(orders.id) as total_orders
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING count(orders.id) > 1
ORDER BY total_orders DESC;

 --Number6:-
 SELECT  Round(avg(price),2) as total_revenue 
 from books

 --Number7:-
 UPDATE books 
SET price = price+ price* 0.1
WHERE  published_year < 2000;

--Number8:-
SELECT * from customers 
WHERE id  IN
(SELECT DISTINCT customer_id from orders)
