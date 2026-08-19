# Pizza-Sales---SQL-Project
This project is a comprehensive Data Analysis for a real-world pizza restaurant chain. I utilised MySQL to analyse sales, orders, and pricing data to derive actionable insights that can optimise operations, inventory, and marketing strategies

## 💡 Key Business Insights Discovered
Based on the SQL queries executed, the following operational KPIs were extracted:
1. **Total Sales Volume**: Successfully processed and analyzed **21,350** unique orders.
2. **Revenue Generation**: The total annual revenue generated from pizza sales amounted to **$817,860.05**.
3. **Peak Operating Hours**: The highest volume of orders occurs between **12:00 PM and 1:00 PM**, indicating a strong lunch rush. Staffing should be optimized during this hour.
4. **Top Performing Categories**: The **Classic** and **Supreme** pizza categories are the primary revenue drivers, accounting for **52.36%** of total sales combined (Classic alone drives 26.91%). This directly informs inventory forecasting for high-demand ingredients.


## 🔑 SQL Concepts Demonstrated**
- **Data Joins:** Used `LEFT JOIN` and `INNER JOIN` to connect `orders`, `order_details`, and `pizzas` tables to calculate metrics requiring cross-table data (e.g., total quantity of each pizza category ordered ).
- **Aggregation:** Extensive use of `GROUP BY`, `SUM()`, `COUNT()`, and `AVG()` for calculating total orders and average pizzas per day.
- **Window Functions:** Implemented `SUM()` `OVER` `(ORDER BY date)` to calculate the *cumulative (running total) revenue* generated over time. 
- **Common Table Expressions (CTEs):** Used *CTEs* to modularise complex queries, such as the *calculation for the percentage contribution of each pizza type to total revenue* and determining the top 3 most ordered pizza types based on revenue for each category  using `RANK()` or `ROW_NUMBER()` partitioned by category.
- **Date/Time Functions:** Utilised functions like `HOUR()` or `EXTRACT(HOUR FROM column)` to determine the distribution of orders by hour of the day.
- **Subqueries:** Employed **nested queries** to filter and aggregate data efficiently before joining or final reporting.

 ## 📊 Key Analytical Questions Answered 
**1. Basic Metrics (Foundational Aggregation)**
  - Retrieved the **Total Number of Orders Placed.**
  - Calculated the **Total Revenue generated from all pizza sales.**
  - Identified the **Highest-Priced Pizza.**
  - Determined the **Most Common Pizza Size ordered, crucial for inventory planning.**
  - Listed the **Top 5 Most Ordered Pizza Types by quantity.**

**2. Intermediate Analysis (Complex Joins & Aggregation)**
  - Calculated the **Total Quantity of Each Pizza Category ordered.**
  - Analyzed the **Distribution of Orders by Hour of the Day, pinpointing peak hours for staffing.**
  - Calculated the **Average Number of Pizzas** Ordered Per Day across the dataset.
  - Identified the **Top 3 Most Ordered Pizza Types** based on Revenue.

**3. Advanced Insights (Analytical & Comparative Functions)**
  - Calculated the **Percentage Contribution of Each Pizza Category to Total Revenue**, a key financial metric.
  - Analyzed the **Cumulative Revenue Generated Over Time** using a window function for trend tracking.
  - Determined the **Top 3 Most Ordered Pizza Types based on Revenue for Each Pizza Category** using partitioned ranking.
