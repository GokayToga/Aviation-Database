-- Filtrelemelerde bir string commandi alıp onun bulunduğu sonuçları getirecek kodlar lazım.

-- [ ] Filter Flights by Airport Location
-- [ ] Filter Flights by Airport Name
-- [ ] Filter Flights by Plane ID
-- [ ] Filter Flights by Plane Brand
-- [ ] Filter Flights by Plane Airline
-- [ ] Filter Flights by Plane Model
-- Sort by Airplane ID (plane)
-- Sort by Airplane Type (plane)
-- Sort by Airport Name (airport)
-- Sort by Airport Capacity (airport)
-- Sort by Airport Location (airport) (bilemedim sort mu filter mı ikisi de mi hiçbiri mi fikri olan el atsın)
-- Sort by Passenger ID (passenger)
-- Sort by Passenger Name (passenger)
-- Sort by Passenger Surname (passenger)
-- Sort by Passenger Age (passenger)
-- Filter by Passenger Gender (passenger)


-- [ ] Sort by ID (employee) 
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Employee_ID; -- ascending

-- [ ] Sort by ID (employee) (decreasing)
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Employee_ID DESC;

-- Employees ordered by id with just names shown
SELECT A.Employee_Name
FROM FlightCompany.Employee A
ORDER BY A.Employee_ID;

-- Sort by Airport Name (asc)
SELECT  A.Airport_Name, A.Location_Country, A.Location_City
FROM FlightCompany.Airport A
ORDER BY A.Airport_Name;

-- Sort by Airport Name (desc)
SELECT  A.Airport_Name, A.Location_Country, A.Location_City
FROM FlightCompany.Airport A
ORDER BY A.Airport_Name DESC;

-- Sort by Flight ID, show id and departure airport
SELECT A.Flight_ID, A.Departure_Airport
FROM FlightCompany.Flights A
ORDER BY A.Flight_ID;

-- sort by flight date (asc)
SELECT A.Flight_ID
FROM FlightCompany.Flights A
ORDER BY A.Flight_Date;

-- sort by flight date (desc)
SELECT A.Flight_ID
FROM FlightCompany.Flights A
ORDER BY A.Flight_Date DESC;

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

-- [ ] Sort by Name (employee) (asc)
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Employee_Name;

-- [ ] Sort by Name (employee) desc
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Employee_Name DESC;

-- [ ] Sort by Job Title (employee) (asc)
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Job_Title;

-- [ ] Sort by Job Title (employee) (desc)
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Job_Title DESC;

-- [] Average flight hours (ne işe yarar bilmiyorum ama AVG gerekliymiş)
SELECT AVG(Flight_Time)/10000 AS AVERAGE_FLIGHT_TIME
FROM FlightCompany.Flights A;

-- [] Sort flights by date
SELECT A.Flight_ID AS FLIGHT_ID, A.Flight_Date AS FLIGHT_DATES
FROM FlightCompany.Flights A
ORDER BY A.Flight_Date;

-- [ ] Sort by Number of flights (employee)
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Num_of_Flights;

-- [ ] Sort by Total Flight sHours (employee)
SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Total_Flight_Hours;

-- Average Flight Hour Per Employee 
SELECT AVG(A.Total_Flight_Hours) AS AVERAGE_FLIGHT_TIME
FROM FlightCompany.Employee A;

-- Average number of flights per employee
SELECT AVG(A.Num_of_Flights) AS AVERAGE_NUMBER_OF_FLIGHTS
FROM FlightCompany.Employee A;

-- ID's of employees departing from the same airport (birden fazla table kullanmak için lazim olabilir gibi geldi)