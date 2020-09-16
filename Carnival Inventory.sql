--Carnival Inventory
--In this chapter, you will be writing queries to produce reports about the inventory of vehicles at dealerships on the Carnival platform.

--Available Models
--1. Which model of vehicle has the lowest current inventory? This will help dealerships know which models the purchase from manufacturers.
SELECT COUNT(v.vehicle_type_id) as Total_Inventory,	
			vm.name,
			vm.vehicle_model_id
FROM vehicles v
JOIN vehicletypes vt ON vt.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels vm ON vt.model_id = vm.vehicle_model_id
GROUP BY vm.vehicle_model_id
ORDER BY COUNT(v.vehicle_type_id);


--2.Which model of vehicle has the highest current inventory? This will help dealerships know which models are, perhaps, not selling.

SELECT COUNT(v.vehicle_type_id) as Total_Inventory,	
			vm.name,
			mk.name
FROM vehicles v
JOIN vehicletypes vt ON vt.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclemodels vm ON vt.model_id = vm.vehicle_model_id
JOIN vehiclemakes mk ON vt.make_id = mk.vehicle_make_id
GROUP BY vm.vehicle_model_id, mk.name
ORDER BY COUNT(v.vehicle_type_id)desc;

--Diverse Dealerships

--1. Which dealerships are currently selling the least number of vehicle models? This will let dealerships market vehicle models more effectively per region.

SELECT
	d.business_name,
	COUNT(md.vehicle_model_id) as TOTAl_count
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
JOIN vehicles v ON v.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON vt.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclebodytypes bt ON vt.body_type_id = bt.vehicle_body_type_id
JOIN vehiclemodels md ON vt.model_id = md.vehicle_model_id
GROUP by d.dealership_id
ORDER by COUNT(md.vehicle_model_id);


--2. Which dealerships are currently selling the highest number of vehicle models? This will let dealerships know which regions have either a high population, or less brand loyalty.


SELECT
	d.business_name,
	COUNT(md.vehicle_model_id) as TOTAl_count
FROM sales s
JOIN dealerships d ON s.dealership_id = d.dealership_id
JOIN vehicles v ON v.vehicle_id = v.vehicle_id
JOIN vehicletypes vt ON vt.vehicle_type_id = vt.vehicle_type_id
JOIN vehiclebodytypes bt ON vt.body_type_id = bt.vehicle_body_type_id
JOIN vehiclemodels md ON vt.model_id = md.vehicle_model_id
GROUP by d.dealership_id
ORDER by COUNT(md.vehicle_model_id)desc;
