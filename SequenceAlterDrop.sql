
-- THESE QUERY IS FOR MAKING THE ID PRIMARY KEYS SEQUENTIAL WITH AUTO_INCREMENT 
-- THIS SHOULD NOT DISTORT ANY DATA, BUT CAREFULL!! I RUNED IT BTW
ALTER TABLE Employee
  DROP PRIMARY KEY,
  MODIFY COLUMN Employee_ID INT AUTO_INCREMENT PRIMARY KEY;
  
ALTER TABLE Passenger
  DROP PRIMARY KEY,
  MODIFY COLUMN Passenger_ID INT AUTO_INCREMENT PRIMARY KEY;
  
ALTER TABLE Plane
  DROP PRIMARY KEY,
  MODIFY COLUMN Aircraft_ID INT AUTO_INCREMENT PRIMARY KEY;
