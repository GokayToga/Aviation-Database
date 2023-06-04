-- Filtrelemelerde bir string commandi alıp onun bulunduğu sonuçları getirecek kodlar lazım.

-- [ ] Filter Flights by Airport Location
-- [ ] Filter Flights by Airport Name
-- [ ] Filter Flights by Plane ID
-- [ ] Filter Flights by Plane Brand
-- [ ] Filter Flights by Plane Airline
-- [ ] Filter Flights by Plane Model
-- [ ] Sort by Name (employee)
-- [ ] Sort by Job Title (employee)
-- [ ] Sort by Number of flights (employee)
-- [ ] Sort by Total Flight Hours (employee)
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
ORDER BY A.Employee_ID;

SELECT *
FROM FlightCompany.Employee A
ORDER BY A.Employee_ID ASC;


SELECT A.Employee_Name
FROM FlightCompany.Employee A
ORDER BY A.Employee_ID;

SELECT  A.Airport_Name, A.Location_Country, A.Location_City
FROM FlightCompany.Airport A
ORDER BY A.Airport_Name;

SELECT A.Flight_ID, A.Departure_Airport
FROM FlightCompany.Flights A
ORDER BY A.Flight_ID;

SELECT A.Flight_ID
FROM FlightCompany.Flights A
ORDER BY A.Flight_Date;


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



