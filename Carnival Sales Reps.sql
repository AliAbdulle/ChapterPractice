--Carnival Sales Reps
--Employee Reports

--1. How many emloyees are there for each role?
SELECT
	et.name,
	COUNT(e.employee_id)
FROM employeetypes et
JOIN employees e ON et.employee_type_id = e.employee_type_id
GROUP BY et.employee_type_id;

--2. How many finance managers work at each dealership?
SELECT
	et.name,
	COUNT(e.employee_id)
FROM employeetypes et
JOIN employees e ON et.employee_type_id = e.employee_type_id
JOIN dealershipemployees de ON de.employee_id = e.employee_id
JOIN dealerships d ON de.dealership_id = d.dealership_id
WHERE LOWER(et.name) LIKE '%finance%'
GROUP BY et.employee_type_id;

--3. Get the names of the top 3 employees who work shifts at the most dealerships?

SELECT
	e.first_name,
	e.last_name,
	COUNT(d.dealership_id)
FROM employees e
JOIN dealershipemployees de ON de.employee_id = e.employee_id
JOIN dealerships d ON de.dealership_id = d.dealership_id
GROUP BY e.employee_id
ORDER BY COUNT(d.dealership_id) desc
LIMIT 3;


--Get a report on the top two employees who has made the most sales through leasing vehicles.

SELECT
	e.first_name,
	e.last_name,
	COUNT(s.sale_id)
FROM employees e
JOIN sales s ON s.employee_id = e.employee_id
join salestypes st ON s.sales_type_id = st.sales_type_id
WHERE LOWER(st.name) LIKE '%lease'
GROUP BY e.employee_id
ORDER BY COUNT(s.sale_id)
LIMIT 2;
