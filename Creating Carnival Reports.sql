--Carnival would like to harness the full power of reporting. Let's begin to look further at querying the data in our tables.
--Carnival would like to understand more about thier business and needs you to help them build some reports.

--Goal
--Below are some desired reports that Carnival would like to see. Use your query knowledge to find the following metrics.

--Employee Reports
--Best Sellers

--1. Who are the top 5 employees for generating sales income?
SELECT e.first_name, e.last_name, SUM(s.price)
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY e.first_name, e.last_name
ORDER BY SUM(s.price)
LIMIT 5;


--2. Who are the top 5 dealership for generating sales income?
SELECT d.business_name, SUM(s.price)
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
GROUP BY d.business_name
ORDER BY SUM(s.price) desc
LIMIT 5;


---3. Which vehicle model generated the most sales income?
SELECT vm.name, SUM(s.price)
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels vm ON vt.model_id = vm.vehicle_model_id
GROUP BY vm.name
ORDER BY SUM(s.price) desc
LIMIT 1;