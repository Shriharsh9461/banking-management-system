create database banks;
use banks;

create table customers(
customer_id int primary key,
customer_name varchar(20),
phone_no bigint,
city varchar(15),
account_type varchar(10),
account_no int
);

insert into customers values
(1,'Rahul Sharma',9876543210,'Pune','Savings',1001),
(2,'Sneha Patil',9988776655,'Mumbai','Current',1002),
(3,'Aman Verma',7845842215,'Nagpur','Savings',1003),
(4,'Priya Singh',9015785958,'Delhi','Current',1004),
(5,'Karan Mehta',9871203456,'Hyderabad','Savings',1005),
(6,'Neha Joshi',9988001122,'Pune','Current',1006),
(7,'Rohit Kumar',9765432109,'Bangalore','Savings',1007),
(8,'Pooja Sharma',9876540001,'Chennai','Savings',1008),
(9,'Vivek Shah',9001122334,'Ahmedabad','Current',1009),
(10,'Anjali Verma',9988771100,'Jaipur','Savings',1010);

select * from customers;

create table accounts(
account_id int primary key,
customer_id int,
balance decimal(10,2),
open_date date,

foreign key (customer_id) references customers (customer_id)
);

insert into accounts values
(1001,1,55000,'2025-01-10'),
(1002,2,120000,'2024-11-20'),
(1003,3,35000,'2025-03-15'),
(1004,4,98000,'2025-02-01'),
(1005,5,75000,'2025-01-25'),
(1006,6,150000,'2024-12-18'),
(1007,7,42000,'2025-04-10'),
(1008,8,88000,'2025-05-05'),
(1009,9,200000,'2024-09-30'),
(1010,10,67000,'2025-03-22');

select * from customers;
select * from accounts;

create table transactions(
transaction_id int primary key,
account_id int,
transaction_type varchar(15),
amount decimal(10,2),
transaction_date date,

foreign key (account_id) references accounts(account_id)
);

insert into transactions values 
(1,1001,'Deposit',10000,'2026-06-01'),
(2,1001,'Withdraw',5000,'2026-06-02'),
(3,1002,'Deposit',25000,'2026-06-02'),
(4,1003,'Withdraw',3000,'2026-06-03'),
(5,1004,'Deposit',15000,'2026-06-04'),
(6,1005,'Deposit',12000,'2026-06-05'),
(7,1006,'Withdraw',7000,'2026-06-05'),
(8,1007,'Deposit',9000,'2026-06-06'),
(9,1008,'Withdraw',4500,'2026-06-06'),
(10,1009,'Deposit',30000,'2026-06-07'),
(11,1010,'Withdraw',2000,'2026-06-07'),
(12,1002,'Withdraw',10000,'2026-06-08'),
(13,1003,'Deposit',5000,'2026-06-08'),
(14,1005,'Withdraw',3500,'2026-06-09'),
(15,1007,'Deposit',15000,'2026-06-09');

create table loans (
loan_id int primary key,
customer_id int,
loan_amount decimal(10,2),
loan_type varchar(15),

foreign key (customer_id) references customers (customer_id)
);
 
insert into loans values
(1,1,500000,'Home Loan'),
(2,2,200000,'Car Loan'),
(3,4,100000,'Education Loan'),
(4,5,300000,'Business Loan'),
(5,6,150000,'Personal Loan'),
(6,8,250000,'Home Loan'),
(7,9,400000,'Business Loan'),
(8,10,180000,'Car Loan');

select * from customers;
select * from accounts;
select * from transactions;
select * from loans;

/* display customer names account balance using inner join*/
select c.customer_name,a.balance
from customers c inner join accounts a
on c.customer_id=a.customer_id;

/* top 3 customers with the highest account balances*/

select c.customer_name,a.balance
from customers c inner join accounts a
on c.customer_id=a.customer_id
order by a.balance asc
limit 3;

/* customers who have taken loans along with loan amount and loan type*/

select c.customer_name,l.loan_amount,l.loan_type
from customers c  right outer join loans l
on c.customer_id=l.customer_id;

/* sum of total deposited amount and total withdrawn amount */

select transaction_type,sum(amount) as total
from transactions
group by transaction_type;

/* display customer-wise total transactions among using GROUP BY */

select c.customer_name,sum(t.amount) as total_transaction
from customers c inner join accounts a
on c.customer_id = a.customer_id
inner join transactions t
on a.account_id = t.account_id
group by c.customer_name;

/* customers whose balances are greater than average bank balance */

select c.customer_name, a.balance
from customers c
inner join accounts a
on c.customer_id = a.customer_id
where a.balance > (
select avg(balance)
from accounts
);

/* Display all customers who have not taken any loans using LEFT JOIN. */

select c.customer_name
from customers c left join loans l 
on c.customer_id = l.customer_id
where l.loan_id is null;

/*  Find the total number of transactions performed by each customer. */

select c.customer_name,sum(t.amount) as total_amount 
from customers c inner join accounts a
on c.customer_id=a.customer_id
inner join transactions t 
on a.account_id=t.account_id
group by c.customer_name;

/* Rank customers based on their account balances using RANK() window function.*/
select c.customer_name,a.balance,rank() over (order by a.balance desc) as balance_rank
from customers c inner join accounts a
on c.customer_id=a.customer_id;

/* Display dense ranking of customers according to balance using DENSE_RANK().*/
select c.customer_name,a.balance,dense_rank() over (order by a.balance desc) as balance_rank
from customers c inner join accounts a
on c.customer_id=a.customer_id;

/* Show previous transaction amount using LAG() function.*/

select amount,lag(amount) over (order by amount asc) as previous_amount
from transactions;

/* Show next transaction amount using LEAD() function.*/

select amount,lead(amount) over (order by amount asc) as next_amount
from transactions;

/* Calculate running total of transaction amounts using SUM() OVER().*/
select* from transactions;

select transaction_id,amount,sum(amount) over (order by transaction_date) as running_total
from transactions; 

/* Find the second highest account balance using subquery or window function.*/

select max(balance) as highest_balance
from accounts
where balance <(
select max(balance)
from accounts
);

/*Find customers who performed more than 2 transactions.*/

select c.customer_name,count(t.transaction_id) as more_transactions
from customers c inner join accounts a 
on c.customer_id=a.customer_id
inner join transactions t 
on a.account_id=t.account_id
group by c.customer_name
having count(t.transaction_id)>2;

/* Display customer-wise minimum and maximum transaction amounts.*/

select c.customer_name,max(t.amount) as maximum_amounts ,min(t.amount) as minimum_amounts
from customers c inner join accounts a
on c.customer_id=a.customer_id
inner join transactions t
on a.account_id=t.account_id
group by c.customer_name;

