from campaign import Campaign
from event import Event
from weblink import Weblink
from supporter import Supporter
from datetime import datetime

class Operation:
    def __init__(self):
        self.c_id = 0
        self.e_id = 0
        self.w_id = 0
        self.s_id = 0
        self.g_id = 0
        self.date_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    def list_operations(self, cur):
        cur.execute("""
        SELECT *
        FROM Operations_S_Members
        """)
        for row in cur.fetchall():
            print("| c_id: %s | e_id: %s | w_id: %s | s_id: %s | g_id: %s | date_time: %s |" % (row[0], row[1], row[2], row[3], row[4], row[5]))

    def list_members(self, cur):
        cur.execute("""
        SELECT s.name, sm.gid, sm.registration_date, sm.employment, sm.campaign_count, sm.operation_count, sm.annotation
        FROM Supporters s, S_Members sm
        WHERE s.sid = sm.s_id
        """)
        for row in cur.fetchall():
            print("| name: %s | gid: %s | registration_date: %s | employment_status: %s | campaign_count: %s | operation_count: %s | annotation: %s |" % (row[0], row[1], row[2], row[3], row[4], row[5], row[6]))

    def history(self, cur):
        cur.execute("""
        SELECT s.name, c.name, e.name, w.phase, w.content
        FROM Operations_S_Members op, Campaigns c, Events e, Weblinks w, Supporters s
        WHERE op.c_id = c.cid AND
         op.e_id = e.eid AND
         op.w_id = w.wid AND
         op.s_id = s.sid
        """)
        for row in cur.fetchall():
            print("| member_name: %s | campaign_name: %s | event_name: %s | campaign_phase: %s | campaign_content: %s |" % (row[0], row[1], row[2], row[3], row[4]))

    def annotate(self, conn, cur):
        self.list_members(cur)
        gid = input("Enter gid: ")
        annotation = input("Enter annotation: ")
        cur.execute("""
        UPDATE S_Members
        SET annotation = %(annotation)s
        WHERE gid = %(gid)s;
        """, {"gid":gid, "annotation":annotation})
        conn.commit()

    def insert(self, conn, cur):
        c = Campaign(conn, cur)
        self.c_id = c.cid
        e = Event(conn, cur)
        self.e_id = e.eid
        w = Weblink(conn, cur)
        self.w_id = w.wid
        s = Supporter(conn, cur)
        self.s_id = s.sid
        self.g_id = s.gid
        cur.execute("""
        INSERT INTO Operations_S_Members(c_id, e_id, w_id, s_id, g_id, date_time)
        VALUES ((SELECT cid FROM  Campaigns WHERE  tupleNo=%(c_id)s), (SELECT eid FROM  Events WHERE  tupleNo=%(e_id)s), (SELECT wid FROM  Weblinks WHERE  tupleNo=%(w_id)s), (SELECT sid FROM Supporters WHERE tupleNo=%(s_id)s), (SELECT gid FROM S_MEMBERS WHERE s_id = (SELECT sid FROM Supporters WHERE tupleNo=%(s_id)s)), %(date_time)s);
        """, {"c_id":self.c_id, "e_id":self.e_id, "w_id":self.w_id, "s_id":self.s_id, "g_id":self.g_id, "date_time":self.date_time})
        conn.commit()

    def delete(self, conn, cur):
        print("Must enter exisiting campaign cid, event eid, weblink operation wid, supporter sid and member gid to delete.")
        self.c_id = input("Enter appropriate operation campaign cid to delete: ")
        self.e_id = input("Enter appropriate operation event eid to delete: ")
        self.w_id = input("Enter appropriate operation weblink wid to delete: ")
        self.s_id = input("Enter appropriate supporter sid to delete: ")
        self.g_id = input("Enter appropriate supporter member gid to delete: ")
        cur.execute("""
        DELETE FROM Operations_S_Members
        WHERE c_id = %(c_id)s
            AND e_id = %(e_id)s
            AND w_id = %(w_id)s
            AND s_id = %(s_id)s
            AND g_id = %(g_id)s
        """, {"c_id": self.c_id, "e_id": self.e_id, "w_id": self.w_id, "s_id": self.s_id, "g_id": self.g_id, "date_time": self.date_time})
        conn.commit()
