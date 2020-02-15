-- Delete the table if it exits
DROP TABLE Campaigns;

-- Create a table for Campaigns
CREATE TABLE Campaigns(
    cid           SERIAL,
    tupleNo       SERIAL,
    name          VARCHAR(255) NOT NULL,
    start_date    DATE NOT NULL,
    end_date      DATE NOT NULL,
    PRIMARY KEY (cid),
    UNIQUE (tupleNo),
    CHECK (DATE_PART('month', age(end_date, start_date)) <= 2),
    CHECK (DATE_PART('month', age(end_date, start_date))*30 + DATE_PART('day', age(end_date, start_date)) >= 14)
);

-- Insert Campaigns data
INSERT INTO Campaigns(cid, tupleNo, name, start_date, end_date)
VALUES (DEFAULT, DEFAULT, 'World Wetlands Day',	'2017-02-02', '2017-02-16');

INSERT INTO Campaigns(cid, tupleNo, name, start_date, end_date)
VALUES(DEFAULT, DEFAULT, 'Champions of the Earth', '2017-03-03', '2017-04-03');

INSERT INTO Campaigns(cid, tupleNo, name, start_date, end_date)
VALUES(DEFAULT, DEFAULT, 'Earth Day', '2018-04-01', '2018-04-30');

INSERT INTO Campaigns(cid, tupleNo, name, start_date, end_date)
VALUES(DEFAULT, DEFAULT, 'National Bike Month', '2019-05-01', '2019-05-31');

INSERT INTO Campaigns(cid, tupleNo, name, start_date, end_date)
VALUES(DEFAULT, DEFAULT, 'Clean Up the World Campaign', '2019-06-22', '2019-08-22');
