class Event:
    def __init__(self, conn, cur):
        self.list(cur)
        self.next_session()
        # exception
        while True:
            try:
                num = input("Enter appropriate event eid if event already exist, otherwise enter 0: ")
                num = int(num)
                break
            except ValueError:
                print("Error: Invalid integer value. Please try again ...")
        if int(num) != 0:
            self.eid = int(num)
        elif int(num) == 0:
            self.name = input("Enter event name: ")
            self.event_date = input("Enter event date: ")
            self.start_time = input("Enter event start time: ")
            self.end_time = input("Enter event end time: ")
            self.address = input("Enter event address: ")
            self.city = input("Enter event city: ")
            self.region = input("Enter event region: ")
            self.material = input("Enter event materials: ")
            self.cost = input("Enter event cost: ")
            self.insert(conn, cur)
            self.eid = self.curr_eid(cur)

    def list(self, cur):
        cur.execute("""
        SELECT *
        FROM Events
        """)
        for row in cur.fetchall():
            print("| eid: %s | tupleNo: %s | name: %s | event_date: %s | start_time: %s | end_time: %s | address: %s | city: %s | region: %s | material: %s | cost: %s |" % (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10]))

    def next_session(self):
        print("----------------------------------------------------------------------------------------")

    def search(self, cur, eid):
        cur.execute("""
            SELECT name
            FROM Events
            WHERE eid = %(eid)s;
            """, {"eid": eid})
        name = cur.fetchone()
        return name[0]

    def curr_eid(self, cur):
        cur.execute("""
            SELECT MAX(eid)
            FROM Events
            """)
        eid = cur.fetchone()
        self.eid = eid[0]
        return self.eid

    def insert(self, conn, cur):
        cur.execute("""
            INSERT INTO Events(eid, tupleNo, name, event_date, start_time, end_time, address, city, region, material, cost)
            VALUES (DEFAULT, DEFAULT,  %(name)s, %(event_date)s, %(start_time)s, %(end_time)s, %(address)s, %(city)s, %(region)s, %(material)s, %(cost)s);
            """, {"name":self.name, "event_date":self.event_date, "start_time":self.start_time, "end_time":self.end_time, "address":self.address, "city":self.city, "region":self.region, "material":self.material, "cost":self.cost})
        conn.commit()