# End-to-End SQL Project

## Overview
This project demonstrates an end-to-end   SQL solution for managing an online book store. It includes database creation, data insertion, and various SQL queries to retrieve and analyze data. The project covers customer information, book details, and order records.

## Setup Instructions
1. **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd End-to-End-SQL-project
    ```

2. **Create the database:**
    ```sql
    CREATE DATABASE online_Book_store;
    ```

3. **Use the database:**
    ```sql
    USE online_Book_store;
    ```

4. **Import data from CSV files:**
    ```sql
    -- Import Customers
    COPY customers(Customer_ID, Name, Email, Phone, City, Country)
    FROM 'c:/Users/biswa/Desktop/End-to-End-SQL-project/Customers.csv'
    CSV HEADER;

    -- Import Books
    COPY books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
    FROM 'c:/Users/biswa/Desktop/End-to-End-SQL-project/Books.csv'
    CSV HEADER;

    -- Import Orders
    COPY orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
    FROM 'c:/Users/biswa/Desktop/End-to-End-SQL-project/Orders.csv'
    CSV HEADER;
    ```

## Usage Examples
1. **Retrieve all books of fiction genre:**
    ```sql
    SELECT * FROM books WHERE genre = "fiction";
    ```

2. **Find books published after the year 1950:**
    ```sql
    SELECT * FROM books WHERE Published_Year > 1950;
    ```

3. **Select all customers:**
    ```sql
    SELECT * FROM customers;
    ```

4. **Select customers from Canada:**
    ```sql
    SELECT * FROM customers WHERE Country = "Canada";
    ```

5. **Show orders placed in November 2022:**
    ```sql
    SELECT * FROM orders WHERE Order_Date BETWEEN "11/1/2022" AND "11/30/2022";
    ```

6. **Return total stock of books available:**
    ```sql
    SELECT SUM(stock) AS sum_of_stock FROM books;
    ```

7. **Details of the most expensive book:**
    ```sql
    SELECT * FROM books ORDER BY Price DESC LIMIT 1;
    ```

8. **Show all customers who ordered more than 1 quantity of a book:**
    ```sql
    SELECT * FROM orders WHERE Quantity > 1;
    ```

9. **Retrieve records where Total_Amount exceeds 20:**
    ```sql
    SELECT * FROM orders WHERE Total_Amount > 20;
    ```

10. **List all genres available in books:**
    ```sql
    SELECT DISTINCT genre FROM books;
    ```

11. **Find out the lowest stock available:**
    ```sql
    SELECT Stock FROM books ORDER BY Stock ASC LIMIT 1;
    ```

12. **Calculate total revenue from all orders:**
    ```sql
    SELECT ROUND(SUM(Total_Amount), 2) AS total_revenue FROM orders;
    ```

13. **Retrieve total number of books sold for each genre:**
    ```sql
    SELECT b.Genre AS Genre, SUM(o.Quantity) AS total_num_of_book_sold
    FROM books b
    JOIN orders o ON o.Book_ID = b.Book_ID
    GROUP BY Genre;
    ```

14. **Find the average price of books in the "Fantasy" genre:**
    ```sql
    SELECT AVG(Price) AS avg_price FROM books WHERE Genre = "Fantasy";
    ```

15. **List customers who have placed at least 2 orders:**
    ```sql
    SELECT c.Customer_ID, c.Name, COUNT(o.Customer_ID) AS total_order
    FROM customers c
    JOIN orders o ON o.Customer_ID = c.Customer_ID
    GROUP BY c.Customer_ID, c.Name
    HAVING total_order >= 2;
    ```

16. **Find the most frequently ordered book:**
    ```sql
    SELECT b.Book_ID, COUNT(b.Book_ID) AS num_of_book_ordered
    FROM books b
    JOIN orders ON orders.Book_ID = b.Book_ID
    GROUP BY b.Book_ID
    ORDER BY num_of_book_ordered DESC
    LIMIT 1;
    ```

17. **Show the top 3 most expensive books of "Fantasy" genre:**
    ```sql
    SELECT b.Title, b.Price
    FROM books b
    WHERE Genre = "Fantasy"
    ORDER BY Price DESC
    LIMIT 3;
    ```
