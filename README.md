# 🏦 Banking Management System

A SQL-based Banking Management System developed to demonstrate database design, customer management, account operations, transaction tracking, loan processing, and advanced SQL analytics.

This project showcases practical implementation of SQL concepts including joins, aggregate functions, subqueries, and window functions within a real-world banking environment.

---

## 📖 Project Overview

The Banking Management System is designed to manage and analyze banking data efficiently. It maintains records of customers, accounts, transactions, and loans while providing meaningful insights through SQL queries.

The project focuses on:

* Database Design
* Relational Data Management
* Customer & Account Management
* Transaction Analysis
* Loan Management
* Advanced SQL Querying

---

## 🎯 Objectives

* Design a normalized relational database.
* Manage customer and account information.
* Track banking transactions.
* Handle loan-related operations.
* Generate analytical reports using SQL.
* Implement advanced SQL functions for data analysis.

---

## 🗄️ Database Entities

### Customers

Stores customer details such as:

* Customer ID
* Customer Name
* Phone Number
* City
* Account Type

### Accounts

Stores account-related information:

* Account ID
* Customer ID
* Account Balance
* Account Opening Date

### Transactions

Maintains transaction history:

* Transaction ID
* Account ID
* Transaction Type
* Transaction Amount
* Transaction Date

### Loans

Stores loan information:

* Loan ID
* Customer ID
* Loan Amount
* Loan Type

---

## 🔗 Relationships

* One Customer can have one or more Accounts.
* One Account can have multiple Transactions.
* One Customer can have multiple Loans.
* Primary and Foreign Keys are used to maintain referential integrity.

---

## 🚀 SQL Features Demonstrated

### Joins

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN

### Aggregate Functions

* SUM()
* AVG()
* COUNT()
* MIN()
* MAX()

### Grouping Operations

* GROUP BY
* HAVING

### Subqueries

### Window Functions

* RANK()
* DENSE_RANK()
* LAG()
* LEAD()
* SUM() OVER()

---

## 📊 Queries Implemented

### Customer & Account Analysis

* Display customer names and account balances.
* Find customers with balances greater than average.
* Retrieve top account holders.

### Loan Analysis

* Display customers who have taken loans.
* Identify customers without loans.

### Transaction Analysis

* Calculate total deposits and withdrawals.
* Customer-wise transaction summaries.
* Count total transactions per customer.
* Find minimum and maximum transaction values.

### Advanced Analytics

* Customer ranking based on account balance.
* Dense ranking of customers.
* Previous and next transaction analysis using window functions.
* Running transaction totals.
* Second highest account balance retrieval.

---

## 🛠️ Technologies Used

* MySQL
* SQL
* MySQL Workbench
* Database Management System (DBMS)

---

## 📚 Learning Outcomes

Through this project, I gained practical experience in:

* Relational Database Design
* ER Modeling
* SQL Query Optimization
* Database Relationships
* Data Aggregation Techniques
* Analytical SQL Functions
* Real-World Banking Data Analysis

---

## 👨‍💻 Author

**Shriharsh Shinde**

Diploma in Artificial Intelligence & Machine Learning

---

## 🙏 Acknowledgements

Special thanks to **Skillected India Pvt. Ltd.** for providing industry-oriented learning opportunities and practical exposure.

Heartfelt gratitude to **Mr. Mangesh N. Sambare Sir** for his valuable guidance, mentorship, and continuous support throughout this project.

---

## 📬 Connect With Me

**LinkedIn:**
[www.linkedin.com/in/shriharsh-shinde-3b0530328](http://www.linkedin.com/in/shriharsh-shinde-3b0530328)

**Email:**
[shriharshshinde8@gmail.com](mailto:shriharshshinde8@gmail.com)

---

⭐ If you found this project useful, consider giving it a Star on GitHub!
