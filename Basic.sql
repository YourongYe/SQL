-- create table with diff data types
CREATE TABLE Staff
(
  staffID INTEGER AUTO_INCREMENT PRIMARY KEY,
  itemid INTEGER,
  startDate DATETIME NOT NULL,
  Salary DECIMAL,
  isRetired bit NULL DEFAULT 0, -- SQL没有bool值，只有bit
  FOREIGN KEY (propertyID) REFERENCES Property (propertyID)
 );
 
-- general query statement
SELECT *
FROM Auction
WHERE ENDDATE<=CURRENT_TIMESTAMP

-- 如果要修改某个表里的某些值，可以用
UPDATE Auction
SET isFinished = 1
WHERE Auction.endDate <= CURRENT_TIMESTAMP;
   
   
-- 要手动insert数据
INSERT INTO Auction(auctionid,startDate,endDate)
VALUES(00006,'19-10-29','19-11-20');
INSERT INTO Auction(auctionid,startDate,endDate)
VALUES(00007,'19-10-29','19-12-20');
