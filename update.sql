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





