-- < Database Queries >
-- 1. List all the personal information for supporters who are GnG members that lives outside of Victoria, BC.
-- query construct: single relation query using select all and pattern search
SELECT *
FROM Supporters
WHERE address not like '%Victoria, BC%'AND membership = 'Y';

-- 2. List the campaigns' name grouped by total cost that used posters as material in all their events.
-- query construct: single relation query using aggregation and group by
SELECT name, material, SUM(cost)
FROM Campaigns
WHERE material like '%Posters%'
GROUP BY name, material;

-- 3. List the cashflows' transaction tid with flow in type that were raised from all the campaigns in sorted order.
-- query construct: multiple different relations query using set operation and order by
(SELECT tid
 FROM CASHFLOWS
 WHERE flow_type = 'IN')
INTERSECT
(SELECT t_id
 FROM Cashflows_Campaigns)
 ORDER BY tid;

 -- 4. List Supporters'name, membership status with total amount greater or equal to $1000 that can be qualified as a GnG supporter benefactor.
 -- query construct: multiple different relations using FROM clause subquery, join on, having, group by, having and name alias
 SELECT sub.membership, sub.name, SUM(c.amount)
 FROM Cashflows c JOIN (
 		SELECT cs.t_id, s.name, s.membership
 		FROM Supporters s, Cashflows_Supporters cs
 		WHERE s.sid = cs.s_id
 ) sub on c.tid = sub.t_id
 GROUP BY sub.membership, sub.name, c.amount
 HAVING c.amount::NUMERIC >= 1000.00

 -- 5. List the campaigns' event that were taking place simultaneously either in the same city or different cities in sorted order.
 -- query construct: multiple same relations using FROM clause subquery, join on, having, order by and name alias
 SELECT c1.event, c1.event_date, c1.start_time, c1.end_time, c1.address, c1.city
 FROM Campaigns c1 JOIN(
 		SELECT event_date, start_time, end_time
 		FROM Campaigns
 		GROUP BY event_date, start_time, end_time
 		HAVING COUNT(*)>1
 	) c2 ON c1.event_date = c2.event_date AND c1.start_time = c2.start_time AND c1.end_time = c2.end_time
 ORDER BY event;

-- 6. List the supporters' sid, name and membership status that supported GnG operation financially but never participated in any Campaigns.
-- query construct: multiple different relations query using FROM clause subquery, not in operator, join on and name alias
SELECT DISTINCT sid, name, membership
FROM Supporters s JOIN (
		SELECT DISTINCT cs.s_id
		FROM Cashflows_Supporters cs
		WHERE cs.s_id NOT IN (
				SELECT DISTINCT csm.s_id
				FROM Campaigns_S_Members csm
			)
		) sub ON s.sid = sub.s_id;

-- 7. List all the cashflows' transaction information related to the large benefactors for GnG organization support in sorted order.
-- query construct: muliple different relations query using WHERE clause subquery, in operator, order by, select all and name alias
SELECT *
FROM Cashflows c
WHERE c.tid IN(
		SELECT cs.t_id
		FROM Cashflows_Supporters cs, Supporters s, S_Benefactors sb
		WHERE s.sid = sb.s_id AND sb.s_id= cs.s_id
)
ORDER BY tid;

-- 8. List the newest GnG Member Volunteer's name, membership gid, campaign count and tier.
-- query construct:multiple different relations query using nested WHERE clause subquery, in operator, scalar value, aggregation and name alias
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

-- 9. List the GnG Member Employee's name, membership gid, salary, benefactor class who has the highest salary and also a GnG Supporter Benefactor.
-- query construct: multiple different relations query using nested WHERE clause subquery, in operator, scalar value, aggregation and name alias
SELECT s.name, sme1.g_id, sme1.salary, sb.class
FROM Supporters s, SM_Employees sme1, S_Benefactors sb
WHERE s.sid in (
	SELECT sme2.s_id
	FROM SM_Employees sme2
	WHERE sme2.salary = (
		SELECT MAX(sme3.salary)
		FROM SM_Employees sme3
	)AND s.sid = sme1.s_id AND sme1.s_id = sb.s_id
);

-- 10. List the most campaign involved GnG Member Volunteer (NOT Employee)'s name, membership gid, campaign count, tier, the attended campaign names and events.
-- query construct:  multiple different relations query using nested FROM clause subquery with join on, scalar value, aggregation, renaming same attribute name and name alias
SELECT sub.name as "volunteer_name", sub.gid, sub.campaign_count, sub.tier, c.name as "campaign_name", c.event
FROM Campaigns c JOIN (
	SELECT s.name, sub1.gid, sub1.campaign_count, sub1.tier, sub1.c_id
	FROM Supporters s JOIN(
		SELECT sm.s_id, sm.gid, sm.campaign_count, sub2.tier, sub2.c_id
		FROM S_Members sm JOIN(
			SELECT smv.s_id, smv.g_id, smv.tier, sub3.c_id
			FROM SM_Volunteers smv JOIN (
				SELECT csm.s_id, csm.g_id, csm.c_id
				FROM Campaigns_S_Members csm
			) sub3 ON smv.s_id = sub3.s_id AND smv.g_id = sub3.g_id
		) sub2 ON sm.s_id = sub2.s_id AND sm.gid = sub2.g_id
	) sub1 ON s.sid = sub1.s_id
)sub ON c.cid = sub.c_id
WHERE sub.campaign_count = (
	SELECT MAX(sm2.campaign_count)
	FROM S_Members sm2 JOIN (
		SELECT smv2.s_id, smv2.g_id
		FROM  SM_Volunteers smv2
	) sub4 on sm2.s_id = sub4.s_id AND sm2.gid = sub4.g_id)

-- < Database Modifications >
-- 11. --Update Campaigns data and test Cascade dependency
UPDATE Campaigns
SET event_date = '2019-02-09'
WHERE cid = 1

--11. Test Campaign duration constraint between start date and end date

--12. Test Cashflows insertion constraints using balance update trigger

--13. Test Supporter Members campaign count update trigger
