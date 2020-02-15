-- < Database Queries >
-- 1. List all the personal information for supporters who are GnG members that lives outside of Victoria, BC.
-- query construct: single relation query using select all and pattern search
CREATE VIEW SQL_View1 AS
    SELECT *
    FROM Supporters
    WHERE address not like '%Victoria, BC%'AND membership = 'Y';
