--Practice: Carnival
--Get a list of sales records where the sale was a lease.
SELECT *, sales_type_id
FROM sales
WHERE sales_type_id = 2;

--Get a list of sales where the purchase date is within the last two years.
SELECT *
FROM sales
WHERE purchase_date >= CURRENT_DATE - '2 Years':: interval

--Get a list of sales where the deposit was above 5000 or the customer payed with American Express.
SELECT *
FROM sales
WHERE deposit > 500 AND payment_method = 'americanexpress';
--Get a list of employees whose first names start with "M" or ends with "E".
SELECT *
FROM employeeS e
WHERE e.first_name LIKE '%M' OR E.first_name LIKE '%e';

--Get a list of employees whose phone numbers have the 600 area code.
SELECT *
FROM employees e
WHERE e.phone LIKE '600%';




