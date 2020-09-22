 EXPLAIN ANALYZE SELECT * from Employees WHERE employee_type_id = 1;
 
 CREATE INDEX employee_types ON Employees
(
	employee_type_id
);





EXPLAIN ANALYZE SELECT * from vehicles where year_of_car BETWEEN 2018 AND 2020;

CREATE INDEX vehicles_year_of_car ON vehicles
(
	year_of_car
);