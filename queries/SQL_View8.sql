-- < Database Queries >
-- 8. List the newest GnG Member Volunteer's name, membership gid, campaign count and tier.
-- query construct:multiple different relations query using nested WHERE clause subquery, in operator, scalar value, aggregation and name alias
CREATE VIEW SQL_View8 AS
    SELECT s.name, sm1.gid, sm1.registration_date, sm1.campaign_count, smv.tier
    FROM Supporters s, S_Members sm1, SM_Volunteers smv
    WHERE s.sid in (
	     SELECT sm2.s_id
	     FROM S_Members sm2
	     WHERE sm2.registration_date = (
		       SELECT MAX(sm3.registration_date)
		       FROM S_Members sm3
	     )AND s.sid = sm1.s_id AND sm1.s_id = smv.s_id
    );
