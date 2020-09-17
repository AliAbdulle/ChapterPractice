--Provide a way for the accounting team to track all financial transactions by creating a new table called Accounts Receivable. The table should have the following columns: credit_amount, debit_amount, date_received as well as a PK
--and a FK to associate a sale with each transaction.
CREATE TABLE accountreceivable (
	account_id int primary key 	GENERATED ALWAYS AS IDENTITY,
	credit_amount INT,
	debit_amount int,
	date_received DATE,
	sale_id int, FOREIGN KEY (sale_id) REFERENCES Sales (sale_id)
	
);
--1. Set up a trigger on the Sales table. When a new row is added, add a new record to the Accounts Receivable table with the deposit 
--as credit_amount, the timestamp as date_received and the appropriate sale_id.
 
CREATE OR REPLACE FUNCTION add_acc_recieveable()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO accountreceivable (credit_amount, date_received,sale_id)
VALUES (NEW.deposit,CURRENT_DATE, NEW.sale_id);
RETURN null;
END;
$$


CREATE TRIGGER new_sale_made
AFTER INSERT
ON sales
FOR EACH ROW
EXECUTE PROCEDURE add_acc_recieveable();


--2. Set up a trigger on the Sales table for when the sale_returned flag is updated. Add a new row to the Accounts Receivable table with the deposit as debit_amount,
--the timestamp as date_received, etc.

CREATE OR REPLACE FUNCTION update_acc_receivable()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
BEGIN
 	INSERT INTO accountreceivable( debit_amount, date_received, sale_id)
	VALUES (NEW.deposit,CURRENT_DATE, NEW.sale_id);
RETURN null;
END;
$$

CREATE TRIGGER sales_return
AFTER UPDATE
ON sales
FOR EACH ROW
WHEN(OLD.sale_returned IS DISTINCT FROM NEW.sale_returned)
EXECUTE PROCEDURE update_acc_receivable();

INSERT INTO PUBLIC.sales(
	 sales_type_id, vehicle_id, employee_id, customer_id, dealership_id, price, deposit, purchase_date, pickup_date, invoice_number, payment_method, sale_returned)
	VALUES ( 2, 1, 1, 1, 1, 12000, 500, CURRENT_DATE, CURRENT_DATE, 123, 'visa', false);
	
	
UPDATE sales SET sale_returned = true WHERE sale_id = 1

SELECT * FROM accountreceivable;
SELECT * FROM sales ORDER bysale_returned;

--Help out HR fast track turnover by providing the following:

--1. Create a stored procedure with a transaction to handle hiring a new employee. Add a new record for the employee in the Employees table and add a record 
--to the Dealershipemployees table for the two dealerships the new employee will start at.


create procedure new_employee(in emp_fname varchar, in emp_lname varchar,
							  in emp_email varchar,in emp_phone varchar,
							 in emp_type_id int, in dept1_id int, in dept2_id int)
language plpgsql
as $$
declare
new_emp_id int;
begin
INSERT INTO public.employees(
	first_name, last_name, email_address, phone, employee_type_id)
	VALUES ( emp_fname, emp_lname, emp_email, emp_phone, emp_type_id)
	returning employee_id into new_emp_id;
INSERT INTO public.dealershipemployees(
	 employee_id, dealership_id)
	VALUES ( new_emp_id, dept1_id);
	INSERT INTO public.dealershipemployees(
	 employee_id, dealership_id)
	VALUES ( new_emp_id, dept2_id);
end
$$;
-- run procedure
call new_employee('test','test','test','test',1,2,3)
-- check if things added
select * from dealershipemployees order by employee_id desc;









