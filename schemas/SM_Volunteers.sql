-- Delete the table if it exits
DROP TABLE SM_Volunteers;

-- Create a table for SM_Employee
CREATE TABLE SM_Volunteers(
  s_id          INT NOT NULL REFERENCES Supporters(sid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
  g_id          INT NOT NULL REFERENCES S_Members(gid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
  tier          INT NOT NULL CHECK (tier >= 1 AND tier <= 2),
  PRIMARY KEY (s_id, g_id),
  UNIQUE (s_id, g_id)
);

-- Insert SM_Volunteers data
INSERT INTO SM_Volunteers(s_id, g_id, tier)
VALUES ((SELECT sid FROM Supporters WHERE name='Sydney'), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name='Sydney')), 2);

INSERT INTO SM_Volunteers(s_id, g_id, tier)
VALUES ((SELECT sid FROM Supporters WHERE name='Kody'), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name='Kody')), 1);

INSERT INTO SM_Volunteers(s_id, g_id, tier)
VALUES ((SELECT sid FROM Supporters WHERE name='Miley'), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name='Miley')), 1);

INSERT INTO SM_Volunteers(s_id, g_id, tier)
VALUES ((SELECT sid FROM Supporters WHERE name='Warrin'), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name='Warrin')), 1);

INSERT INTO SM_Volunteers(s_id, g_id, tier)
VALUES ((SELECT sid FROM Supporters WHERE name='July'), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name='July')), 1);
