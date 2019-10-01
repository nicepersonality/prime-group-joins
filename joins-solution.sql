-- Tasks

--  1. Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "address_type", "street", "city", "state", "zip" FROM "addresses"
JOIN "customers" ON "customers".id = "addresses".customer_id
ORDER BY "customers".last_name;

--  2. Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, "orders".order_date, "quantity", "products".description FROM "line_items"
JOIN "orders" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id
ORDER BY "orders".order_date, "orders".id;

--  3. Which warehouses have cheetos?
SELECT "warehouse".warehouse, "products".description, "on_hand" FROM "warehouse_product"
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos' AND "on_hand" > 0;

--  4. Which warehouses have diet pepsi?
SELECT "warehouse".warehouse, "products".description, "on_hand" FROM "warehouse_product"
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi' AND "on_hand" > 0;

--  5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
--  6. How many customers do we have?
--  7. How many products do we carry?
--  8. What is the total available on-hand quantity of diet pepsi?

-- Stretch

--  9. How much was the total cost for each order?
-- 10. How much has each customer spent in total?
-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).