--Complex Joins
---Practice: Sales Type by Dealership
--Produce a report that lists every dealership, the number of purchases done by each, and the number of leases done by each.

SELECT 
	d.business_name,
	count(s.sale_id) as number_of_sales 
FROM dealerships d
JOIN sales s ON s.dealership_id = s.dealership_id 
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
WHERE st.sales_type_id = 1
GROUP BY d.dealership_id
ORDER BY  d.dealership_id;
 
