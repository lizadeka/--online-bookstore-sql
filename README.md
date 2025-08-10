# online-bookstore-sql
An end-to-end SQL project analyzing data from an online bookstore.
This project uses 3 relational tables — Customers, Books, and Orders — to extract actionable business insights through SQL queries.
🗂️ Dataset Structure
Books
Column	Description
Book_ID	Unique identifier for each book
Title	Book title
Author	Author name
Genre	Book genre/category
Published_Year	Year of publication
Stock	Available stock quantity
Price	Price of the book
Customers
Column	Description
Customer_ID	Unique identifier for each customer
Name	Full name of the customer
Email	Customer email
Phone	Customer phone number
City	Customer city
Country	Customer country
Orders
Column	Description
Order_ID	Unique identifier for each order
Customer_ID	ID of the customer placing the order
Book_ID	ID of the purchased book
Order_Date	Date the order was placed
Quantity	Number of books ordered
Total_Amount	Total cost for the order
