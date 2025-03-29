1.What is PostgreSQL?
PostgreSQL is an open-source, advanced relational database management system (RDBMS) known for its robustness, extensibility, and compliance with SQL standards. It supports complex queries, transactions, and advanced features like JSONB, full-text search, and concurrency control.
2.What is the purpose of a database schema in PostgreSQL?
A database schema in PostgreSQL is a logical structure that organizes database objects. It helps in:-
i.Namespace management: Prevents table name conflicts.
ii.Access control: Different schemas can have different permissions.
iii.Better organization: Helps separate different parts of a database
3.Explain the Primary Key and Foreign Key concepts in PostgreSQL?
Primary Key (PK): A unique identifier for a table row. It must be unique and not NULL.
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
Foreign Key (FK): Establishes a relationship between two tables by referencing a primary key.
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);
4.What is the difference between the VARCHAR and CHAR data types?
CHAR:-
1.Fixed-length character string. Always stores exactly n characters.
2.Always occupies n bytes, even if the stored string is shorter.
3.Faster for fixed-size strings, as it avoids length calculations.
VARCHAR:-
1.Variable-length character string. Stores only the required characters up to n.
2.Uses only the actual length of the stored string, plus 1 byte for length tracking.
3.Slightly slower due to length calculations but more efficient for varying text sizes.

5.Explain the purpose of the WHERE clause in a SELECT statement?
The WHERE clause is used to filter records based on a condition.
SELECT * FROM books
WHERE price > 30;

6.What are the LIMIT and OFFSET clauses used for?
LIMIT: Restricts the number of rows returned.
OFFSET: Skips a specified number of rows before fetching data.
SELECT * FROM books 
LIMIT 5 
OFFSET 10;
It fetches 5 books, skipping the first 10 books
7.How can you modify data using UPDATE statements?
The UPDATE statement modifies existing data in a table.
Example:-
Increase the price of all books by 10%:
UPDATE books SET price = price * 1.10;

8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
The JOIN operation combines rows from multiple tables based on related columns.
Types of JOINs:

INNER JOIN (returns matching rows)

LEFT JOIN (returns all rows from the left table, with NULLs for non-matching rows from the right table)

RIGHT JOIN (opposite of LEFT JOIN)

FULL JOIN (returns all rows from both tables)
9.Explain the GROUP BY clause and its role in aggregation operations?
The GROUP BY clause groups rows that have the same values in specified columns, allowing aggregate functions like COUNT(), SUM(), AVG(),MAX(),MIN()
10.How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
COUNT(): Counts the number of rows.
SELECT COUNT(*) FROM books;
SUM(): Adds up values.
SELECT SUM(price) FROM books;
AVG(): Computes the average value.
SELECT AVG(price) FROM books;


