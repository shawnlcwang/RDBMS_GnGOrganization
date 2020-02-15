-- Delete the table if it exits
DROP TABLE Operations_S_Members;

-- Create a table for Operations_S_Members
CREATE TABLE Operations_S_Members(
    c_id          INT NOT NULL REFERENCES Campaigns(cid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    e_id          INT NOT NULL REFERENCES Events(eid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    w_id          INT NOT NULL REFERENCES Weblinks(wid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    s_id          INT NOT NULL REFERENCES Supporters(sid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    g_id          INT NOT NULL REFERENCES S_Members(gid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
    date_time     TIMESTAMP NOT NULL,
    PRIMARY KEY (c_id, e_id, w_id, s_id, g_id)
);

-- Insert Operations_S_Members data
INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=1), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-02-01 10:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=2), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-02-01 12:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=1), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2017-02-02 08:25:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=2), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=4), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=4)), '2017-02-02 14:45:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=1), (SELECT wid FROM  Weblinks WHERE  tupleNo=3), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-02-03 09:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=2), (SELECT wid FROM  Weblinks WHERE  tupleNo=4), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-02-03 12:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=1), (SELECT wid FROM  Weblinks WHERE  tupleNo=5), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-02-06 09:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=2), (SELECT wid FROM  Weblinks WHERE  tupleNo=6), (SELECT sid FROM Supporters WHERE tupleNo=4), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=4)), '22017-02-06 11:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=1), (SELECT eid FROM  Events WHERE  tupleNo=1), (SELECT wid FROM  Weblinks WHERE  tupleNo=5), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2017-02-07 10:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=3), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-03-01 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=4), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-03-01 11:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=3), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=4), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=4)), '2017-03-01 14:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=4), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2017-03-02 12:45:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=3), (SELECT wid FROM  Weblinks WHERE  tupleNo=7), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-03-05 10:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=4), (SELECT wid FROM  Weblinks WHERE  tupleNo=7), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-03-05 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=3), (SELECT wid FROM  Weblinks WHERE  tupleNo=8), (SELECT sid FROM Supporters WHERE tupleNo=4), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=4)), '2017-03-06 15:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=4), (SELECT wid FROM  Weblinks WHERE  tupleNo=8), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2017-03-07 11:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=3), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2017-03-20 09:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=3), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=4), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=4)), '2017-03-20 11:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=2), (SELECT eid FROM  Events WHERE  tupleNo=4), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2017-03-22 14:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2018-04-01 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2018-04-01 11:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2018-04-01 14:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=5), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=5)), '2018-04-02 12:45:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=10), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2018-04-05 10:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=10), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2018-04-05 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=11), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2018-04-06 15:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=11), (SELECT sid FROM Supporters WHERE tupleNo=5), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=5)), '2018-04-07 11:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2018-04-15 09:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2018-04-15 11:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=5), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2018-04-16 10:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=3), (SELECT eid FROM  Events WHERE  tupleNo=6), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=5), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=5)), '2018-04-16 14:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2019-05-01 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2019-05-01 11:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2019-05-01 11:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-05-01 12:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-05-01 13:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-05-01 13:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2019-05-01 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=8), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=8)), '2019-05-01 14:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=8), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=8)), '2019-05-02 12:45:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=7), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-05-02 13:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=7), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-05-03 11:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=7), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-05-03 11:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=12), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2019-05-03 12:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=12), (SELECT sid FROM Supporters WHERE tupleNo=8), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=8)), '2019-05-03 13:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2019-05-03 15:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=7), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=2), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=2)), '2019-05-05 10:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2019-05-05 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=8), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=8), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=8)), '2019-05-05 13:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=12), (SELECT sid FROM Supporters WHERE tupleNo=8), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=8)), '2019-05-09 10:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=1), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=1)), '2019-05-10 13:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=4), (SELECT eid FROM  Events WHERE  tupleNo=9), (SELECT wid FROM  Weblinks WHERE  tupleNo=9), (SELECT sid FROM Supporters WHERE tupleNo=8), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=8)), '2019-05-10 15:00:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=5), (SELECT eid FROM  Events WHERE  tupleNo=10), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-06-24 09:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=5), (SELECT eid FROM  Events WHERE  tupleNo=10), (SELECT wid FROM  Weblinks WHERE  tupleNo=2), (SELECT sid FROM Supporters WHERE tupleNo=9), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=9)), '2019-06-24 10:15:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=5), (SELECT eid FROM  Events WHERE  tupleNo=10), (SELECT wid FROM  Weblinks WHERE  tupleNo=4), (SELECT sid FROM Supporters WHERE tupleNo=6), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=6)), '2019-07-01 10:30:00');

INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=5), (SELECT eid FROM  Events WHERE  tupleNo=10), (SELECT wid FROM  Weblinks WHERE  tupleNo=13), (SELECT sid FROM Supporters WHERE tupleNo=9), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=9)), '2019-07-01 14:45:00');
