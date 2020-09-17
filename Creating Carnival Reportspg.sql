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
 
create OR REPLACE function add_acc_recieveable()
returns trigger
language plpgsql
as $$
Begin
insert into accountreceivable (credit_amount, date_received,sale_id)
values (new.deposit,CURRENT_DATE,new.sale_id);
return null;
end;
$$
create trigger new_sale_made
after insert
on sales
for each row
execute procedure add_acc_recieveable();


--2. Set up a trigger on the Sales table for when the sale_returned flag is updated. Add a new row to the Accounts Receivable table with the deposit as debit_amount,
--the timestamp as date_received, etc.

create or replace function update_acc_receivable()
returns trigger
 language plpgsql
 As $$
 BEGIN
 	INSERT INTO accountreceivable( debit_amount, date_received, sale_id)
	values(NEW.deposit,current_date,new.sale_id);
	return null;
END;
$$

create trigger sales_return
after update
on sales
for each row 
when(old.sale_returned is distinct from new.sale_returned)
execute procedure update_acc_receivable();

INSERT INTO public.sales(
	 sales_type_id, vehicle_id, employee_id, customer_id, dealership_id, price, deposit, purchase_date, pickup_date, invoice_number, payment_method, sale_returned)
	VALUES ( 2, 1, 1, 1, 1, 12000, 500, CURRENT_DATE, CURRENT_DATE, 123, 'visa', false);
	
	
update sales set sale_returned = true where sale_id = 1

select * from accountreceivable;
select * from sales order by sale_id;


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
select * from dealershipemployees order by employee_id desc






