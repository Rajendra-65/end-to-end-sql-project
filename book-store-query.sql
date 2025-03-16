create database online_Book_store;

-- copy customers(Customer_id, Name, Email , Phone , City , Country)
-- from "File-source"
-- CSV HEADER;

use online_Book_store;

-- Retrive all books of fiction genre

select *
from books
where genre = "fiction";

-- Find books after the year 1950

SELECT *
FROM books
WHERE Published_year > 1950;

select * from customers;

-- select customer from canada

SELECT * 
FROM customers
where Country = "Canada";

SELECT * FROM orders;

-- show order place in nov 2022

SELECT  *
FROM orders
where Order_Date between "11/1/2022" and "11/30/2022";

-- Return total stock of books available

SELECT SUM(stock) as sum_of_stock
from books;

-- Details of most exp book

SELECT *
FROM books
order by Price desc
limit 1;

-- show all customer who ordered more than 1 quantity of book

SELECT *
FROM orders
WHERE Quantity > 1;

-- Retrive record where Total_Amount exceed 20

SELECT * 
fROM orders
where Total_Amount > 20;

-- list all genre available ib books

SELECT distinct genre
FROM books;

-- Findout the lowest stock available

SELECT
	Stock
FROM
	books
ORDER BY Stock ASC
LIMIT 1;

-- calculate total rev from all orders

SELECT
	round(SUM(Total_Amount),2) as total_revenue
FROM
	orders;
    
-- Retrive total number of books sold for each genre

SELECT
	b.Genre as Genre,
    SUM(o.Quantity) total_num_of_book_sold
FROM
	books b
JOIN
	orders o on o.Order_ID = b.Book_ID
GROUP BY Genre;

-- Find the average price of books in the "Fantasy" genre.

SELECT
	AVG(Price) as avg_price
FROM
	books
WHERE Genre = "Fantasy";

-- List customer who have placed at least 2 orders.

SELECT
    c.Customer_ID,
	c.Name,
	count(o.Customer_ID) as total_order
FROM
	customers c
JOIN
	orders o on o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID,c.Name
having total_order >= 2;

-- Find the most frequently orderd book

SELECT
	b.Book_ID,
	count(b.Book_ID) as num_of_book_ordered
FROM
	books b
JOIN
	orders on orders.Book_ID = b.Book_ID
GROUP BY b.Book_ID
ORDER BY num_of_book_ordered desc
limit 1;

-- show the top 3 most expensive books of "Fantasy " Genre

SELECT
	b.Title,
    b.Price
FROM
	books b
ORDER BY Price DESC;

-- Retrive the total quantity of book sold by each author

SELECT
	b.Author,
	SUM(o.Quantity) as total_sold
FROM
	orders o
JOIN 
	books b on b.Book_ID = o.Book_ID
GROUP BY b.Author
ORDER BY total_sold desc;

-- LISt the cities where customes spent overer 30 are located

SELECT 
	distinct c.City,
    SUM(o.Total_Amount) as total_amount
FROM
	customers c
JOIN  orders o on o.Customer_ID = c.Customer_ID
GROUP BY c.City
HAVING total_amount > 30;

-- Find the customer who spend the most on orders

SELECT
	c.Customer_ID,
	c.Name,
    SUM(o.Total_Amount) as total_amount
FROM
	customers c
JOIN orders o on o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID,c.Name
ORDER BY total_amount DESC
LIMIT 1;

-- calculate the stock remaining after all orders.

SELECT
    b.Book_ID,
    b.Title,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS remaining_Qty
FROM books b
LEFT JOIN orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock;

