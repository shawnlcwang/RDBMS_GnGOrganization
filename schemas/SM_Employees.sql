-- Delete the table if it exits
DROP TABLE SM_Employees;

-- Create a table for SM_Employees
CREATE TABLE SM_Employees(
  s_id          INT NOT NULL REFERENCES Supporters(sid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
  g_id          INT NOT NULL REFERENCES S_Members(gid)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE,
  salary        MONEY NOT NULL,
  PRIMARY KEY (s_id, g_id),
  UNIQUE (s_id, g_id)
);

-- Insert SM_Employees data
INSERT INTO SM_Employees(s_id, g_id, salary)
VALUES ((SELECT sid FROM Supporters WHERE name='Carolina'), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name='Carolina')), 40000.00);

INSERT INTO SM_Employees(s_id, g_id, salary)
VALUES ((SELECT sid FROM Supporters WHERE name='Voss'), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name='Voss')), 30000.00);
