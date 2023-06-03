
-- QUERRY to give the flight passengers that fly in same flights 
SELECT DISTINCT B.Passenger_Name, B.Passenger_ID, A.Flight_ID , A.Departure_Airport, A.Arival_Airport, A.Flight_Date , A.Flight_Time 
FROM FlightCompany.Passenger B
JOIN FlightCompany.Flights A ON B.Passenger_Flight_ID = A.Flight_ID
ORDER BY A.Flight_ID DESC;
-- QUERRY to give the flight passengers that fly in same flights (for spesific flight)
SELECT DISTINCT B.Passenger_Name, B.Passenger_ID, A.Flight_ID , A.Departure_Airport, A.Arival_Airport, A.Flight_Date , A.Flight_Time 
FROM FlightCompany.Passenger B
JOIN FlightCompany.Flights A ON B.Passenger_Flight_ID = A.Flight_ID AND A.Flight_ID LIKE '105'
ORDER BY A.Flight_ID DESC;


-- Querry that gives the flight employee flying the same flight
SELECT DISTINCT B.Employee_ID, B.Employee_Name, B.Job_Title , A.Flight_ID , A.Departure_Airport, A.Arival_Airport, A.Flight_Date , A.Flight_Time , C.Aircraft_Type
FROM FlightCompany.Employee B
JOIN FlightCompany.Flights A ON B.Attending_Flights = A.Flight_ID
JOIN FlightCompany.Plane C ON C.Flights = A.Flight_ID
ORDER BY A.Flight_ID DESC;
-- Querry that gives the flight employee flying the same flight (for spesific flight)
SELECT DISTINCT B.Employee_ID, B.Employee_Name, B.Job_Title , A.Flight_ID , A.Departure_Airport, A.Arival_Airport, A.Flight_Date , A.Flight_Time , C.Aircraft_Type
FROM FlightCompany.Employee B
JOIN FlightCompany.Flights A ON B.Attending_Flights = A.Flight_ID
JOIN FlightCompany.Plane C ON C.Flights = A.Flight_ID AND A.Flight_ID LIKE '105'
ORDER BY A.Flight_ID DESC;

-- View Tables for each emp flight in that plane
CREATE VIEW EMP_Airbus_A380 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type  LIKE 'Airbus A380' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Boeing_737 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type   LIKE 'Boeing 737' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Boeing_777 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type   LIKE 'Boeing 777' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Airbus_A350 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type  LIKE 'Airbus A350' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Airbus_A330 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type  LIKE 'Airbus A330' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Boeing_787 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type  LIKE 'Boeing 787' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Airbus_A319 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type  LIKE 'Airbus A319' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Boeing_767 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type  LIKE 'Boeing 767' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Boeing_747 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type  LIKE 'Boeing 747' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;

CREATE VIEW EMP_Airbus_A320 AS
SELECT B.Employee_ID, B.Employee_Name, B.Job_Title, AVG(B.Num_of_Flights) AS Avg_of_Flights, C.Aircraft_Type
FROM FlightCompany.Employee B, FlightCompany.Plane C
WHERE C.Aircraft_Type LIKE 'Airbus A320' AND C.Flights = B.Attending_Flights
GROUP BY C.Aircraft_Type, B.Employee_ID;


-- Querry for planes avg flights acording to view tables
SELECT Planes, AVG(Flights)
FROM(
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM emp_airbus_a319
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM emp_airbus_a320
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_airbus_a330
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_airbus_a350
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_airbus_a380
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_boeing_737
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_boeing_747
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_boeing_767
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_boeing_777
UNION ALL
SELECT Aircraft_Type as Planes, Avg_of_Flights AS Flights
FROM  emp_boeing_787 
) A
Group by Planes;
