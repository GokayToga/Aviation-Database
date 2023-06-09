-- these are the queries that will be present on the application (version 1.0)

-- employees and passengers in same flight queerry with WHERE
SELECT A.Employee_Name, A.Job_Title , B.Passenger_Name
FROM FlightCompany.Employee A,FlightCompany.Passenger B
WHERE A.Attending_Flights = B.Passenger_Flight_ID
ORDER BY A.Employee_Name;

-- Flights departing from an airport
SELECT Airport ,  Departure_Fligt ,Aircraft
FROM(
(SELECT A.Airport_Name as Airport,  B.Flight_ID AS Departure_Fligt, C.Aircraft_Type as Aircraft
FROM FlightCompany.Airport A,FlightCompany.Flights B ,FlightCompany.Plane C
WHERE A.Airport_Name = B.Departure_Airport 
ORDER BY A.Airport_Name)) X;

-- Flights arriving on an airport
SELECT Airport, Arival_Fligt ,Aircraft
FROM(
(SELECT A.Airport_Name as Airport, B.Flight_ID AS Arival_Fligt, C.Aircraft_Type as Aircraft
FROM FlightCompany.Airport A,FlightCompany.Flights B ,FlightCompany.Plane C
WHERE A.Airport_Name = B.Arival_Airport 
ORDER BY A.Airport_Name )) Y;

-- employees and passengers in same flight queerry with JOIN
SELECT A.Employee_Name, A.Job_Title , B.Passenger_Name
FROM FlightCompany.Employee A
JOIN FlightCompany.Passenger B ON A.Attending_Flights = B.Passenger_Flight_ID
order by A.Employee_Name;


-- Flights departing from a spesific airport (for know JFK)
SELECT Airport ,  Departure_Fligt ,Aircraft
FROM(
(SELECT A.Airport_Name as Airport,  B.Flight_ID AS Departure_Fligt, C.Aircraft_Type as Aircraft
FROM FlightCompany.Airport A,FlightCompany.Flights B ,FlightCompany.Plane C
WHERE A.Airport_Name = B.Departure_Airport AND A.Airport_Name like 'JFK'
ORDER BY A.Airport_Name)) X;

-- Flights arriving on a spesific airpot (for now JFK)
SELECT Airport, Arival_Fligt ,Aircraft
FROM(
(SELECT A.Airport_Name as Airport, B.Flight_ID AS Arival_Fligt, C.Aircraft_Type as Aircraft
FROM FlightCompany.Airport A,FlightCompany.Flights B ,FlightCompany.Plane C
WHERE A.Airport_Name = B.Arival_Airport AND A.Airport_Name like 'JFK'
ORDER BY A.Airport_Name )) Y;


--  NUM Flights arriving on a spesific airpot (for now JFK)
Select Airport , count(Arival_Fligt) AS NUM_ARRIVAL_FLIGTS
FROM(
SELECT Airport, Arival_Fligt ,Aircraft
FROM(
(SELECT A.Airport_Name as Airport, B.Flight_ID AS Arival_Fligt, C.Aircraft_Type as Aircraft
FROM FlightCompany.Airport A,FlightCompany.Flights B ,FlightCompany.Plane C
WHERE A.Airport_Name = B.Arival_Airport AND A.Airport_Name like 'JFK'
ORDER BY A.Airport_Name ))Y)U
Group by U.Airport;


--  NUM Flights departing from a spesific airpot (for now JFK)
Select Airport , count(Departure_Fligt) AS NUM_DEPARUTRE_FLIGTS
FROM(
SELECT Airport ,  Departure_Fligt ,Aircraft
FROM(
(SELECT A.Airport_Name as Airport,  B.Flight_ID AS Departure_Fligt, C.Aircraft_Type as Aircraft
FROM FlightCompany.Airport A,FlightCompany.Flights B ,FlightCompany.Plane C
WHERE A.Airport_Name = B.Departure_Airport AND A.Airport_Name like 'JFK'
ORDER BY A.Airport_Name)) X) U 
Group by U.Airport;

-- query that returns te total departure and total arrival flights sepperatly of a spesific airport
SELECT Airport, SUM(NUM_DEPARTURE_FLIGHTS) AS Total_Departure_Flights, SUM(NUM_ARRIVAL_FLIGHTS) AS Total_Arrival_Flights
FROM (
    SELECT Airport, COUNT(Departure_Fligt) AS NUM_DEPARTURE_FLIGHTS, 0 AS NUM_ARRIVAL_FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Departure_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Departure_Airport AND A.Airport_Name LIKE 'JFK'
        ORDER BY A.Airport_Name
    ) X
    GROUP BY X.Airport

    UNION ALL

    SELECT Airport, 0 AS NUM_DEPARTURE_FLIGHTS, COUNT(Arival_Fligt) AS NUM_ARRIVAL_FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Arival_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Arival_Airport AND A.Airport_Name LIKE 'JFK'
        ORDER BY A.Airport_Name
    ) Y
    GROUP BY Y.Airport
) G
GROUP BY G.Airport;

