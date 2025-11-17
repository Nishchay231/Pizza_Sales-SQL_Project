-- Advanced:
-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.category,
    ROUND(SUM(orders_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(orders_details.quantity * pizzas.price),
                                2)
                FROM
                    orders_details
                        JOIN
                    pizzas ON orders_details.pizza_id = pizzas.pizza_id) * 100,
            2) AS Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category;



-- Analyze the cumulative revenue generated over time.
select order_date,
 sum(Revenue) over(order by order_date) as cum_revenue 
from
(select orders.order_date,sum(orders_details.quantity * pizzas.price) as Revenue 
	from orders join orders_details on orders.order_id=orders_details.order_id
    join pizzas on pizzas.pizza_id=orders_details.pizza_id 
    group by orders.order_date) 
as etc;



-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name, revenue, category from
(select category,name,revenue,rank() over(partition by category order by revenue desc) as RN
 from (select pizza_types.category,pizza_types.name,sum(orders_details.quantity * pizzas.price) as revenue 
		from pizza_types join pizzas on pizza_types.pizza_type_id=pizzas.pizza_type_id 
		join orders_details on orders_details.pizza_id=pizzas.pizza_id group by pizza_types.category,pizza_types.name)
        as a)
	as b
    where RN<=3;