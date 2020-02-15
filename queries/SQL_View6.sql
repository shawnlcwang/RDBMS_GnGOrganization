-- < Database Queries >
-- 6. List the supporters' sid, name and membership status that supported GnG operation financially but never participated in any Campaigns.
-- query construct: multiple different relations query using FROM clause subquery, not in operator, join on and name alias
CREATE VIEW SQL_View6 AS
    SELECT DISTINCT sid, name, membership
    FROM Supporters s JOIN (
		      SELECT DISTINCT cs.s_id
		      FROM Cashflows_Supporters cs
		      WHERE cs.s_id NOT IN (
            SELECT DISTINCT csm.s_id
            FROM Operations_S_Members csm
			    )
		) sub ON s.sid = sub.s_id;
