USE car_dealership;

-- 1)
SELECT * FROM dealership;

-- 2)
SELECT V.*
	, DS.name AS 'dealership name'
FROM Vehicles AS V
INNER JOIN inventory AS I
	ON V.vin_number = I.vin_number
INNER JOIN dealership AS DS
	ON DS.dealership_id = I.dealership_id;
    
-- 3)
SELECT *
FROM Vehicles
WHERE Vin_number = 4120;

-- 4)
SELECT DS.Name AS 'Dealership name'
	, V.*
FROM Vehicles AS V
INNER JOIN inventory AS I
	ON I.Vin_number = V.Vin_number
INNER JOIN dealership AS DS
		ON I.dealership_id = DS.dealership_id
WHERE V.Vin_number = 4123;

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
    , DS.Name AS 'Dealership Address'
    , DS.Address AS 'Dealership Address'
    , V.price AS 'Vehicle price'
FROM sales_contract AS SC
INNER JOIN dealership AS DS
	ON DS.dealership_id = SC.dealership_id
INNER JOIN vehicles AS V
		ON SC.Vin_number = V.Vin_number
WHERE sale_date = '2024-06-07';
