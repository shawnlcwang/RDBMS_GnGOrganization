-- < Database Queries >
-- 4. List each supporter cashflow transaction's supporter name, membership status with total amount greater or equal to $1000 that can be qualified as a GnG supporter benefactor.
-- query construct: multiple different relations using FROM clause subquery, join on, having, group by, having and name alias
CREATE VIEW SQL_View4 AS
    SELECT sub.membership, sub.name, SUM(c.amount)
    FROM Cashflows c JOIN (
        SELECT cs.t_id, s.name, s.membership
        FROM Supporters s, Cashflows_Supporters cs
        WHERE s.sid = cs.s_id
    ) sub on c.tid = sub.t_id
    GROUP BY sub.name, sub.membership, c.amount
    HAVING c.amount::NUMERIC >= 1000.00;
