from datetime import datetime

class Accounting:
    def __init__(self):
        self.t_id = 0
        self.c_id = 0
        self.e_id = 0
        self.w_id = 0
        self.s_id = 0
        self.date_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    def op_list(self, cur):
        cur.execute("""
        SELECT t.tid, t.flow_type, t.amount, t.association, c.name,  e.name, w.phase, w.content
        FROM Cashflows_Operations op, Cashflows t, Campaigns c, Events e, Weblinks w
        WHERE op.t_id = t.tid AND
         op.c_id = c.cid AND
         op.e_id = e.eid AND
         op.w_id = w.wid
        """)
        for row in cur.fetchall():
            print("| t_id: %s |  flow_type: %s | amount: %s | association: %s | campaign_name: %s | event_name: %s | campaign_phase: %s | campaign_content: %s |"% (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))

    def sp_list(self, cur):
        cur.execute("""
        SELECT t.tid, t.flow_type, t.amount, t.association, s.name, s.gender, s.age, s.membership
        FROM Cashflows_Supporters sp, Cashflows t, Supporters s
        WHERE sp.t_id = t.tid AND
         sp.s_id = s.sid
        """)
        for row in cur.fetchall():
            print("| t_id: %s | flow_type: %s | amount: %s | association: %s | supporter_name: %s | gender: %s | age: %s | membership: %s |"% (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]))

    def op_graph(self, cur):
        cur.execute("""
        SELECT amount
        FROM Cashflows
        WHERE association = 'Campaign'
        """)
        amount = cur.fetchall()
        increment = 100
        for (i,) in amount:
            i = i.replace(",", "").replace("$", "")
            count = float(i)/increment
            while count > 0:
                print('[]', )
                count -= 1
            print(i)

    def sp_graph(self, cur):
        cur.execute("""
        SELECT amount
        FROM Cashflows
        WHERE association = 'GnG'
        """)
        amount = cur.fetchall()
        increment = 100
        for (i,) in amount:
            i = i.replace(",", "").replace("$", "")
            count = float(i)/increment
            while count > 0:
                print('[]', )
                count -= 1
            print(i)