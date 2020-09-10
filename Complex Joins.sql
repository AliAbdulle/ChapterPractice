--Complex Joins
---Practice: Sales Type by Dealership
--Produce a report that lists every dealership, the number of purchases done by each, and the number of leases done by each.

SELECT DISTINCT(d.business_name), s.invoice_number, st.name
FROM dealerships d
join sales s ON s.sale_id = s.dealership_id 
JOIN salestypes st ON st.sales_type_id = s.sale_id;
 
