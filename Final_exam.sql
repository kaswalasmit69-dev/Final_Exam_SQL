Step 1: Create the database and tables

CREATE DATABASE Library_Management;
USE Library_Management;

Step 2: Create the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
);

Step 3: Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author_id INT,
    category VARCHAR(50),
    isbn VARCHAR(20),
    published_date DATE,
    price DECIMAL(10,2),
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

Step 4: Create the Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    membership_date DATE
);

Step 5: Create the Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    fine_amount DECIMAL(10,2),
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

Step 6: Insert records into the tables

6.1 Insert authors
INSERT INTO Authors (name, email)
VALUES
('Amit Shah', 'amit@gmail.com'),
('Neha Patel', 'neha@gmail.com'),
('Raj Mehta', 'raj@gmail.com');

6.2 Insert books
INSERT INTO Books
(title, author_id, category, isbn, published_date, price, available_copies)
VALUES
('Python Basics', 1, 'Science', 'ISBN101', '2021-05-10', 450, 5),
('Database Systems', 2, 'Technology', 'ISBN102', '2019-06-15', 600, 3),
('Machine Learning', 3, 'Technology', 'ISBN103', '2023-02-20', 750, 4),
('Data Science', 1, 'Science', 'ISBN104', '1998-04-10', 350, 2),
('Web Development', 2, 'Technology', 'ISBN105', '2022-08-12', 500, 6);

6.3 Insert members
INSERT INTO Members
(name, email, phone_number, membership_date)
VALUES
('Sumit', 'sumit@gmail.com', '9876543210', '2023-01-10'),
('Rahul', 'rahul@gmail.com', '9876543211', '2024-03-15'),
('Priya', 'priya@gmail.com', '9876543212', '2025-06-20');

6.4 Insert transactions
INSERT INTO Transactions
(member_id, book_id, borrow_date, return_date, fine_amount)
VALUES
(1, 1, '2026-01-10', '2026-01-20', 0),
(1, 2, '2026-03-05', NULL, 50),
(2, 3, '2026-05-10', '2026-05-20', 0),
(2, 1, '2025-08-15', '2025-08-25', 20),
(3, 5, '2026-07-01', NULL, 0);

Step 7: Implement CRUD operations

INSERT INTO Books
(title, author_id, category, isbn, published_date, price, available_copies)
VALUES
('SQL Basics', 1, 'Technology', 'ISBN106', '2024-01-10', 400, 5);


UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 1 AND available_copies > 0;

UPDATE Books
SET available_copies = available_copies + 1
WHERE book_id = 1;

DELETE FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
    WHERE borrow_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

SELECT *
FROM Books
WHERE available_copies > 0;
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Python Basics    |         1 | Science    | ISBN101 | 2021-05-10     | 450.00 |                5 |
|       2 | Database Systems |         2 | Technology | ISBN102 | 2019-06-15     | 600.00 |                3 |
|       3 | Machine Learning |         3 | Technology | ISBN103 | 2023-02-20     | 750.00 |                4 |
|       4 | Data Science     |         1 | Science    | ISBN104 | 1998-04-10     | 350.00 |                2 |
|       5 | Web Development  |         2 | Technology | ISBN105 | 2022-08-12     | 500.00 |                6 |
|       6 | SQL Basics       |         1 | Technology | ISBN106 | 2024-01-10     | 400.00 |                5 |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
6 rows in set (0.164 sec)

Step 8: Use SQL clauses — WHERE, HAVING, LIMIT

SELECT *
FROM Books
WHERE published_date > '2015-12-31';
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Python Basics    |         1 | Science    | ISBN101 | 2021-05-10     | 450.00 |                5 |
|       2 | Database Systems |         2 | Technology | ISBN102 | 2019-06-15     | 600.00 |                3 |
|       3 | Machine Learning |         3 | Technology | ISBN103 | 2023-02-20     | 750.00 |                4 |
|       5 | Web Development  |         2 | Technology | ISBN105 | 2022-08-12     | 500.00 |                6 |
|       6 | SQL Basics       |         1 | Technology | ISBN106 | 2024-01-10     | 400.00 |                5 |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
5 rows in set (0.159 sec)

