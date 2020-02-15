-- < Database Queries >
-- 10. List the campaign operations' name, event, phase, content that involved only with GnG Member Volunteers with tier ranking (NOT Employees).
-- query construct:  multiple different relations query using nested FROM clause subquery with join on, scalar value, aggregation, renaming same attribute name and name alias
CREATE VIEW SQL_View10 AS
  SELECT c.name, e.name, w.phase, w.content, s.name, smv.tier
  FROM Campaigns c, Events e, Weblinks w, Supporters s, SM_Volunteers smv, Operations_S_Members osm
  WHERE c.cid = osm.c_id
    AND e.eid = osm.e_id
    AND w.wid = osm.w_id
    AND s.sid = osm.s_id
    AND smv.g_id = osm.g_id
