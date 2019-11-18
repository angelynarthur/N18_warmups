-- Return to Window Functions!
-- BASIC SYNTAX
-- SELECT <aggregator> OVER(PARTITION BY <col1> ORDER BY <col2>)
-- PARTITION BY (like GROUP BY) a column to do the aggregation within particular category in <col1>
-- Choose what order to apply the aggregator over (if it's a type of RANK)
-- Example SELECT SUM(sales) OVER(PARTITION BY department)
-- Feel free to google RANK examples too.



-- Return a list of all customers, RANKED in order from highest to lowest total spendings
-- WITHIN the country they live in.
-- HINT: find a way to join the order_details, products, and customers tables


SELECT customers.customer_id, customers.country, sum(order_details.unit_price * order_details.quantity) over (partition by order_details) as total_spending, rank () over (order by country) 
FROM customers inner join orders on customers.customer_id = orders.customer_id 
inner join order_details on order_details.order_id = orders.order_id inner join products on products.product_id = order_details.product_id;

-- Return the same list as before, but with only the top 3 customers in each country.