SELECT *
FROM Books
ORDER BY price DESC
LIMIT 5;
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
|       3 | Machine Learning |         3 | Technology | ISBN103 | 2023-02-20     | 750.00 |                4 |
|       2 | Database Systems |         2 | Technology | ISBN102 | 2019-06-15     | 600.00 |                3 |
|       5 | Web Development  |         2 | Technology | ISBN105 | 2022-08-12     | 500.00 |                6 |
|       1 | Python Basics    |         1 | Science    | ISBN101 | 2021-05-10     | 450.00 |                5 |
|       6 | SQL Basics       |         1 | Technology | ISBN106 | 2024-01-10     | 400.00 |                5 |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
5 rows in set (0.141 sec)

SELECT *
FROM Members
WHERE membership_date < '2022-01-01';

Step 9: Apply SQL operators — AND, OR, NOT
SELECT *
FROM Books
WHERE category = 'Science' AND price < 500;
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title         | author_id | category | isbn    | published_date | price  | available_copies |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Python Basics |         1 | Science  | ISBN101 | 2021-05-10     | 450.00 |                5 |
|       4 | Data Science  |         1 | Science  | ISBN104 | 1998-04-10     | 350.00 |                2 |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
2 rows in set (0.022 sec)

SELECT *
FROM Books
WHERE NOT available_copies > 0;


SELECT m.member_id, m.name
FROM Members m
WHERE m.membership_date > '2020-12-31'
OR (
    SELECT COUNT(*)
    FROM Transactions t
    WHERE t.member_id = m.member_id
) > 3;
+-----------+-------+
| member_id | name  |
+-----------+-------+
|         1 | Sumit |
|         2 | Rahul |
|         3 | Priya |
+-----------+-------+
3 rows in set (0.042 sec)

Step 10: Sorting and grouping data — ORDER BY, GROUP BY
SELECT *
FROM Books
ORDER BY title ASC;
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
|       4 | Data Science     |         1 | Science    | ISBN104 | 1998-04-10     | 350.00 |                2 |
|       2 | Database Systems |         2 | Technology | ISBN102 | 2019-06-15     | 600.00 |                3 |
|       3 | Machine Learning |         3 | Technology | ISBN103 | 2023-02-20     | 750.00 |                4 |
|       1 | Python Basics    |         1 | Science    | ISBN101 | 2021-05-10     | 450.00 |                5 |
|       6 | SQL Basics       |         1 | Technology | ISBN106 | 2024-01-10     | 400.00 |                5 |
|       5 | Web Development  |         2 | Technology | ISBN105 | 2022-08-12     | 500.00 |                6 |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
6 rows in set (0.151 sec)

SELECT m.member_id, m.name, COUNT(t.transaction_id) AS total_borrowed
FROM Members m
LEFT JOIN Transactions t ON m.member_id = t.member_id
GROUP BY m.member_id, m.name;
+-----------+-------+----------------+
| member_id | name  | total_borrowed |
+-----------+-------+----------------+
|         1 | Sumit |              2 |
|         2 | Rahul |              2 |
|         3 | Priya |              1 |
+-----------+-------+----------------+
3 rows in set (0.153 sec)

SELECT category, COUNT(*) AS total_books
FROM Books
GROUP BY category;
+------------+-------------+
| category   | total_books |
+------------+-------------+
| Science    |           2 |
| Technology |           4 |
+------------+-------------+
2 rows in set (0.013 sec)

Step 11: Use aggregate functions — SUM, AVG, MAX, MIN, COUNT
SELECT category, SUM(available_copies) AS total_books
FROM Books
GROUP BY category;
+------------+-------------+
| category   | total_books |
+------------+-------------+
| Science    |           7 |
| Technology |          18 |
+------------+-------------+
2 rows in set (0.145 sec)

SELECT AVG(price) AS average_price
FROM Books;
+---------------+
| average_price |
+---------------+
|    508.333333 |
+---------------+
1 row in set (0.031 sec)

SELECT b.book_id, b.title, COUNT(t.transaction_id) AS borrow_count
FROM Books b
LEFT JOIN Transactions t ON b.book_id = t.book_id
GROUP BY b.book_id, b.title
ORDER BY borrow_count DESC
LIMIT 1;
+---------+---------------+--------------+
| book_id | title         | borrow_count |
+---------+---------------+--------------+
|       1 | Python Basics |            2 |
+---------+---------------+--------------+
1 row in set (0.155 sec)

SELECT SUM(fine_amount) AS total_fines
FROM Transactions;
+-------------+
| total_fines |
+-------------+
|       70.00 |
+-------------+
1 row in set (0.009 sec)

