CREATE TABLE FlightCompany.Passenger (
	Passenger_ID INT PRIMARY KEY,
    Passenger_Name VARCHAR(25),
    Age INT,
    Passenger_Gender VARCHAR(10),
    Passenger_Flight_ID INT,
	FOREIGN KEY (Passenger_Flight_ID) REFERENCES Flights(Flight_ID)
);

CREATE TABLE FlightCompany.Flights (
	Flight_ID INT PRIMARY KEY,
    Flight_Date DATE,
    Flight_Time TIME,
    Departure_Airport VARCHAR(25),
    Arival_Airport VARCHAR(25),
    FOREIGN KEY (Departure_Airport) REFERENCES Airport(Airport_Name),
    FOREIGN KEY (Arival_Airport) REFERENCES Airport(Airport_Name)
);

CREATE TABLE FlightCompany.Airport (
	Airport_Name VARCHAR(25) PRIMARY KEY,
    Location_Country VARCHAR(25),
    Location_City VARCHAR(25),
    Aircraft_Capacity INT
);

CREATE TABLE FlightCompany.Employee (
	Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(25),
    Job_Title VARCHAR(25),
    Num_of_Flights INT,
    Total_Flight_Hours INT,
    Attending_Flights INT,
    FOREIGN KEY (Attending_Flights) REFERENCES Flights(Flight_ID)
);

CREATE TABLE FlightCompany.Plane (
	Aircraft_ID INT PRIMARY KEY,
    Aircraft_Type VARCHAR(50),
    Flights INT,
	FOREIGN KEY (Flights) REFERENCES Flights(Flight_ID)
);



INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (1, 'John Doe', 30, 'Male', 101);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (2, 'Jane Smith', 25, 'Female', 102);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (3, 'Michael Johnson', 40, 'Male', 103);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (4, 'Emily Davis', 28, 'Female', 101);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (5, 'Daniel Wilson', 35, 'Male', 104);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (6, 'Olivia Anderson', 32, 'Female', 105);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (7, 'William Brown', 45, 'Male', 103);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (8, 'Sophia Thompson', 31, 'Female', 102);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (9, 'James Evans', 27, 'Male', 101);

INSERT INTO FlightCompany.Passenger (Passenger_ID, Passenger_Name, Age, Passenger_Gender, Passenger_Flight_ID)
VALUES (10, 'Ava Martinez', 38, 'Female', 104);



INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (101, '2023-05-22', '08:00:00', 'JFK', 'LAX');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (102, '2023-05-23', '13:30:00', 'LHR', 'CDG');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (103, '2023-05-24', '10:45:00', 'JFK', 'SFO');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (104, '2023-05-25', '14:15:00', 'LAX', 'ORD');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (105, '2023-05-26', '11:30:00', 'CDG', 'JFK');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (106, '2023-05-27', '09:20:00', 'ORD', 'LAX');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (107, '2023-05-28', '16:45:00', 'LHR', 'JFK');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (108, '2023-05-29', '12:10:00', 'SFO', 'CDG');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (109, '2023-05-30', '14:50:00', 'JFK', 'ORD');

INSERT INTO FlightCompany.Flights (Flight_ID, Flight_Date, Flight_Time, Departure_Airport, Arival_Airport)
VALUES (110, '2023-05-31', '11:15:00', 'LAX', 'SFO');




INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('JFK', 'United States', 'New York', 200);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('LAX', 'United States', 'Los Angeles', 300);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('LHR', 'United Kingdom', 'London', 250);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('CDG', 'France', 'Paris', 220);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('SFO', 'United States', 'San Francisco', 280);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('ORD', 'United States', 'Chicago', 270);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('DFW', 'United States', 'Dallas', 240);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('MAD', 'Spain', 'Madrid', 210);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('HND', 'Japan', 'Tokyo', 230);

INSERT INTO FlightCompany.Airport (Airport_Name, Location_Country, Location_City, Aircraft_Capacity)
VALUES ('PEK', 'China', 'Beijing', 250);




INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (1, 'John Smith', 'Pilot', 100, 500, 101);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (2, 'Jane Johnson', 'Flight Attendant', 200, 1000, 102);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (3, 'Michael Anderson', 'Co-Pilot', 150, 800, 103);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (4, 'Emily Davis', 'Flight Attendant', 180, 950, 104);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (5, 'Daniel Wilson', 'Pilot', 120, 600, 105);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (6, 'Olivia Brown', 'Flight Attendant', 160, 900, 101);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (7, 'William Thompson', 'Pilot', 110, 550, 102);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (8, 'Sophia Martinez', 'Flight Attendant', 190, 1000, 103);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (9, 'James Evans', 'Co-Pilot', 130, 700, 104);

INSERT INTO FlightCompany.Employee (Employee_ID, Employee_Name, Job_Title, Num_of_Flights, Total_Flight_Hours, Attending_Flights)
VALUES (10, 'Ava Wilson', 'Flight Attendant', 170, 950, 105);



INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (1, 'Boeing 747', 101);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (2, 'Airbus A320', 102);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (3, 'Boeing 777', 103);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (4, 'Airbus A380', 104);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (5, 'Boeing 737', 105);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (6, 'Airbus A350', 101);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (7, 'Boeing 787', 102);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (8, 'Airbus A330', 103);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (9, 'Boeing 767', 104);

INSERT INTO FlightCompany.Plane (Aircraft_ID, Aircraft_Type, Flights)
VALUES (10, 'Airbus A319', 105);

