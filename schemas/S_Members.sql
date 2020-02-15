-- Delete the table if it exits
--DROP TABLE S_Members;

-- Create a table for S_Members
CREATE TABLE S_Members(
    s_id                INT NOT NULL REFERENCES Supporters(sid)
                            ON UPDATE CASCADE
                            ON DELETE CASCADE,
    gid                 SERIAL,
    registration_date   DATE NOT NULL,
    employment          CHAR(1) NOT NULL CHECK (employment in ('Y', 'N')),
    campaign_count      INT NOT NULL,
    operation_count     INT NOT NULL,
    annotation          VARCHAR(255),
    PRIMARY KEY (s_id, gid),
    UNIQUE (s_id),
    UNIQUE (gid)
);

-- Insert S_Members data
INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count, annotation)
VALUES ((SELECT sid FROM Supporters WHERE name='Carolina'), DEFAULT, '2016-07-01', 'Y', 7, 13, NULL);

INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count, annotation)
VALUES ((SELECT sid FROM Supporters WHERE name='Sydney'), DEFAULT, '2016-12-05', 'N', 4, 7, NULL);

INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count, annotation)
VALUES ((SELECT sid FROM Supporters WHERE name='Kody'), DEFAULT, '2017-02-01', 'N', 2, 3, NULL);

INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count, annotation)
VALUES ((SELECT sid FROM Supporters WHERE name='Miley'), DEFAULT, '2018-03-24', 'N', 1, 2, NULL);

INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count, annotation)
VALUES ((SELECT sid FROM Supporters WHERE name='Voss'), DEFAULT, '2018-05-01', 'N', 0, 4, NULL);

INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count, annotation)
VALUES ((SELECT sid FROM Supporters WHERE name='Warrin'), DEFAULT, '2019-02-15', 'N', 2, 4, NULL);

INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count, annotation)
VALUES ((SELECT sid FROM Supporters WHERE name='July'), DEFAULT, '2019-05-04', 'N', 1, 1, NULL);
