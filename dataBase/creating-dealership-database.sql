-- create database
DROP DATABASE IF EXISTS car_dealership;

CREATE DATABASE car_dealership;

USE car_dealership;

-- create tables
CREATE TABLE dealership
(
	dealership_id INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(30) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    Phone VARCHAR(12) NOT NULL,
    PRIMARY KEY(dealership_id)
);

CREATE TABLE Vehicles
(
	Vin_number INT NOT NULL,
    dealership_id INT NOT NULL,
    year INT NOT NULL,
    make VARCHAR(30) NOT NULL,
    model VARCHAR(30) NOT NULL,
    VehicleType VARCHAR(30) NOT NULL,
    Color VARCHAR(30) NOT NULL,
    Odometer INT NOT NULL,
    Price DECIMAL NOT NULL,
    Sold VARCHAR(10),
    PRIMARY KEY(Vin_number)
);

CREATE TABLE Inventory
(
	dealership_id INT NOT NULL,
    Vin_number INT NOT NULL,
    PRIMARY KEY(dealership_id, Vin_number)
);

CREATE TABLE Sales_contract
(
	sales_id INT NOT NULL AUTO_INCREMENT,
    Customer_name VARCHAR(30) NOT NULL,
    Customer_email VARCHAR(40) NOT NULL,
    sale_date DATE,
    Vin_number INT NOT NULL,
    dealership_id INT NOT NULL,
    PRIMARY KEY(sales_id)
);

CREATE TABLE lease_contract
(
	lease_id INT NOT NULL AUTO_INCREMENT,
    Customer_name VARCHAR(30) NOT NULL,
    Customer_email VARCHAR(30) NOT NULL,
    lease_date VARCHAR(30),
    Vin_number INT NOT NULL,
    dealership_id INT NOT NULL,
    PRIMARY KEY(lease_id)
);

INSERT INTO dealership
(
	Name ,
    Address ,
    Phone
)
VALUES
	('My dealership', '223 w hammer ln', '2096584521')
    , ('Best Deals Auto', '123 Main St', '5551234567');

INSERT INTO Vehicles
(
	Vin_number,
    dealership_id,
    year,
    make,
    model,
    VehicleType,
    Color,
    Odometer,
	Price,
    Sold
)
VALUES
	(4120, 1 , 2005 , 'Honda' , 'Accord' , 'Sedan' , 'Red' , 25000 , 10500 , 'false')
    , (4121, 1, 2018, 'Toyota', 'Camry', 'Sedan', 'Blue', 30000, 18000, 'false')
	, (4122, 1, 2016, 'Ford', 'Mustang', 'Coupe', 'Black', 40000, 25000, 'false')
    , (4123, 2, 2016, 'Ford', 'F150', 'truck', 'Black', 40000, 25000, 'true');

INSERT INTO Inventory
(
	dealership_id,
    Vin_number
)
VALUES
	(1, 4120)
    , (1, 4121)
    , (1, 4122);
    
    INSERT INTO Sales_contract
    (
		 Customer_name
		, Customer_email
        , sale_date
		, Vin_number
		, dealership_id
    )
    VALUES
    (
		'Fahd Saleh'
        , 'fahd@email.com'
        , '2024-06-07'
        , 4123
        , 2
    );
    
 -- populating inventory table to dealership and vehicles table
 ALTER TABLE Inventory -- child table
 ADD CONSTRAINT fk_dealership
 FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id);
 
  ALTER TABLE Inventory -- child table
 ADD CONSTRAINT fk_vehiclefk_vehicle
 FOREIGN KEY (Vin_number) REFERENCES Vehicles(Vin_number);
 
 -- populating vehicle table with the dealership using the dealership_id
ALTER TABLE Vehicles
ADD CONSTRAINT fk_vehicles_dealership
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id);

-- populating sales contract to dealership and vehicle 
ALTER TABLE sales_contract
ADD CONSTRAINT fk_sales_dealership
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id);

ALTER TABLE sales_contract
ADD CONSTRAINT fk_sales_vehicle
FOREIGN KEY (Vin_number) REFERENCES Vehicles(Vin_number);

ALTER TABLE lease_contract
ADD CONSTRAINT fk_lease_dealership
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id);

ALTER TABLE lease_contract
ADD CONSTRAINT fk_lease_vehicle
FOREIGN KEY (Vin_number) REFERENCES Vehicles(Vin_number);
 