-- query that returns Total_Departure_Flights and Total_Arrival_Flights of each airport
SELECT Airport, SUM(NUM_DEPARTURE_FLIGHTS) AS Total_Departure_Flights, SUM(NUM_ARRIVAL_FLIGHTS) AS Total_Arrival_Flights
FROM (
    SELECT Airport, COUNT(Departure_Fligt) AS NUM_DEPARTURE_FLIGHTS, 0 AS NUM_ARRIVAL_FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Departure_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Departure_Airport 
        ORDER BY A.Airport_Name
    ) X
    GROUP BY X.Airport

    UNION ALL

    SELECT Airport, 0 AS NUM_DEPARTURE_FLIGHTS, COUNT(Arival_Fligt) AS NUM_ARRIVAL_FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Arival_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Arival_Airport  
        ORDER BY A.Airport_Name
    ) Y
    GROUP BY Y.Airport
) G
GROUP BY G.Airport
order by G.Airport;

-- query that returns Total_Departure_Flights,  Total_Arrival_Flights  and Total Flights of each airport
SELECT Airport, SUM(NUM_DEPARTURE_FLIGHTS) AS Total_Departure_Flights, SUM(NUM_ARRIVAL_FLIGHTS) AS Total_Arrival_Flights , SUM(FLIGHTS) AS Total_Flights
FROM (
    SELECT Airport, COUNT(Departure_Fligt) AS NUM_DEPARTURE_FLIGHTS, 0 AS NUM_ARRIVAL_FLIGHTS ,COUNT(Departure_Fligt) AS FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Departure_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Departure_Airport 
        ORDER BY A.Airport_Name
    ) X
    GROUP BY X.Airport

    UNION ALL

    SELECT Airport, 0 AS NUM_DEPARTURE_FLIGHTS, COUNT(Arival_Fligt) AS NUM_ARRIVAL_FLIGHTS ,COUNT(Arival_Fligt) AS FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Arival_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Arival_Airport  
        ORDER BY A.Airport_Name
    ) Y
    GROUP BY Y.Airport
) G
GROUP BY G.Airport
order by G.Airport;

-- query that returns the total flight from airports
SELECT Airport, SUM(FLIGHTS) AS Total_Flights
FROM (
    SELECT Airport, COUNT(Departure_Fligt) AS FLIGHTS, 0 AS NUM_ARRIVAL_FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Departure_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Departure_Airport 
        ORDER BY A.Airport_Name
    ) X
    GROUP BY X.Airport

    UNION ALL

    SELECT Airport, 0 AS NUM_DEPARTURE_FLIGHTS, COUNT(Arival_Fligt) AS FLIGHTS
    FROM (
        SELECT A.Airport_Name AS Airport, B.Flight_ID AS Arival_Fligt, C.Aircraft_Type AS Aircraft
        FROM FlightCompany.Airport A, FlightCompany.Flights B, FlightCompany.Plane C
        WHERE A.Airport_Name = B.Arival_Airport  
        ORDER BY A.Airport_Name
    ) Y
    GROUP BY Y.Airport
) G
GROUP BY G.Airport
order by G.Airport;

-- Retrieve all passengers who are associated with flights with Flight_IDs 101, 103, and 105:
SELECT * 
FROM FlightCompany.Passenger 
WHERE Passenger_Flight_ID IN (101, 103, 105);

-- Retrieve all flights that have Departure_Airport either JFK or LAX:
SELECT * 
FROM FlightCompany.Flights 
WHERE Departure_Airport IN ('JFK', 'LAX');

-- Retrieve all airports located in either the United States or France:
SELECT * 
FROM FlightCompany.Airport 
WHERE Location_Country IN ('United States', 'France');

-- Retrieve all employees attending flights with Flight_IDs 101, 103, and 105:
SELECT * 
FROM FlightCompany.Employee 
WHERE Attending_Flights IN (101, 103, 105);

-- Retrieve all planes that have Flights with Flight_IDs 101, 103, and 105:
SELECT * 
FROM FlightCompany.Plane 
WHERE Flights IN (101, 103, 105);

-- NOT IN
-- Retrieve all passengers who are not associated with flights with Flight_IDs 102 and 104:
SELECT * FROM FlightCompany.Passenger WHERE Passenger_Flight_ID NOT IN (102, 104);

-- Retrieve all flights that do not have Departure_Airport either JFK or LAX:
SELECT * FROM FlightCompany.Flights WHERE Departure_Airport NOT IN ('JFK', 'LAX');