Step 12: Establish primary and foreign key relationships

SELECT b.book_id, b.title, a.author_id, a.name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;
+---------+------------------+-----------+------------+
| book_id | title            | author_id | name       |
+---------+------------------+-----------+------------+
|       1 | Python Basics    |         1 | Amit Shah  |
|       2 | Database Systems |         2 | Neha Patel |
|       3 | Machine Learning |         3 | Raj Mehta  |
|       4 | Data Science     |         1 | Amit Shah  |
|       5 | Web Development  |         2 | Neha Patel |
|       6 | SQL Basics       |         1 | Amit Shah  |
+---------+------------------+-----------+------------+
6 rows in set (0.014 sec)

Step 13: Implement joins
SELECT b.title, a.name AS author_name
FROM Books b
INNER JOIN Authors a ON b.author_id = a.author_id;
+------------------+-------------+
| title            | author_name |
+------------------+-------------+
| Python Basics    | Amit Shah   |
| Database Systems | Neha Patel  |
| Machine Learning | Raj Mehta   |
| Data Science     | Amit Shah   |
| Web Development  | Neha Patel  |
| SQL Basics       | Amit Shah   |
+------------------+-------------+
6 rows in set (0.012 sec)

SELECT m.name, b.title
FROM Members m
LEFT JOIN Transactions t ON m.member_id = t.member_id
LEFT JOIN Books b ON t.book_id = b.book_id;
+-------+------------------+
| name  | title            |
+-------+------------------+
| Sumit | Python Basics    |
| Sumit | Database Systems |
| Rahul | Machine Learning |
| Rahul | Python Basics    |
| Priya | Web Development  |
+-------+------------------+
5 rows in set (0.014 sec)

SELECT b.book_id, b.title
FROM Transactions t
RIGHT JOIN Books b ON t.book_id = b.book_id
WHERE t.transaction_id IS NULL;
+---------+--------------+
| book_id | title        |
+---------+--------------+
|       4 | Data Science |
|       6 | SQL Basics   |
+---------+--------------+
2 rows in set (0.011 sec)

SELECT m.member_id, m.name, t.transaction_id, t.book_id
FROM Members m
LEFT JOIN Transactions t ON m.member_id = t.member_id

UNION

SELECT m.member_id, m.name, t.transaction_id, t.book_id
FROM Members m
RIGHT JOIN Transactions t ON m.member_id = t.member_id;
+-----------+-------+----------------+---------+
| member_id | name  | transaction_id | book_id |
+-----------+-------+----------------+---------+
|         1 | Sumit |              1 |       1 |
|         1 | Sumit |              2 |       2 |
|         2 | Rahul |              3 |       3 |
|         2 | Rahul |              4 |       1 |
|         3 | Priya |              5 |       5 |
+-----------+-------+----------------+---------+
5 rows in set (0.040 sec)

Step 14: Use subqueries
SELECT *
FROM Books
WHERE book_id IN (
    SELECT book_id
    FROM Transactions
    WHERE member_id IN (
        SELECT member_id
        FROM Members
        WHERE membership_date > '2022-12-31'
    )
);
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Python Basics    |         1 | Science    | ISBN101 | 2021-05-10     | 450.00 |                5 |
|       2 | Database Systems |         2 | Technology | ISBN102 | 2019-06-15     | 600.00 |                3 |
|       3 | Machine Learning |         3 | Technology | ISBN103 | 2023-02-20     | 750.00 |                4 |
|       5 | Web Development  |         2 | Technology | ISBN105 | 2022-08-12     | 500.00 |                6 |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
4 rows in set (0.042 sec)

