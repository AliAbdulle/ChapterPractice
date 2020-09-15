--Carnival Sales
--Purchase Income by Dealership
--Write a query that shows the total purchase sales income per dealership.

select * from sales;

SELECT d.business_name, sum(s.price)
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
GROUP BY d.dealership_id;