
CREATE TABLE PERSON(driver_id VARCHAR(30) PRIMARY KEY, name VARCHAR(50) NOT NULL, address VARCHAR(100) NOT NULL);
CREATE TABLE CAR(regno VARCHAR(20) PRIMARY KEY, model VARCHAR(30) NOT NULL, year INT);
CREATE TABLE ACCIDENT(report_number INT PRIMARY KEY, accd_date DATE, location VARCHAR(50));
CREATE TABLE OWNS(driver_id VARCHAR(30) PRIMARY KEY, regno VARCHAR(20) NOT NULL);
CREATE TABLE PARTICIPATED(driver_id VARCHAR(30) PRIMARY KEY, regno VARCHAR(20) NOT NULL, report_number INT, damage_amount INT);


ALTER TABLE PARTICIPATED ADD FOREIGN KEY(driver_id) REFERENCES PERSON;
ALTER TABLE PARTICIPATED ADD FOREIGN KEY(regno) REFERENCES CAR;
ALTER TABLE PARTICIPATED ADD FOREIGN KEY(report_number) REFERENCES ACCIDENT;
ALTER TABLE OWNS ADD FOREIGN KEY(driver_id) REFERENCES PERSON;
ALTER TABLE OWNS ADD FOREIGN KEY(regno) REFERENCES CAR;


INSERT INTO PERSON VALUES('Ak23', 'Akhil', 'JP Nagar');
INSERT INTO PERSON VALUES('SUJ', 'Suraj', 'MG Road');
INSERT INTO PERSON VALUES('Palindrome', 'Harsh', 'Thane');
INSERT INTO PERSON VALUES('Shivam', 'Singh', 'Mumbai');
INSERT INTO PERSON VALUES('Aditya', 'Keshav', 'Mumbai');


INSERT INTO CAR (regno, model, year) VALUES ('KA01AB1234', 'Maruti Suzuki Swift', 2018);
INSERT INTO CAR (regno, model, year) VALUES ('WB02CD5678', 'Hyundai i20', 2020);
INSERT INTO CAR (regno, model, year) VALUES ('DL03EF9012', 'Honda City', 2017);
INSERT INTO CAR (regno, model, year) VALUES ('KA04GH3456', 'Toyota Innova', 2019);
INSERT INTO CAR (regno, model, year) VALUES ('MH05IJ7890', 'Tata Nexon', 2021);


INSERT INTO ACCIDENT (report_number, accd_date, location) VALUES (1001, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'MG Road, Bengaluru');
INSERT INTO ACCIDENT (report_number, accd_date, location) VALUES (1002, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'Park Street, Kolkata');
INSERT INTO ACCIDENT (report_number, accd_date, location) VALUES (1003, TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'Nehru Nagar, Delhi');
INSERT INTO ACCIDENT (report_number, accd_date, location) VALUES (1004, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Gandhi Bazaar, Udupi');
INSERT INTO ACCIDENT (report_number, accd_date, location) VALUES (1005, TO_DATE('2022-05-25', 'YYYY-MM-DD'), 'Marine Drive, Mumbai');


INSERT INTO OWNS (driver_id, regno) VALUES ('Ak23', 'KA01AB1234');
INSERT INTO OWNS (driver_id, regno) VALUES ('SUJ', 'WB02CD5678');
INSERT INTO OWNS (driver_id, regno) VALUES ('Palindrome', 'DL03EF9012');
INSERT INTO OWNS (driver_id, regno) VALUES ('Shivam', 'KA04GH3456');
INSERT INTO OWNS (driver_id, regno) VALUES ('Aditya', 'MH05IJ7890');


INSERT INTO PARTICIPATED (driver_id, regno, report_number, damage_amount) VALUES ('Ak23', 'KA01AB1234', 1001, 15000);
INSERT INTO PARTICIPATED (driver_id, regno, report_number, damage_amount) VALUES ('SUJ', 'WB02CD5678', 1002, 20000);
INSERT INTO PARTICIPATED (driver_id, regno, report_number, damage_amount) VALUES ('Palindrome', 'DL03EF9012', 1003, 25000);
INSERT INTO PARTICIPATED (driver_id, regno, report_number, damage_amount) VALUES ('Shivam', 'KA04GH3456', 1004, 30000);
INSERT INTO PARTICIPATED (driver_id, regno, report_number, damage_amount) VALUES ('Aditya', 'MH05IJ7890', 1005, 35000);


UPDATE PARTICIPATED
SET damage_amount = 25000
WHERE regno = 'KA01AB1234' AND report_number = 1001;


DELETE FROM ACCIDENT
WHERE EXTRACT(YEAR FROM accd_date) = 2022;

DELETE FROM PARTICIPATED
WHERE report_number IN (SELECT report_number FROM ACCIDENT WHERE EXTRACT(YEAR FROM accd_date) = 2022);


ALTER TABLE PERSON
ADD phone_number VARCHAR(15);


ALTER TABLE PERSON
DROP COLUMN phone_number;

ALTER TABLE CAR
ADD CONSTRAINT check_year CHECK (year >= 2015);
