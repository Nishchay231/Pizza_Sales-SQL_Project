-- Basic Questions
-- Retrieve the total number of orders placed.
select * from orders;
select count(order_id) as Total_Quantity from orders;



-- Calculate the total revenue generated from pizza sales.
select * from orders_details;
select * from pizzas;
SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),2)AS Total_Sales
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id;



-- Identify the highest-priced pizza.
-- select max(price) as Max from pizzas;
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizzas
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
ORDER BY pizzas.price DESC limit 1;



-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    SUM(orders_details.quantity) AS order_quantity,
    COUNT(orders_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;



-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name,
    SUM(orders_details.quantity) AS Quantity_Ordered
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.name
ORDER BY Quantity_Ordered DESC limit 5;

