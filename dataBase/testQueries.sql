USE car_dealership;

-- 1)
SELECT * FROM dealership;

-- 2)
SELECT V.*
	, DS.Name AS 'Dealership name'
FROM Vehicles AS V
INNER JOIN dealership AS DS
	ON V.dealership_id = DS.dealership_id;
    
-- 3)
SELECT *
FROM Vehicles
WHERE Vin_number = 4120;

-- 4)
SELECT DS.Name AS 'Dealership name'
	, V.*
FROM Vehicles AS V
INNER JOIN dealership AS DS
	ON DS.dealership_id = V.dealership_id
WHERE Vin_number = 4123;

-- 5)
SELECT DS.name AS dealership_name
	, DS.address
	, V.*
FROM Inventory AS I
INNER JOIN dealership AS DS
	ON DS.dealership_id = I.dealership_id
INNER JOIN Vehicles AS V
	ON V.Vin_number = I.Vin_number
 WHERE make = 'Toyota';
 
 -- 6)
 SELECT SC.*
    , DS.Name
    , DS.Address
FROM sales_contract AS SC
INNER JOIN dealership AS DS
	ON DS.dealership_id = SC.dealership_id
WHERE sale_date = '2024-06-07';
