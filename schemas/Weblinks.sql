-- Delete the table if it exits
DROP TABLE Weblinks;

-- Create a table for Weblinks
CREATE TABLE Weblinks(
    wid           SERIAL,
    tupleNo       SERIAL,
    phase         VARCHAR(255) NOT NULL CHECK (phase in ('Quiet', 'Kickoff', 'Public')),
    content       VARCHAR(255) NOT NULL,
    PRIMARY KEY (wid),
    UNIQUE (tupleNo),
    UNIQUE (phase, content)
);

-- Insert Weblinks data
INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Public',	'Fundraise');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Quiet',	'Event Member Registration');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Kickoff',	'Online Newsletter');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Kickoff',	'Video Promotion');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Public',	'Guest Talks');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Public',	'Guided Hike');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Kickoff',	'Slogan Image');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Kickoff',	'E-mail Inivitation');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Public',	'Support Rally');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Kickoff',	'Blog Post');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Kickoff',	'Phone Inivitiation');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Kickoff',	'Rewards Giveaway');

INSERT INTO Weblinks(wid, tupleNo, phase, content)
VALUES (DEFAULT, DEFAULT, 'Public',	'Waste Recycling');
