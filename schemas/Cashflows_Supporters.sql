-- Delete the table if it exits
DROP TABLE Cashflows_Supporters;

-- Create a table for Campaigns_Supporters
CREATE TABLE Cashflows_Supporters(
    t_id          INT NOT NULL REFERENCES Cashflows(tid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    s_id          INT NOT NULL REFERENCES Supporters(sid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    date_time     TIMESTAMP NOT NULL,
    PRIMARY KEY (t_id, s_id),
    UNIQUE (t_id)
);

-- Insert Cashflows_Supporters data
INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=1), (SELECT sid FROM Supporters WHERE tupleNo=1), '2016-07-31 12:00:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), '2017-01-01 09:00:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=4), (SELECT sid FROM Supporters WHERE tupleNo=3), '2017-02-25 15:00:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=8), (SELECT sid FROM Supporters WHERE tupleNo=4), '2017-03-03 12:45:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=11), (SELECT sid FROM Supporters WHERE tupleNo=1), '2018-01-01 09:00:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=12), (SELECT sid FROM Supporters WHERE tupleNo=5), '2018-04-03 09:45:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=18), (SELECT sid FROM Supporters WHERE tupleNo=6), '2018-05-01 13:30:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=19), (SELECT sid FROM Supporters WHERE tupleNo=6), '2019-01-01 09:00:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=20), (SELECT sid FROM Supporters WHERE tupleNo=7), '2019-04-30 09:30:00');

INSERT INTO Cashflows_Supporters(t_id, s_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=27), (SELECT sid FROM Supporters WHERE tupleNo=10), '2019-06-30 17:30:00');
