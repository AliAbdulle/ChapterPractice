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
--OR

SELECT 
	d.business_name,
	count(s.sale_id) as number_of_sales 
FROM dealerships d
JOIN sales s ON s.dealership_id = s.dealership_id 
JOIN salestypes st ON s.sales_type_id = st.sales_type_id
WHERE st.sales_type_id = 2
GROUP BY d.dealership_id
ORDER BY  d.dealership_id;

-----Practice: Leased Types
--Produce a report that determines the most popular vehicle model that is leased.
SELECT 
	vm.name,
	count(s.sale_id) as lease_count
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_id = vt.vehicle_type_id
JOIN vehiclemodels  vm ON vt.vehicle_type_id = vm.vehicle_model_id
WHERE s.sales_type_id = 2
GROUP BY vm.vehicle_model_id
ORDER BY count(s.sale_id) DESC;


--Who Sold What
--What is the most popular vehicle make in terms of number of sales?

SELECT 
	vmk.name,
	count(s.sale_id) as lease_count
FROM sales s
JOIN salestypes st ON st.sales_type_id = st.sales_type_id 
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_id = vt.vehicle_type_id
JOIN vehiclemakes  vmk ON vt.make_id = vmk.vehicle_make_id
GROUP BY vmk.vehicle_make_id
ORDER BY count(s.sale_id) DESC;


--Which employee type sold the most of that make?
SELECT 
	et.name,
	count(s.employee_id) as lease_count
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_id = vt.vehicle_type_id
JOIN vehiclemakes  vmk ON vt.make_id = vmk.vehicle_make_id
JOIN employees e ON s.employee_id = e.employee_id
JOIN employeetypes et ON et.employee_type_id = e.employee_type_id

WHERE vmk.vehicle_make_id = (
	SELECT 
		vmk.vehicle_make_id
	FROM
	sales s
	JOIN vehicles v ON s.vehicle_id = v.vehicle_id
	JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
	JOIN vehiclemakes  vmk ON vt.make_id = vmk.vehicle_make_id
	
GROUP BY vmk.vehicle_make_id
ORDER BY count(s.sale_id) DESC
	limit 1
	)
GROUP BY et.employee_type_id
ORDER BY count(s.employee_id) DESC;

	