SELECT *
FROM Books
WHERE book_id = (
    SELECT book_id
    FROM Transactions
    GROUP BY book_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
| book_id | title         | author_id | category | isbn    | published_date | price  | available_copies |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
|       1 | Python Basics |         1 | Science  | ISBN101 | 2021-05-10     | 450.00 |                5 |
+---------+---------------+-----------+----------+---------+----------------+--------+------------------+
1 row in set (0.152 sec)

SELECT *
FROM Members
WHERE member_id NOT IN (
    SELECT member_id
    FROM Transactions
);

Step 15: Implement date and time functions

SELECT YEAR(published_date) AS publication_year,
       COUNT(*) AS total_books
FROM Books
GROUP BY YEAR(published_date);
+------------------+-------------+
| publication_year | total_books |
+------------------+-------------+
|             2021 |           1 |
|             2019 |           1 |
|             2023 |           1 |
|             1998 |           1 |
|             2022 |           1 |
|             2024 |           1 |
+------------------+-------------+
6 rows in set (0.040 sec)

SELECT transaction_id, borrow_date, return_date,
       DATEDIFF(return_date, borrow_date) AS borrowing_days
FROM Transactions;
+----------------+-------------+-------------+----------------+
| transaction_id | borrow_date | return_date | borrowing_days |
+----------------+-------------+-------------+----------------+
|              1 | 2026-01-10  | 2026-01-20  |             10 |
|              2 | 2026-03-05  | NULL        |           NULL |
|              3 | 2026-05-10  | 2026-05-20  |             10 |
|              4 | 2025-08-15  | 2025-08-25  |             10 |
|              5 | 2026-07-01  | NULL        |           NULL |
+----------------+-------------+-------------+----------------+
5 rows in set (0.026 sec)

SELECT transaction_id,
       DATE_FORMAT(borrow_date, '%d-%m-%Y') AS borrow_date
FROM Transactions;
+----------------+-------------+
| transaction_id | borrow_date |
+----------------+-------------+
|              1 | 10-01-2026  |
|              2 | 05-03-2026  |
|              3 | 10-05-2026  |
|              4 | 15-08-2025  |
|              5 | 01-07-2026  |
+----------------+-------------+
5 rows in set (0.162 sec)

Step 16: Use string manipulation functions
SELECT UPPER(title) AS title
FROM Books;
+------------------+
| title            |
+------------------+
| PYTHON BASICS    |
| DATABASE SYSTEMS |
| MACHINE LEARNING |
| DATA SCIENCE     |
| WEB DEVELOPMENT  |
| SQL BASICS       |
+------------------+
6 rows in set (0.017 sec)

SELECT TRIM(name) AS author_name
FROM Authors;
+-------------+
| author_name |
+-------------+
| Amit Shah   |
| Neha Patel  |
| Raj Mehta   |
+-------------+
3 rows in set (0.149 sec)

SELECT member_id, name,
       COALESCE(NULLIF(TRIM(email), ''), 'Not Provided') AS email
FROM Members;
+-----------+-------+-----------------+
| member_id | name  | email           |
+-----------+-------+-----------------+
|         1 | Sumit | sumit@gmail.com |
|         2 | Rahul | rahul@gmail.com |
|         3 | Priya | priya@gmail.com |
+-----------+-------+-----------------+
3 rows in set (0.147 sec)

Step 17: Implement window functions

SELECT b.title,
       COUNT(t.transaction_id) AS borrow_count,
       RANK() OVER (
           ORDER BY COUNT(t.transaction_id) DESC
       ) AS book_rank
FROM Books b
LEFT JOIN Transactions t ON b.book_id = t.book_id
GROUP BY b.book_id, b.title;
+------------------+--------------+-----------+
| title            | borrow_count | book_rank |
+------------------+--------------+-----------+
| Python Basics    |            2 |         1 |
| Database Systems |            1 |         2 |
| Machine Learning |            1 |         2 |
| Web Development  |            1 |         2 |
| Data Science     |            0 |         5 |
| SQL Basics       |            0 |         5 |
+------------------+--------------+-----------+
6 rows in set (0.070 sec)

SELECT member_id, transaction_id, borrow_date,
       COUNT(*) OVER (
           PARTITION BY member_id
           ORDER BY borrow_date, transaction_id
       ) AS cumulative_borrowed
FROM Transactions;
+-----------+----------------+-------------+---------------------+
| member_id | transaction_id | borrow_date | cumulative_borrowed |
+-----------+----------------+-------------+---------------------+
|         1 |              1 | 2026-01-10  |                   1 |
|         1 |              2 | 2026-03-05  |                   2 |
|         2 |              4 | 2025-08-15  |                   1 |
|         2 |              3 | 2026-05-10  |                   2 |
|         3 |              5 | 2026-07-01  |                   1 |
+-----------+----------------+-------------+---------------------+
5 rows in set (0.032 sec)

SELECT borrow_date,
       COUNT(*) AS books_borrowed,
       AVG(COUNT(*)) OVER (
           ORDER BY borrow_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_average
FROM Transactions
WHERE borrow_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY borrow_date;

Step 18: Apply SQL CASE expressions
SELECT m.member_id, m.name,
       CASE
           WHEN MAX(t.borrow_date) >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
               THEN 'Active'
           ELSE 'Inactive'
       END AS Membership_Status
FROM Members m
LEFT JOIN Transactions t ON m.member_id = t.member_id
GROUP BY m.member_id, m.name;
+-----------+-------+-------------------+
| member_id | name  | Membership_Status |
+-----------+-------+-------------------+
|         1 | Sumit | Inactive          |
|         2 | Rahul | Active            |
|         3 | Priya | Active            |
+-----------+-------+-------------------+
3 rows in set (0.158 sec)

SELECT title, published_date,
       CASE
           WHEN published_date > '2020-12-31' THEN 'New Arrival'
           WHEN published_date < '2000-01-01' THEN 'Classic'
           ELSE 'Regular'
       END AS book_category
FROM Books;
+------------------+----------------+---------------+
| title            | published_date | book_category |
+------------------+----------------+---------------+
| Python Basics    | 2021-05-10     | New Arrival   |
| Database Systems | 2019-06-15     | Regular       |
| Machine Learning | 2023-02-20     | New Arrival   |
| Data Science     | 1998-04-10     | Classic       |
| Web Development  | 2022-08-12     | New Arrival   |
| SQL Basics       | 2024-01-10     | New Arrival   |
+------------------+----------------+---------------+
6 rows in set (0.019 sec)

Step:-19 Final Run
SHOW TABLES;
+------------------------------+
| Tables_in_library_management |
+------------------------------+
| authors                      |
| books                        |
| members                      |
| transactions                 |
+------------------------------+
4 rows in set (0.023 sec)

SELECT * FROM Authors;
+-----------+------------+----------------+
| author_id | name       | email          |
+-----------+------------+----------------+
|         1 | Amit Shah  | amit@gmail.com |
|         2 | Neha Patel | neha@gmail.com |
|         3 | Raj Mehta  | raj@gmail.com  |
+-----------+------------+----------------+
3 rows in set (0.008 sec)

SELECT * FROM Books;
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
| book_id | title            | author_id | category   | isbn    | published_date | price  | available_copies |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
|       1 | Python Basics    |         1 | Science    | ISBN101 | 2021-05-10     | 450.00 |                5 |
|       2 | Database Systems |         2 | Technology | ISBN102 | 2019-06-15     | 600.00 |                3 |
|       3 | Machine Learning |         3 | Technology | ISBN103 | 2023-02-20     | 750.00 |                4 |
|       4 | Data Science     |         1 | Science    | ISBN104 | 1998-04-10     | 350.00 |                2 |
|       5 | Web Development  |         2 | Technology | ISBN105 | 2022-08-12     | 500.00 |                6 |
|       6 | SQL Basics       |         1 | Technology | ISBN106 | 2024-01-10     | 400.00 |                5 |
+---------+------------------+-----------+------------+---------+----------------+--------+------------------+
6 rows in set (0.008 sec)

SELECT * FROM Members;
+-----------+-------+-----------------+--------------+-----------------+
| member_id | name  | email           | phone_number | membership_date |
+-----------+-------+-----------------+--------------+-----------------+
|         1 | Sumit | sumit@gmail.com | 9876543210   | 2023-01-10      |
|         2 | Rahul | rahul@gmail.com | 9876543211   | 2024-03-15      |
|         3 | Priya | priya@gmail.com | 9876543212   | 2025-06-20      |
+-----------+-------+-----------------+--------------+-----------------+
3 rows in set (0.010 sec)

SELECT * FROM Transactions;
+----------------+-----------+---------+-------------+-------------+-------------+
| transaction_id | member_id | book_id | borrow_date | return_date | fine_amount |
+----------------+-----------+---------+-------------+-------------+-------------+
|              1 |         1 |       1 | 2026-01-10  | 2026-01-20  |        0.00 |
|              2 |         1 |       2 | 2026-03-05  | NULL        |       50.00 |
|              3 |         2 |       3 | 2026-05-10  | 2026-05-20  |        0.00 |
|              4 |         2 |       1 | 2025-08-15  | 2025-08-25  |       20.00 |
|              5 |         3 |       5 | 2026-07-01  | NULL        |        0.00 |
+----------------+-----------+---------+-------------+-------------+-------------+
5 rows in set (0.010 sec)





