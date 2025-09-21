select * from books;
select * from customers;
select * from orders;

-- 1) retrieve all bookes in the "fiction" genre:

select * from books
where genre='Fiction';

--2) find books published after the year 1950:

select * from books
where published_year > 1950

--3 list all customers from the canada;

select * from customers
where country='Canada';

--4) show orders placed in november 2023:

select * from orders
where order_date between '2023-11-01' AND '2023-11-30';

--5) retrive the total stock of books available:

select sum (stock) as total_stock
from books;

--6) find the details of the most expensive books:

select * from books
order by price desc 
Limit 5;

--7) Show all customers who ordered more than 1 quantity of a books:

select * from orders
where quantity >1;

--8) retrive all ordeer where the total amount exceeds $20:

select * from orders
where total_amount>20;

--9) List all geners available in the books table:

select distinct genre from books;

--)10 find the books with the lowest stock:

select * from books
order by stock desc

--11) calculate the total revenue generated from all orders:

select sum(total_amount) as revenue 
from orders;

-- advance question:

--1) retriev the total number of books sold for each gener:

select * from orders;

select b.Genre,SUM (o.quantity) as total_book_sold 
from orders o
join books b on o.book_id = b.book_id
group by b.Genre;


--2) find the average price of book in the "fantacy " genre:

select avg(price) as Average_price
from books
where genre = 'Fantasy' ;

--3) List customer who have placed at least 2 orders:

Select customer_id, count(order_id) as order_count
from orders
group by customer_id
having count(order_id) >=2;


--4) find the most frequently orderd book:

select book_id, count(order_id) as order_count
from orders
group by book_id
order by order_count desc;

--5) show the top 3 most ecpensive bookks of 'fanctasy ' genre:
select * from books
where genre = 'Fantasy'
order by price desc limit 3;


--6) retrieve the total quantity of book sold by each author:

 select b.author, sum(o.quantity) as total_books_sold
 from orders o
 join books b on o.book_id = b.book_id
 group by b.author;


 --7) List the city where customers who spent over $30 are located:

 select Distinct c.city, total_amount
 from orders o
 join customers c on o.customer_id = c.customer_id
 where o.total_amount >=30;


--8) find the customer who spent the most on order:

select c.customer_id, c.name, sum(o.total_amount) as total_spent
from orders o
join customers c on o.customer_id = c.customer_id
group by c.customer_id, c.name
order by Total_spent desc;