-- Retrieve all airports not located in either the United States or France:
SELECT * FROM FlightCompany.Airport WHERE Location_Country NOT IN ('United States', 'France');

-- Retrieve all employees not attending flights with Flight_IDs 102 and 104:
SELECT * FROM FlightCompany.Employee WHERE Attending_Flights NOT IN (102, 104);

-- Retrieve all planes that do not have Flights with Flight_IDs 102 and 104:
SELECT * FROM FlightCompany.Plane WHERE Flights NOT IN (102, 104);


-- BETWEEN AND
-- pretty self explanatory but the first one is:
-- Retrieve all flights that have Flight_ID between 101 and 105:
SELECT * 
FROM FlightCompany.Flights 
WHERE Flight_ID BETWEEN 101 AND 105;

SELECT * 
FROM FlightCompany.Flights 
WHERE Flight_ID NOT BETWEEN 102 AND 104;

SELECT * 
FROM FlightCompany.Passenger 
WHERE Age BETWEEN 25 AND 35;

SELECT * 
FROM FlightCompany.Passenger 
WHERE Age NOT BETWEEN 30 AND 40;

SELECT * 
FROM FlightCompany.Airport 
WHERE Aircraft_Capacity BETWEEN 200 AND 300;

SELECT * 
FROM FlightCompany.Airport 
WHERE Aircraft_Capacity NOT BETWEEN 250 AND 300;

SELECT * 
FROM FlightCompany.Employee 
WHERE Total_Flight_Hours BETWEEN 500 AND 800;

SELECT * 
FROM FlightCompany.Plane 
WHERE Aircraft_ID BETWEEN 1 AND 5;

-- MIN/MAX
-- Retrieve the minimum and maximum Flight_ID from the Flights table:
SELECT MIN(Flight_ID) AS Min_Flight_ID, MAX(Flight_ID) AS Max_Flight_ID 
FROM FlightCompany.Flights;

-- Retrieve the minimum and maximum Age from the Passenger table:
SELECT MIN(Age) AS Min_Age, MAX(Age) AS Max_Age 
FROM FlightCompany.Passenger;

-- Retrieve the minimum and maximum Aircraft_Capacity from the Airport table:
SELECT MIN(Aircraft_Capacity) AS Min_Aircraft_Capacity, MAX(Aircraft_Capacity) AS Max_Aircraft_Capacity 
FROM FlightCompany.Airport;

-- Retrieve the minimum and maximum Total_Flight_Hours from the Employee table:
SELECT MIN(Total_Flight_Hours) AS Min_Total_Flight_Hours, MAX(Total_Flight_Hours) AS Max_Total_Flight_Hours 
FROM FlightCompany.Employee;

-- Retrieve the minimum and maximum Aircraft_ID from the Plane table:
SELECT MIN(Aircraft_ID) AS Min_Aircraft_ID, MAX(Aircraft_ID) AS Max_Aircraft_ID 
FROM FlightCompany.Plane;



-- SOME
-- Retrieve passengers whose age is greater than some of the ages in the subquery:
SELECT * FROM FlightCompany.Passenger
WHERE Age > SOME (SELECT Age FROM FlightCompany.Passenger WHERE Passenger_Gender = 'Male');

-- Retrieve flights where the flight time is earlier than some of the flight times in the subquery:
SELECT * FROM FlightCompany.Flights
WHERE Flight_Time < SOME (SELECT Flight_Time FROM FlightCompany.Flights WHERE Flight_Date = '2023-05-22');

-- Retrieve employees whose total flight hours are greater than some of the total flight hours in the subquery:
SELECT * FROM FlightCompany.Employee
WHERE Total_Flight_Hours > SOME (SELECT Total_Flight_Hours FROM FlightCompany.Employee WHERE Job_Title = 'Flight Attendant');



-- ALL
-- Retrieve passengers whose age is greater than all the ages in the subquery:
SELECT * FROM FlightCompany.Passenger
WHERE Age > ALL (SELECT Age FROM FlightCompany.Passenger WHERE Passenger_Gender = 'Male');

-- Retrieve flights where the flight time is earlier than all the flight times in the subquery:
SELECT * FROM FlightCompany.Flights
WHERE Flight_Time < ALL (SELECT Flight_Time FROM FlightCompany.Flights WHERE Flight_Date = '2023-05-22');

-- Retrieve employees whose total flight hours are greater than all the total flight hours in the subquery:
SELECT * FROM FlightCompany.Employee
WHERE Total_Flight_Hours > ALL (SELECT Total_Flight_Hours FROM FlightCompany.Employee WHERE Job_Title = 'Flight Attendant');



