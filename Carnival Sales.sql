--Carnival Sales
--Purchase Income by Dealership
--Write a query that shows the total purchase sales income per dealership.

select * from sales;

SELECT d.business_name, sum(s.price)
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
GROUP BY d.dealership_id;

--Write a query that shows the purchase sales income per dealership for the current month.

SELECT d.business_name, sum(s.price)
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
WHERE date_part('month', s.purchase_date) = date_part('month', CURRENT_DATE)
GROUP BY d.dealership_id;