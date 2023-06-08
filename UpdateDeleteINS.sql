-- THESE ARE DELETE AND UPDATE DONT RUN!!!
UPDATE FlightCompany.Passenger
SET Age = 31, Passenger_Gender = 'Male'
WHERE Passenger_ID = 1;

UPDATE FlightCompany.Passenger
SET Age = 26, Passenger_Gender = 'Male'
WHERE Passenger_ID = 2;

DELETE FROM FlightCompany.Flights
WHERE Flight_ID = 101;

DELETE FROM FlightCompany.Flights
WHERE Flight_ID = 102;

-- TTHIS IS TOTALLY ONE INSERTION (Tested)

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('ESB', 'Turkey', 'Ankara', 130);
INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (111, '2023-07-22', '08:00:00', 'JFK', 'ESB');
INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (11, 'Peter Pan', 23, 'Male', 111);
INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (11, 'Cassian Andor', 'Pilot', 120, 600, 111);
INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (11, 'U-Wing', 111);


-- TTHIS IS TOTALLY ONE INSERTION (Tested)
INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('IST', 'Turkey', 'Istanbul', 320);
INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (113, '2023-09-22', '09:00:00', 'IST', 'ESB');
INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (13, 'Micheal Jackson', 56, 'Male', 113);
INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (13, 'Han Solo', 'Pilot', 150, 650, 113);
INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (13, 'Milenium Falcon', 113);