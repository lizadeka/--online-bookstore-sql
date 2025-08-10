-- 1) Retrieve all books in the "Fiction" genre:
select * from books
where genre = 'Fiction';


-- 2) Find books published after the year 1950:
select * from books
where Published_Year>1950;

-- 3) List all customers from the Canada:
select * from customers
where Country="Canada";

-- 4) Show orders placed in November 2023:
select * from orders
where Order_Date between "2023-11-01" and "2023-11-30";

-- 5) Retrieve the total stock of books available:
select sum(stock) as total_books
from books;

-- 6) Find the details of the most expensive book:
select * from books
order by price desc
limit 1
;

-- 7) Show all customers who ordered more than 1 quantity of a book:
-- select c.Customer_ID, count(o.Order_ID) as total_books_ordered
-- from customers c
-- join orders o on o.Customer_ID = c.Customer_ID
-- group by c.Customer_ID
-- having count(o.Order_ID) > 1
-- ;
select * from orders
where Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where Total_Amount > 20;

-- 9) List all genres available in the Books table:
select distinct Genre from books;

-- 10) Find the book with the lowest stock:
select *
from books
order by stock
limit 1;

-- 11) Calculate the total revenue generated from all orders:
select sum(b.price * o.quantity) as total_revenue
from books b
join orders o on o.Book_ID = b.Book_ID
;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
-- by order_id
select distinct Genre, count(*) as books_sold
from books
group by Genre;

-- by quantity
select distinct Genre, sum(o.quantity) as books_sold
from books b
join orders o on o.Book_ID = b.Book_ID
group by Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
select Genre, round(avg(price),2) as avg_price
from books
where genre = "Fantasy";

-- 3) List customers who have placed at least 2 orders:
select c.customer_id, 
	c.name, c.Email,
	count(o.order_id) as total_orders
from orders o
join customers c on c.Customer_ID = o.Customer_ID
group by Customer_ID
having count(order_id) >= 2
;

-- 4) Find the most frequently ordered book:
select b.Book_ID, b.Title,
		count(o.Order_ID) as times_ordered
from books b 
join orders o on o.Book_ID = b.Book_ID
group by b.Book_ID
order by count(o.Order_ID) desc
limit 1
;
-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select b.Book_ID, b.Title, 
		b.Genre,
		price
from books b 
join orders o on o.Book_ID = b.Book_ID
where genre="Fantasy"
group by b.Book_ID
order by Price desc
limit 3
;

-- 6) Retrieve the total quantity of books sold by each author:
select b.Author, sum(o.Quantity) as books_sold
from books b
join orders o on o.Book_ID = b.Book_ID
group by b.Author
;

-- 7) List the cities where customers who spent over $30 are located:
select
		distinct c.City,
        o.Total_Amount as total_spent
from customers c
join orders o on o.Customer_ID = c.Customer_ID
-- group by c.City
having o.Total_Amount > 30
;

-- 8) Find the customer who spent the most on orders:
select c.Customer_ID, 
	c.name, c.Email,
	sum(o.Total_Amount) as total_spent
from orders o
join customers c on c.Customer_ID = o.Customer_ID
group by c.Customer_ID
order by sum(o.Total_Amount) desc
limit 1
;

-- 9) Calculate the stock remaining after fulfilling all orders:
select b.Book_ID,
		b.Stock, coalesce(sum(o.quantity),2) as ordered,
        b.Stock- coalesce(sum(o.quantity),0) AS remaining
from books b
join orders o on o.Book_ID = b.Book_ID
group by b.Book_ID
;
