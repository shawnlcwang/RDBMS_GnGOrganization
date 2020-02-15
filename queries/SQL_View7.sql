-- < Database Queries >
-- 7. List all the cashflows' transaction information related to the large benefactors for GnG organization support in sorted order.
-- query construct: muliple different relations query using WHERE clause subquery, in operator, order by, select all and name alias
CREATE VIEW SQL_View7 AS
    SELECT *
    FROM Cashflows c
    WHERE c.tid IN(
		    SELECT cs.t_id
		    FROM Cashflows_Supporters cs, Supporters s, S_Benefactors sb
		    WHERE s.sid = sb.s_id AND sb.s_id= cs.s_id
      )
    ORDER BY tid;
