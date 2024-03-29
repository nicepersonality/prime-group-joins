# prime-group-joins
In this challenge, we’re going to practice performing SQL queries with multiple tables. This should help better solidify some concepts that were covered during lecture.

# Exercise

For each of the following questions

* Write a comment that specifies which question you are answering. (SQL comments are two dashes, followed by text.)
* Write the SQL query that answers the question, below that comment.
* Once one person writes half of the queries, switch off.

## Example question and answer

```SQL
-- 0. Get all the users
SELECT * FROM customers;
```

## Tasks
1. [X] Get all customers and their addresses.
2. [X] Get all orders and their line items (orders, quantity and product).
3. [X] Which warehouses have cheetos?
4. [X] Which warehouses have diet pepsi?
5. [X] Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
6. [X] How many customers do we have?
7. [X] How many products do we carry?
8. [X] What is the total available on-hand quantity of diet pepsi?

## Stretch
9. [X] How much was the total cost for each order?
10. [X] How much has each customer spent in total?
11. [ ] How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).