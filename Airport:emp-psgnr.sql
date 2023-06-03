SELECT *
FROM FlightCompany.Employee ;
SELECT *
FROM FlightCompany.Airport ;
SELECT *
FROM FlightCompany.Flights ;
SELECT *
FROM FlightCompany.Passenger ;
SELECT *
FROM FlightCompany.Plane ;

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
join FlightCompany.Passenger B ON A.Attending_Flights = B.Passenger_Flight_ID
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

-- QUERRY that returns te total departure and total arrival flights sepperatly of a spesific airport
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

-- querry that returns Total_Departure_Flights and Total_Arrival_Flights of each airport
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

-- querry that returns Total_Departure_Flights,  Total_Arrival_Flights  and Total Flights of each airport
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

-- querry that returns the total flight from airports
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










