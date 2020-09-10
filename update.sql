--Update Operations
--Practice: Employees

--Rheta Raymen an employee of Carnival has asked to be transferred to a different dealership location. 
--She is currently at dealership 751. She would like to work at dealership 20. Update her record to reflect her transfer.

UPDATE public.dealershipEmployees
SET dealership_id = 20
WHERE dealership_employee_id = 10;

SELECT * FROM dealershipemployees;


--Practice: Sales
--A Sales associate needs to update a sales record because her customer want so pay wish Mastercard instead of American 
--Express. Update Customer, Layla Igglesden Sales record which has an invoice number of 2781047589.

UPDATE public.sales
SET payment_method = 'Mastercard'
WHERE customer_id = 13;

select * from customers
where first_name = 'Layla' and last_name = 'Igglesden';

select * from sales
where customer_id = 13;


________________________________________________________________________________________________________________________________
--Deleting Data
--A sales employee at carnival creates a new sales record for a sale they are trying to close. The customer, last minute
--decided not to purchase the vehicle. Help delete the Sales record with an invoice number of '7628231837'.
DELETE FROM sales
WHERE invoice_number = '7628231837';

SELECT * FROM SALES
WHERE invoice_number = '7628231837';

--An employee was recently fired so we must delete them from our database. Delete the employee with employee_id of 35.
--What problems might you run into when deleting? How would you recommend fixing it?
DELETE FROM sales s
WHERE s.sale_id = 35;

DELETE FROM employees 
WHERE employee_id = 35;

SELECT * FROM employees
WHERE employee_id = 35;

SELECT * FROM sales
WHERE employee_id = 35;
 ROLLBACK;






