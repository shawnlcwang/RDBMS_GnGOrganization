-- Delete the table if it exits
 DROP TABLE Supporters;

-- Create a table for Supporters
CREATE TABLE Supporters(
    sid           SERIAL,
    tupleNo       SERIAL,
    name          VARCHAR(255) NOT NULL,
    gender        CHAR(1) NOT NULL CHECK (gender in ('M', 'F')),
    age           INT NOT NULL,
    address       VARCHAR(255),
    membership    CHAR(1) NOT NULL CHECK (membership in ('Y', 'N')),
    PRIMARY KEY (sid),
    UNIQUE (tupleNo)
);

-- Insert Supporters data
INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Carolina', 'F', 57, '3114 Irma St, Victoria, BC V9A 1S8', 'Y');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Sydney', 'F', 29, '611 Roseridge Pl, Victoria, BC V8Z 2Z1', 'Y');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Tasma', 'F', 38, '730 Daffodil Ave, Victoria, BC V8Z 2S7', 'N');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Kody', 'M', 33, '55 Hickory St E, Waterloo, ON N2J 3J5', 'Y');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Miley', 'F', 41, '928 Easter Rd, Victoria, BC V8X 2Z8', 'Y');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Voss', 'M', 53, '947 Easter Rd, Victoria, BC V8X 2Z9', 'Y');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Booker', 'M', 48, '10928 136 Ave Nw, Edmonton, AB T5E 1W7', 'N');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Warrin', 'M', 26, '620 Judah St, Victoria, BC V8Z 2K2', 'Y');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'July', 'F', 18, '3997 Century Rd, Victoria, BC V8P 3M1', 'Y');

INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
VALUES (DEFAULT, DEFAULT, 'Austin', 'M', 22, '4300 Stoneywood Lane, Victoria, BC V8X 5A5', 'N');
