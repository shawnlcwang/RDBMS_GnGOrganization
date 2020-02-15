-- Delete the table if it exits
DROP TABLE Events;

-- Create a table for Events
CREATE TABLE Events(
    eid           SERIAL,
    tupleNo       SERIAL,
    name          VARCHAR(255) NOT NULL,
    event_date    DATE NOT NULL,
    start_time    TIME NOT NULL,
    end_time      TIME NOT NULL,
    address       VARCHAR(255) NOT NULL,
    city          VARCHAR(31) NOT NULL,
    region        VARCHAR(31) NOT NULL,
    material      VARCHAR(255),
    cost          MONEY NOT NULL,
    PRIMARY KEY (eid),
    UNIQUE (tupleNo),
    UNIQUE (name, event_date, start_time, end_time, city, region)
);

-- Insert Events data
INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES (DEFAULT, DEFAULT, 'Research Symposium', '2017-02-09', '09:00:00', '15:00:00', '200 University Ave W, Waterloo, ON N2L 3G1', 'Waterloo', 'Ontario', NULL, 350.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES (DEFAULT, DEFAULT, 'Snowshoeing Trip', '2017-02-09', '09:00:00', '15:00:00', '101 Tewesateni Rd, Akwesasne, ON K6H 0G5', 'Akwesasne', 'Ontario', 'Snowshoes', 1200.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'Youth Awareness March',	'2017-03-27', '11:00:00', '13:00:00', '1 Centennial Square, Victoria, BC V8W 1P6', 'Victoria', 'British Columbia', 'Posters', 400.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'Youth Awareness March',	'2017-03-27', '11:00:00', '13:00:00', '453 W 12th Ave, Vancouver, BC V5Y 1V4', 'Vancouver', 'British Columbia', 'Posters', 800.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'Camp for Climate Action', '2018-04-21', '09:00:00', '15:00:00', '1 Sir Winston Churchill Square, Edmonton, AB T5J 2R7', 'Edmonton', 'Alberta', 'Tents, Posters',	1800.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'Camp for Climate Action', '2018-04-22', '09:00:00', '15:00:00', '1 Sir Winston Churchill Square, Edmonton, AB T5J 2R7', 'Edmonton', 'Alberta', 'Tents, Posters', 1800.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'Bike To School Day', '2019-05-08', '08:00:00', '10:00:00', '2005 Sooke Rd, Victoria, BC V9B 5Y2', 'Langford', 'British Columbia', 'Bikes', 1500.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'Bike to Work Day', '2019-05-08', '08:00:00', '10:00:00', '877 Goldstream Ave, Victoria, BC V9B 2X8', 'Langford', 'British Columbia', 'Bikes', 2500.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'CYCLOFEMME', '2019-05-12', '15:00:00', '17:00:00', '877 Goldstream Ave, Victoria, BC V9B 2X8', 'Langford', 'British Columbia', 'Bikes', 2500.00);

INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
VALUES(DEFAULT, DEFAULT, 'Beat Plastic Pollution', '2019-07-03', '09:00:00', '17:00:00', '1 Centennial Square, Victoria, BC V8W 1P6', 'Victoria', 'British Columbia', 'Gloves, Garbage Bags, Recycle Bins', 650.00);
