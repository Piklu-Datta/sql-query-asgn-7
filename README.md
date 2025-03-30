## 1. What is Postgresql?
PostgreSQL is an open-source, advanced relational database management system (RDBMS) known for its robustness, extensibility, and compliance with SQL standards. It supports complex queries, transactions, and advanced features like JSONB, full-text search, and concurrency control.

## 2. What is the purpose of a database schema in PostgreSQL?
A database schema in PostgreSQL is a logical structure that organizes database objects. It helps in:
- **Namespace management**:Prevents table name conflicts.
- **Access control**:Different schemas can have different permissions.
- **Better organization**:Helps separate different parts of a database.

## 3.Primary Key and Foreign Key concepts in PostgreSQL?
### Primary Key (PK)
A unique identifier for a table row. It must be unique and not NULL.
```sql
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```
### Foreign Key (FK)
Establishes a relationship between two tables by referencing a primary key.
```sql
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE
);
```
## 4. Difference between VARCHAR and CHAR data types
| Data Type | Description |
|-----------|-------------|
| **CHAR**  | Fixed-length character string. Always stores exactly `n` characters. Occupies `n` bytes. Faster for fixed-size strings. |
| **VARCHAR** | Variable-length character string. Stores only required characters up to `n`. Uses actual length + 1 byte. More efficient for varying text sizes. |

## 5. Purpose of the WHERE clause in a SELECT statement
The `WHERE` clause filters records based on a condition.
```sql
SELECT * FROM books WHERE price > 30;
```

## 6. LIMIT and OFFSET clauses
- **LIMIT**: Restricts the number of rows returned.
- **OFFSET**: Skips a specified number of rows before fetching data.
```sql
SELECT * FROM books LIMIT 5 OFFSET 10; -- Fetches 5 books, skipping the first 10
```

## 7. Modifying Data with UPDATE Statements
The `UPDATE` statement modifies existing data in a table.
```sql
UPDATE books SET price = price * 1.10; -- Increase price by 10%
```

## 8. Significance of the JOIN operation
The `JOIN` operation combines rows from multiple tables based on related columns.

### Types of JOINs:
- **INNER JOIN**: Returns matching rows.
- **LEFT JOIN**: Returns all rows from the left table, with NULLs for non-matching rows from the right table.
- **RIGHT JOIN**: Returns all rows from the right table, with NULLs for non-matching rows from the left table.
- **FULL JOIN**: Returns all rows from both tables.

## 9. GROUP BY Clause and Aggregation Operations
The `GROUP BY` clause groups rows that have the same values in specified columns, allowing aggregate functions like:
- `COUNT()` - Counts the number of rows.
- `SUM()` - Adds up values.
- `AVG()` - Computes the average value.
- `MAX()` - Retrieves the maximum value.
- `MIN()` - Retrieves the minimum value.

## 10. Aggregate Functions in PostgreSQL
```sql
SELECT COUNT(*) FROM books; -- Count number of rows
SELECT SUM(price) FROM books; -- Sum of prices
SELECT AVG(price) FROM books; -- Average price
```
  
