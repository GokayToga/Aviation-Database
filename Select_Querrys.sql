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



