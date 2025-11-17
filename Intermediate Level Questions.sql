-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    SUM(orders_details.quantity) AS Total_Quantity,
    pizza_types.category
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY Total_Quantity DESC;



-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(order_time) AS Hour, COUNT(order_id) AS Orders
FROM
    orders
GROUP BY Hour
ORDER BY Hour ASC;



-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    category, COUNT(category) AS Count
FROM
    pizza_types
GROUP BY category;



-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    round(avg(Quantity),1)
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS Quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) as Order_Quantity;
    
    
    
    
-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_types.name,
    SUM(pizzas.price * orders_details.quantity) AS Sales
FROM
    pizzas
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.name
ORDER BY Sales DESC
LIMIT 3;



