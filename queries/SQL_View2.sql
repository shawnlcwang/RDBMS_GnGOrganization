-- < Database Queries >
-- 2. List the events' name grouped by total cost that used posters as material in all their events.
-- query construct: single relation query using aggregation and group by
CREATE VIEW SQL_View2 AS
    SELECT name, material, SUM(cost)
    FROM Events
    WHERE material like '%Posters%'
    GROUP BY name, material;
