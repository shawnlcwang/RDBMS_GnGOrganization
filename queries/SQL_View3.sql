-- < Database Queries >
-- 3. List the cashflows' transaction tid with flow in type that were raised from all the campaign operations in sorted order.
-- query construct: multiple different relations query using set operation and order by
CREATE VIEW SQL_View3 AS
    (SELECT tid
      FROM Cashflows
      WHERE flow_type = 'IN')
    INTERSECT
    (SELECT t_id
      FROM Cashflows_Operations)
      ORDER BY tid;
