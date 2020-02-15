-- < Database Queries >
-- 9. List the GnG Member Employee's name, membership gid, salary, benefactor class level who has the highest salary and also a GnG Supporter Benefactor.
-- query construct: multiple different relations query using nested WHERE clause subquery, in operator, scalar value, aggregation and name alias
CREATE VIEW SQL_View9 AS
    SELECT s.name, sme1.g_id, sme1.salary, sb.level
    FROM Supporters s, SM_Employees sme1, S_Benefactors sb
    WHERE s.sid in (
	     SELECT sme2.s_id
	     FROM SM_Employees sme2
	     WHERE sme2.salary = (
		       SELECT MAX(sme3.salary)
		       FROM SM_Employees sme3
	     )AND s.sid = sme1.s_id AND sme1.s_id = sb.s_id
    );
