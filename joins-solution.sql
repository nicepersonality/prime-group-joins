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
SELECT "customers".first_name, "customers".last_name, count(*) FROM "orders"
JOIN "addresses" ON "addresses".id = "orders".address_id
JOIN "customers" ON "customers".id = "addresses".customer_id
GROUP BY "customers".last_name, "customers".first_name;

--  6. How many customers do we have?
SELECT count(*) FROM "customers";

--  7. How many products do we carry?
SELECT count(*) FROM "products";

--  8. What is the total available on-hand quantity of diet pepsi?
SELECT "products".description, SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description;

-- Stretch

--  9. How much was the total cost for each order?
SELECT "orders".order_date, "orders".id AS "order id",
       SUM("quantity" * "products".unit_price) AS "total cost"
FROM "line_items"
JOIN "orders" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id
GROUP BY "orders".order_date, "orders".id
ORDER BY "orders".order_date, "orders".id;

-- 10. How much has each customer spent in total?
SELECT CONCAT("customers".first_name, ' ', "customers".last_name) AS "customer",
       SUM("quantity" * "products".unit_price) AS "total spent"
FROM "line_items"
JOIN "orders" ON "orders".id = "line_items".order_id
JOIN "addresses" ON "addresses".id = "orders".address_id
JOIN "customers" ON "customers".id = "addresses".customer_id
JOIN "products" ON "products".id = "line_items".product_id
GROUP BY "customer"
ORDER BY "total spent" DESC;

-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).