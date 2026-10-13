# 📚 LIBRARY MANAGEMENT SYSTEM
### ✨ A Smart SQL Database Project ✨

**Designed & Developed by Sumit Kaswala**  
**Under the Guidance of Girish Sir**

<br>

![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Language](https://img.shields.io/badge/Language-SQL-CC2927?style=for-the-badge)
![Project](https://img.shields.io/badge/Project-Library%20Management-6A5ACD?style=for-the-badge)

> *“A library is not just a collection of books; it is a collection of knowledge, ideas, and opportunities.”*

</div>

---

## 🌟 Welcome to the Project

Welcome to the **Library Management System**, a database project developed using **MySQL and SQL**. This project demonstrates how a relational database can be designed and used to organize library information in a structured and meaningful way.

A library manages different types of information every day, including books, authors, members, and borrowing records. Managing this information manually can be difficult when the number of records increases. A database helps keep this information organized and makes it easier to insert, update, search, connect, and analyze records.

This project brings the main parts of a library together through related database tables. It also demonstrates a range of SQL concepts, from basic table creation and CRUD operations to joins, subqueries, aggregate functions, window functions, date functions, string functions, and conditional logic.

## 👨‍🎓 Project Information

| Detail | Description |
|---|---|
| **Project Title** | Library Management System |
| **Student Name** | Sumit Kaswala |
| **Project Guide** | Girish Sir |
| **Database Management System** | MySQL |
| **Query Language** | SQL |
| **Main SQL File** | `Final_exam.sql` |
| **Project Type** | Database Management Project |

## 🎯 Project Objectives

The main objectives of this project are:

- To create a database for organizing library information.
- To store author details, book details, member information, and borrowing transactions.
- To establish relationships between tables using primary keys and foreign keys.
- To practise inserting, updating, deleting, and retrieving data.
- To retrieve specific records using SQL conditions and operators.
- To organize information using sorting and grouping.
- To summarize records using aggregate functions.
- To combine related information from multiple tables using joins.
- To retrieve data using subqueries.
- To work with date, time, and string manipulation functions.
- To apply window functions and `CASE` expressions for analysis and classification.
- To build confidence in writing and understanding SQL queries.

## 🏗️ Database Design

The database is named **`Library_Management`** and contains four main tables:

```text
Library_Management
│
├── Authors
│   └── Author information
│
├── Books
│   └── Book information linked to Authors
│
├── Members
│   └── Library member information
│
└── Transactions
    └── Borrowing and return records linked to Members and Books
```

### 📖 1. Authors Table

The `Authors` table stores information about book authors.

| Column | Purpose |
|---|---|
| `author_id` | Unique author identifier and primary key |
| `name` | Author's name |
| `email` | Author's email address |

### 📚 2. Books Table

The `Books` table stores book information and connects each book to an author.

| Column | Purpose |
|---|---|
| `book_id` | Unique book identifier and primary key |
| `title` | Book title |
| `author_id` | Author reference and foreign key |
| `category` | Book category |
| `isbn` | Book ISBN value |
| `published_date` | Publication date |
| `price` | Book price |
| `available_copies` | Number of available copies |

### 👥 3. Members Table

The `Members` table stores information about people registered as library members.

| Column | Purpose |
|---|---|
| `member_id` | Unique member identifier and primary key |
| `name` | Member's name |
| `email` | Member's email address |
| `phone_number` | Member's phone number |
| `membership_date` | Date of membership |

### 🔄 4. Transactions Table

The `Transactions` table records borrowing activity and connects members with books.

| Column | Purpose |
|---|---|
| `transaction_id` | Unique transaction identifier and primary key |
| `member_id` | Member reference and foreign key |
| `book_id` | Book reference and foreign key |
| `borrow_date` | Date the book was borrowed |
| `return_date` | Date the book was returned; may be `NULL` |
| `fine_amount` | Fine amount recorded for the transaction |

## 🔗 Table Relationships

The project uses primary keys and foreign keys to connect related information.

- **Authors → Books:** `Books.author_id` references `Authors.author_id`.
- **Members → Transactions:** `Transactions.member_id` references `Members.member_id`.
- **Books → Transactions:** `Transactions.book_id` references `Books.book_id`.

These relationships allow queries to retrieve related information without storing every detail repeatedly in one table.

## ⚙️ SQL Concepts Demonstrated

### 1. Database and Table Creation

The project creates the `Library_Management` database and the four tables required for the system. It uses `CREATE DATABASE`, `USE`, and `CREATE TABLE`.

### 2. Primary Keys and Foreign Keys

Primary keys uniquely identify records. Foreign keys connect related records across tables and define the relationships used in queries.

### 3. Inserting Data

The `INSERT INTO` statement adds sample authors, books, members, and transactions to the database.

### 4. CRUD Operations

CRUD represents the four basic data operations:

- **Create:** Add a new book using `INSERT`.
- **Read:** Retrieve available books using `SELECT`.
- **Update:** Change the number of available copies using `UPDATE`.
- **Delete:** Remove members that meet the specified deletion condition using `DELETE`.

### 5. SQL Clauses

The project demonstrates:

- `WHERE` to filter records.
- `ORDER BY` to sort records.
- `LIMIT` to restrict the number of returned rows.
- `GROUP BY` to group records.
- `HAVING` as a SQL clause used for filtering groups.

### 6. SQL Operators

The project uses `AND`, `OR`, and `NOT` to combine or reverse conditions when selecting records.

### 7. Aggregate Functions

The project demonstrates:

- `SUM()` — calculates a total.
- `AVG()` — calculates an average.
- `MAX()` — finds the maximum value.
- `MIN()` — finds the minimum value.
- `COUNT()` — counts records.

These functions can be used to summarize book prices, available copies, borrowing records, and fines.

### 8. Joins

The project includes examples of:

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `UNION`

Joins retrieve related information from multiple tables. `UNION` combines the results of compatible `SELECT` statements.

### 9. Subqueries

Subqueries are queries placed inside another SQL query. In this project, they are used to retrieve books associated with members who meet a membership-date condition, identify the most frequently borrowed book, and check member transaction records.

### 10. Date and Time Functions

The project demonstrates `YEAR()`, `DATEDIFF()`, `DATE_FORMAT()`, `CURDATE()`, and `DATE_SUB()` for working with dates and date-based conditions.

### 11. String Functions

The project uses `UPPER()` to convert titles to uppercase, `TRIM()` to remove extra surrounding spaces, and `COALESCE()` with `NULLIF()` to handle blank or missing email values in query output.

### 12. Window Functions

The project demonstrates `RANK()` and `COUNT() OVER()` to rank books by borrowing count and calculate cumulative borrowing counts for members.

### 13. CASE Expressions

The `CASE` expression classifies records according to conditions. The project uses it to label membership activity and categorize books as `New Arrival`, `Classic`, or `Regular` based on publication dates.

## 🚀 How to Run the Project

1. Install or open a MySQL environment, such as MySQL Workbench.
2. Open the provided `Final_exam.sql` file.
3. Read through the script and execute the statements in order, starting with Step 1.
4. Make sure the database and tables are created before running statements that insert or query data.
5. Review the query results after each section.
6. Run the final table-inspection statements to view the stored records.

**Note:** The script uses window functions such as `RANK() OVER()` and `COUNT() OVER()`. Use a MySQL version that supports window functions. Execute the script in order because later statements depend on the tables and records created earlier.

## 📁 Project Folder Structure

```text
Library-Management-System/
│
├── Final_exam.sql
│   └── SQL commands for the project
│
└── README.md
    └── Project introduction and documentation
```

## 💡 What I Learned

Through this project, I practised how to:

- Design a relational database with multiple connected tables.
- Create tables and define keys.
- Insert, retrieve, update, and delete records.
- Write queries with conditions and logical operators.
- Group and summarize data.
- Combine information using joins and subqueries.
- Work with dates and strings.
- Use window functions to analyse records.
- Apply conditional logic through `CASE` expressions.
- Organize SQL work into a documented project.

## 🔮 Possible Future Enhancements

The current project demonstrates database creation and SQL querying. If developed further, it could be extended with features such as:

- A user interface for librarians and members.
- Search by book title, author, category, or ISBN.
- Reports for borrowed books, overdue returns, and fines.
- Additional validation rules for data quality.
- Automated updates to available copies when books are borrowed or returned.
- User roles and access permissions.

These are **future ideas**, not features claimed to be implemented in the current SQL script.

## 🙏 Acknowledgement

I would like to express my sincere thanks to **Girish Sir** for guidance and support during this project. Working on the Library Management System gave me an opportunity to practise SQL concepts and understand how relational databases organize connected information.

I am also grateful for the opportunity to apply classroom learning through a practical database project.

---

<div align="center">

## 💙 Created with Learning, Logic & SQL

**Project by Sumit Kaswala**  
**Guided by Girish Sir**

*Every query is a step toward better problem-solving.*

📚 `Learn` &nbsp; • &nbsp; 🧠 `Practise` &nbsp; • &nbsp; 💻 `Build`

</div>
ding README (10).md…]()
