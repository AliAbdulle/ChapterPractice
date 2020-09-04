--Practice: Carnival
--Get a list of the sales that was made for each sales type.
SELECT *, st.name
FROM sales s
INNER JOIN salestypes st ON st.sales_type_id = s.sales_type_id;

--Get a list of sales with the VIN of the vehicle, the first name and last name of the customer, 
--first name and last name of the employee who made the sale and the name, city and state of the 
--dealership.
SELECT 
	v.vin,
	c.first_name as Customer_First_Name, 
	c.last_name as Customer_Last_Name,
	e.first_name as Employees_First_name,
	e.last_name as Employees_Last_name,
	d.business_name,
	d.city,
	d.state

FROM sales s
JOIN vehicles v ON s.vehicle_id = s.vehicle_id
JOIN customers c ON s.customer_id = c.customer_id
JOIN employees e ON S.employee_id = e.employee_id
join dealerships d on s.dealership_id = d.dealership_id


--Get a list of all the dealerships and the employees, if any, working at each one.

SELECT d.business_name, CONCAT(e.first_name, ' ' ,e.last_name) AS Employees_name
FROM dealershipemployees de
RIGHT JOIN dealerships d ON d.dealership_id = de.dealership_id
LEFT JOIN employees e ON e.employee_id = de.employee_id;


--Get a list of vehicles with the names of the body type, make, model and color.
SELECT v.vin, bt.name, vmk.name, vmd.name
FROM vehicles v
JOIN vehicletypes vt ON vt.vehicle_type_id = v.vehicle_type_id
JOIN vehiclebodytypes bt ON vt.body_type_id = bt.vehicle_body_type_id
JOIN vehiclemakes vmk ON vt.make_id = vmk.vehicle_make_id
JOIN vehiclemodels vmd ON vt.model_id = vmd.vehicle_model_id;


