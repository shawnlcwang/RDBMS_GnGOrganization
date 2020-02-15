-- Delete the table if it exits
DROP TABLE Cashflows_Operations;

-- Create a table for Campaigns_Cashflows
CREATE TABLE Cashflows_Operations(
    t_id          INT NOT NULL REFERENCES Cashflows(tid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    c_id          INT NOT NULL REFERENCES Campaigns(cid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    e_id          INT NOT NULL REFERENCES Events(eid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    w_id          INT NOT NULL REFERENCES Weblinks(wid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    date_time     TIMESTAMP NOT NULL,
    PRIMARY KEY (t_id, c_id, e_id, w_id),
    UNIQUE (t_id)
);

-- Insert Cashflows_Operations data
INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=3), (SELECT cid FROM Campaigns WHERE tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=1), (SELECT wid FROM  Weblinks WHERE  tupleNo=5), '2017-02-07 09:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=5), (SELECT cid FROM Campaigns WHERE tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=2), (SELECT wid FROM  Weblinks WHERE  tupleNo=6), '2017-02-07 11:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=6), (SELECT cid FROM Campaigns WHERE tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=1), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2017-02-09 12:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=7), (SELECT cid FROM Campaigns WHERE tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=2), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2017-02-09 15:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=9), (SELECT cid FROM Campaigns WHERE tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=3), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), '2017-03-21 09:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=10), (SELECT cid FROM Campaigns WHERE tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=4), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), '2017-03-23 14:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=13), (SELECT cid FROM Campaigns WHERE tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), '2018-04-16 9:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=14), (SELECT cid FROM Campaigns WHERE tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), '2018-04-16 11:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=15), (SELECT cid FROM Campaigns WHERE tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2018-04-21 12:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=16), (SELECT cid FROM Campaigns WHERE tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2018-04-22 10:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=17), (SELECT cid FROM Campaigns WHERE tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2018-04-22 15:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=21), (SELECT cid FROM Campaigns WHERE tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), '2019-05-06 10:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=22), (SELECT cid FROM Campaigns WHERE tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), '2019-05-06 13:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=23), (SELECT cid FROM Campaigns WHERE tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2019-05-08 10:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=24), (SELECT cid FROM Campaigns WHERE tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), '2019-05-11 13:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=25), (SELECT cid FROM Campaigns WHERE tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2019-05-12 16:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=26), (SELECT cid FROM Campaigns WHERE tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2019-05-12 17:00:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=28), (SELECT cid FROM Campaigns WHERE tupleNo=5), (SELECT eid FROM  Events WHERE  tupleNo=10), (SELECT wid FROM  Weblinks WHERE  tupleNo=13), '2019-07-02 14:45:00');

INSERT INTO Cashflows_Operations(t_id, c_id, e_id, w_id, date_time)
VALUES ((SELECT tid FROM Cashflows WHERE  tupleNo=29), (SELECT cid FROM Campaigns WHERE tupleNo=5), (SELECT eid FROM  Events WHERE  tupleNo=10), (SELECT wid FROM  Weblinks WHERE  tupleNo=1), '2019-07-03 13:30:00');
