-- Delete the table if it exits
DROP TABLE Cashflows;

-- Create a table for Cashflows
CREATE TABLE Cashflows(
    tid           SERIAL,
    tupleNo       SERIAL,
    flow_type     VARCHAR(3) NOT NULL CHECK (flow_type in ('IN', 'OUT')),
    amount        MONEY NOT NULL,
    association   VARCHAR(13) NOT NULL CHECK (association in ('GnG', 'Campaign')),
    balance       MONEY NOT NULL,
    PRIMARY KEY (tid),
    UNIQUE (tupleNo),
    CHECK (balance :: NUMERIC >= 0.00)
);

-- Insert Cashflows data
INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 2500.00, 'GnG', 2500.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 1000.00, 'GnG', 1500.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 350.00, 'Campaign', 1150.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 4000.00, 'GnG', 5150.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 1200.00, 'Campaign', 3950.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 200.00, 'Campaign', 4150.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 900.00, 'Campaign', 5050.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 500.00, 'GnG', 5550.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 400.00, 'Campaign', 5150.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 800.00, 'Campaign', 4350.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 1000.00, 'GnG', 3350.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 5000.00, 'GnG', 8350.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 1800.00, 'Campaign', 6550.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 1800.00, 'Campaign', 4750.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 350.00, 'Campaign', 5100.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 750.00, 'Campaign', 5850.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 300.00, 'Campaign', 6150.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 900.00, 'GnG', 7050.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 1000.00, 'GnG', 6050.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 2000.00, 'GnG', 8050.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 1500.00, 'Campaign', 6550.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 2500.00, 'Campaign', 4050.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 800.00, 'Campaign', 4850.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 2500.00, 'Campaign', 2350.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 250.00, 'Campaign', 2600.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 100.00, 'Campaign', 2700.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 500.00, 'GnG', 3200.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'OUT', 650.00, 'Campaign', 2550.00);

INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
VALUES (DEFAULT, DEFAULT, 'IN', 150.00, 'Campaign', 2700.00);
