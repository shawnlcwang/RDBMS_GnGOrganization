-- Delete the table if it exits
DROP TABLE S_Benefactors;

-- Create a table for S_Benefactors
CREATE TABLE S_Benefactors(
  s_id          INT NOT NULL REFERENCES Supporters(sid)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE,
  level         CHAR(1) NOT NULL CHECK (level in ('A', 'B')),
  PRIMARY KEY (s_id),
  UNIQUE (s_id)
);

-- Insert S_Benefactors data
INSERT INTO S_Benefactors(s_id, level)
VALUES ((SELECT sid FROM Supporters WHERE name='Carolina'), 'A');

INSERT INTO S_Benefactors(s_id, level)
VALUES ((SELECT sid FROM Supporters WHERE name='Tasma'), 'B');

INSERT INTO S_Benefactors(s_id, level)
VALUES ((SELECT sid FROM Supporters WHERE name='Miley'), 'A');

INSERT INTO S_Benefactors(s_id, level)
VALUES ((SELECT sid FROM Supporters WHERE name='Booker'), 'B');
