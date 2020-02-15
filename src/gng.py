import psycopg2
# from sshtunnel import SSHTunnelForwarder
from operation import Operation
from accounting import Accounting

def exit():
    return 0

def query1(cur, i):
    print("Query 1: List all the personal information for supporters who are GnG members that lives outside of Victoria, BC.")
    print("""
    CREATE VIEW SQL_View%s AS
        SELECT *
        FROM Supporters
        WHERE address not like '%%Victoria, BC%%'AND membership = 'Y';
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s, %s, %s, %s" % (row[0], row[1], row[2], row[3], row[4], row[5]))
    return 1

def query2(cur, i):
    print("Query 2:  List the events' name grouped by total cost that used posters as material.")
    print("""
    CREATE VIEW SQL_View%s AS
        SELECT name, material, SUM(cost)
        FROM Events
        WHERE material like '%%Posters%%'
        GROUP BY name, material;
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s" % (row[0], row[1], row[2]))
    return 1

def query3(cur, i):
    print("Query 3: List the cashflows' transaction tid with flow in type that were raised from all the campaigns in sorted order.")
    print("""
    CREATE VIEW SQL_View%s AS
        (SELECT tid
          FROM Cashflows
          WHERE flow_type = 'IN')
        INTERSECT
        (SELECT t_id
          FROM Cashflows_Operations)
          ORDER BY tid;
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s" % (row[0]))
    return 1

def query4(cur, i):
    print("Query 4: List each supporter cashflow transaction's supporter name, membership status with total amount greater or equal to $1000 that can be qualified as a GnG supporter benefactor.")
    print("""
    CREATE VIEW SQL_View%s AS
        SELECT sub.membership, sub.name, SUM(c.amount)
        FROM Cashflows c JOIN (
            SELECT cs.t_id, s.name, s.membership
            FROM Supporters s, Cashflows_Supporters cs
            WHERE s.sid = cs.s_id
        ) sub on c.tid = sub.t_id
        GROUP BY sub.name, sub.membership, c.amount
        HAVING c.amount::NUMERIC >= 1000.00;
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s" % (row[0], row[1], row[2]))
    return 1

def query5(cur, i):
    print("Query 5: List the campaigns' event that were taking place simultaneously either in the same city or different cities in sorted order.")
    print("""
    CREATE VIEW SQL_View%s AS
        SELECT e1.name, e1.event_date, e1.start_time, e1.end_time, e1.address, e1.city
        FROM Events e1 JOIN(
          SELECT e2.event_date, e2.start_time, e2.end_time
          FROM Events e2
          GROUP BY e2.event_date, e2.start_time, e2.end_time
          HAVING COUNT(*)>1
          ) e ON e1.event_date = e.event_date AND e1.start_time = e.start_time AND e1.end_time = e.end_time
          ORDER BY e1.name;
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s, %s, %s, %s" % (row[0], row[1], row[2], row[3], row[4], row[5]))
    return 1

def query6(cur, i):
    print("Query 6: List the supporters' sid, name and membership status that supported GnG operation financially but never participated in any Campaigns.")
    print("""
    CREATE VIEW SQL_View%s AS
        SELECT DISTINCT sid, name, membership
        FROM Supporters s JOIN (
                  SELECT DISTINCT cs.s_id
                  FROM Cashflows_Supporters cs
                  WHERE cs.s_id NOT IN (
                        SELECT DISTINCT csm.s_id
                        FROM Operations_S_Members csm
                        )
        ) sub ON s.sid = sub.s_id;
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s" % (row[0], row[1], row[2]))
    return 1

def query7(cur, i):
    print("Query 7: List all the cashflows' transaction information related to the large benefactors for GnG organization support in sorted order.")
    print("""
    CREATE VIEW SQL_View%s AS
        SELECT *
        FROM Cashflows c
        WHERE c.tid IN(
                SELECT cs.t_id
                FROM Cashflows_Supporters cs, Supporters s, S_Benefactors sb
                WHERE s.sid = sb.s_id AND sb.s_id= cs.s_id
          )
        ORDER BY tid;
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s, %s, %s, %s" % (row[0], row[1], row[2], row[3], row[4], row[5]))
    return 1

def query8(cur, i):
    print("Query 8: List the newest GnG Member Volunteer's name, membership gid, campaign count and tier.")
    print("""
    CREATE VIEW SQL_View%s AS
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
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s, %s, %s" % (row[0], row[1], row[2], row[3], row[4]))
    return 1

def query9(cur, i):
    print("Query 9: List the GnG Member Employee's name, membership gid, salary, benefactor class level who has the highest salary and also a GnG Supporter Benefactor.")
    print("""
    CREATE VIEW SQL_View%s AS
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
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s, %s" % (row[0], row[1], row[2], row[3]))
    return 1

def query10(cur, i):
    print("Query 10: List the campaign operations' name, event, phase, content that involved only with GnG Member Volunteers with tier ranking (NOT Employees).")
    print("""
    CREATE VIEW SQL_View%s AS
        SELECT c.name as campaign_name, e.name as event_name, w.phase, w.content, s.name as volunteer_name, smv.tier
        FROM Campaigns c, Events e, Weblinks w, Supporters s, SM_Volunteers smv, Operations_S_Members osm
        WHERE c.cid = osm.c_id
            AND e.eid = osm.e_id
            AND w.wid = osm.w_id
            AND s.sid = osm.s_id
            AND smv.g_id = osm.g_id
    """ % i)
    print("Result:")
    cur.execute("""
    SELECT *
    FROM sql_view%(num)s
    """, {"num":int(i)})
    for row in cur.fetchall():
        print ("%s, %s, %s, %s, %s, %s" % (row[0], row[1], row[2], row[3], row[4], row[5]))
    return 1

def sql_views(cur):
    num = input("Enter SQL view number between 1 - 10: ")
    if int(num) == 1:
        query1(cur, int(num))
    elif int(num) == 2:
        query2(cur, int(num))
    elif int(num) == 3:
        query3(cur, int(num))
    elif int(num) == 4:
        query4(cur, int(num))
    elif int(num) == 5:
        query5(cur, int(num))
    elif int(num) == 6:
        query6(cur, int(num))
    elif int(num) == 7:
        query7(cur, int(num))
    elif int(num) == 8:
        query8(cur, int(num))
    elif int(num) == 9:
        query9(cur, int(num))
    elif int(num) == 10:
        query10(cur, int(num))
    else:
        print ("ERROR: Invalid option number")
        sql_views(cur)

def setup_campaign(conn, cur):
    print("Setup campaign phase >")
    op = Operation()
    op.insert(conn,cur)
    op.list_operations(cur)
    print("Campaign setup inserted")
    return 1

def cashflow_report(conn, cur):
    option = input("Cashflow report phase > \nEnter 1.CAMPAIGN / 2.SUPPORTER option number: ")
    if int(option) is 1:
        op = Accounting()
        op.op_list(cur)
        print("\nCampaign cashflow bar chart: ")
        op.op_graph(cur)

    elif int(option) is 2:
        sp = Accounting()
        sp.sp_list(cur)
        print("\nSupporter cashflow bar chart: ")
        sp.sp_graph(cur)
    return 1

def membership_history(conn, cur):
    option = input("Membership history phase > \nEnter 1.HISTORY / 2.ANNOTATION option number: ")
    if int(option) is 1:
        op = Operation()
        op.history(cur)

    elif int(option) is 2:
        op = Operation()
        op.annotate(conn, cur)
        op.list_members(cur)
        print("Member annotation inserted")
    return 1

def delete_campaigns(conn, cur):
    print("Delete campaign phase >")
    op = Operation()
    op.list_operations(cur)
    next_session()
    op.delete(conn,cur)
    op.list_operations(cur)
    print("Campaign operation deleted")

def next_session():
    print("----------------------------------------------------------------------------------------")

def employee_verify(cur):
    print("Please enter your sid and gid to verify your GnG employee status")
    sid = input("Enter sid: ")
    gid = input("Enter gid: ")
    print ("\nEmployee Verification: ")
    cur.execute("""
    SELECT name, gender, age
    FROM Supporters s
    WHERE sid IN (
        SELECT s_id
        FROM SM_Employees sme)
        AND s.sid = %(sid)s
    """, {"sid":sid})
    for row in cur.fetchall():
        print ("%s, %s, %s" % (row[0], row[1], row[2]))
    next_session()

def db_functions(conn, cur, i):
    options = {
        0 : lambda: exit(),
        1 : lambda: sql_views(cur),
        2 : lambda: setup_campaign(conn, cur),
        3 : lambda: cashflow_report(conn, cur),
        4 : lambda: membership_history(conn, cur),
        5 : lambda: delete_campaigns(conn, cur)
    }
    func = options.get(i, lambda: "Invalid option number")
    return func()

def user_interface(conn, cur):
    print("-----------------------------Welcome to GnG database portal-----------------------------")
    print("| phase 1 : query SQL views                                                            |")
    print("| phase 2 : setup campaigns                                                            |")
    print("| phase 3 : accounting report                                                          |")
    print("| phase 4 : membership history                                                         |")
    print("| phase 5 : delete campaigns                                                           |")
    print("| phase 0 : exit system                                                                |")
    print("----------------------------------------------------------------------------------------")
    #employee_verify(cur)
    while True:
        args = input("Enter phase #: ")
        if db_functions(conn, cur, int(args)) == 0:
            break
        next_session()

def main():
    # Connect to SSH tunnel
    # server = SSHTunnelForwarder(
    #     ("linux.csc.uvic.ca", 22),
    #     ssh_username="shawnlcwang",
    #     ssh_password="Happiness17",
    #     remote_bind_address=("studsql.csc.uvic.ca", 5432),
    #     local_bind_address=("localhost", 1011)
    # )
    # server.start()
    # print("GnG Server connected\n")

    # Connect to database
    dbconn = psycopg2.connect(
        database = "nelson",
        # port = server.local_bind_port,
        user = "nelson",
        password = "S7}'y\"Z{$K"
    )
    print("GnG Database connected\n")

    # Create database cursor
    cur = dbconn.cursor()

    # Initialize GnG user interface
    user_interface(dbconn, cur)

    # Close database connection
    cur.close()
    dbconn.close()
    print("GnG database portal exited\n")

if __name__ == "__main__": main()