-- CASE-WHEN
-- Retrieve passengers and categorize them as "Adult" or "Child" based on their age:
SELECT Passenger_Name, Age,
    CASE
        WHEN Age >= 18 THEN 'Adult'
        ELSE 'Child'
    END AS Passenger_Category
FROM FlightCompany.Passenger;

-- Retrieve flights and categorize them as "Domestic" or "International" based on the location country of the departure and arrival airports:
SELECT Flight_ID, Departure_Airport, Arival_Airport,
    CASE
        WHEN (SELECT Location_Country FROM FlightCompany.Airport WHERE Airport_Name = Departure_Airport) = 'United States'
            AND (SELECT Location_Country FROM FlightCompany.Airport WHERE Airport_Name = Arival_Airport) = 'United States'
            THEN 'Domestic'
        ELSE 'International'
    END AS Flight_Category
FROM FlightCompany.Flights;

-- Retrieve employees and calculate their average flight hours per flight:
SELECT Employee_Name, Total_Flight_Hours, Num_of_Flights,
    CASE
        WHEN Num_of_Flights > 0 THEN Total_Flight_Hours / Num_of_Flights
        ELSE 0
    END AS Average_Flight_Hours_Per_Flight
FROM FlightCompany.Employee;



-- Unique (SELECT DISTINCT)
-- Retrieve the unique passenger genders from the Passenger table:
SELECT DISTINCT Passenger_Gender
FROM FlightCompany.Passenger;

-- Retrieve the unique airport cities from the Airport table:
SELECT DISTINCT Location_City
FROM FlightCompany.Airport;

-- Retrieve the unique job titles from the Employee table:
SELECT DISTINCT Job_Title
FROM FlightCompany.Employee;

-- Retrieve the average age of passengers grouped by gender and select only those groups where the average age is greater than 30.
SELECT Passenger_Gender AS Gender, AVG(Age) AS Average_Age
FROM FlightCompany.Passenger
GROUP BY Passenger_Gender
HAVING Average_Age > 30;

-- Retrieve all airports that have at least one flight departing from them.
SELECT Airport_Name, Location_City
FROM FlightCompany.Airport A
WHERE EXISTS (
    SELECT 1
    FROM FlightCompany.Flights F
    WHERE F.Departure_Airport = A.Airport_Name
);

-- Retrieve all passengers whose names start with the letter 'J'. STRING OPERATION
SELECT *
FROM FlightCompany.Passenger
WHERE Passenger_Name LIKE 'J%';

-- Retrieve all passengers and their corresponding flights using a LEFT OUTER JOIN.
SELECT *
FROM FlightCompany.Passenger P
LEFT OUTER JOIN FlightCompany.Flights F ON P.Passenger_Flight_ID = F.Flight_ID;

-- Takes every passenger with id = 1 (one row operation)
SELECT *
FROM FlightCompany.Passenger
WHERE Passenger_ID = 1;

-- Retrieve the list of flights that depart from the United States. (multiple row operation)
SELECT *
FROM FlightCompany.Flights
JOIN FlightCompany.Airport ON Flights.Departure_Airport = Airport.Airport_Name
WHERE Airport.Location_Country = 'United States';

-- Retrieve the list of passengers along with their assigned flights and the corresponding departure airports.
SELECT Passenger.Passenger_Name, Flights.Flight_ID, Airport.Location_City AS Departure_City
FROM FlightCompany.Passenger
JOIN FlightCompany.Flights ON Passenger.Passenger_Flight_ID = Flights.Flight_ID
JOIN FlightCompany.Airport ON Flights.Departure_Airport = Airport.Airport_Name;

-- Retrieve the list of passengers along with their assigned flights, the corresponding departure airports, and the job titles of the employees attending those flights.
SELECT Passenger.Passenger_Name, Flights.Flight_ID, Airport.Location_City AS Departure_City, Employee.Job_Title
FROM FlightCompany.Passenger
JOIN FlightCompany.Flights ON Passenger.Passenger_Flight_ID = Flights.Flight_ID
JOIN FlightCompany.Airport ON Flights.Departure_Airport = Airport.Airport_Name
JOIN FlightCompany.Employee ON Employee.Attending_Flights = Flights.Flight_ID;

-- IS NULL query for Flights, Departure_Airport 
SELECT * 
FROM FlightCompany.Flights 
WHERE Departure_Airport IS NULL;

-- IS NULL query for Airport, Location_Country 
SELECT * 
FROM FlightCompany.Airport 
WHERE Location_Country IS NULL;

-- IS NULL query for Employee, Attending_Flights 
SELECT * 
FROM FlightCompany.Employee 
WHERE Attending_Flights IS NULL;

-- IS NULL query for Plane, Flights 
SELECT * 
FROM FlightCompany.Plane 
WHERE Flights IS NULL;