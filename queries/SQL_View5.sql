-- < Database Queries >
-- 5. List the campaigns' event that were taking place simultaneously either in the same city or different cities in sorted order.
-- query construct: multiple same relations using FROM clause subquery, join on, having, order by and name alias
CREATE VIEW SQL_View5 AS
  SELECT e1.name, e1.event_date, e1.start_time, e1.end_time, e1.address, e1.city
  FROM Events e1 JOIN(
      SELECT e2.event_date, e2.start_time, e2.end_time
      FROM Events e2
      GROUP BY e2.event_date, e2.start_time, e2.end_time
      HAVING COUNT(*)>1
      ) e ON e1.event_date = e.event_date AND e1.start_time = e.start_time AND e1.end_time = e.end_time
      ORDER BY e1.name;
