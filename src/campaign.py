class Campaign:
    def __init__(self, conn, cur):
        self.list(cur)
        self.next_session()
        # exception
        while True:
            try:
                num = input("Enter appropriate campaign cid if campaign already exist, otherwise enter 0: ")
                num = int(num)
                break
            except ValueError:
                print("Error: Invalid integer value. Please try again ...")
        if int(num) != 0:
            self.cid = int(num)
        elif int(num) == 0:
            self.name = input("Enter campaign name: ")
            self.start_date = input("Enter campaign start date: ")
            self.end_date = input("Enter campaign end date: ")
            self.insert(conn, cur)
            self.cid = self.curr_cid(cur)

    def list(self, cur):
        cur.execute("""
        SELECT *
        FROM Campaigns
        """)
        for row in cur.fetchall():
            print("| cid: %s | tupleNo: %s | name: %s | start_date: %s | end_date: %s |" % (row[0], row[1], row[2], row[3], row[4]))

    def next_session(self):
        print("----------------------------------------------------------------------------------------")

    def search(self, cur, cid):
        cur.execute("""
            SELECT name
            FROM Campaigns
            WHERE cid = %(cid)s;
            """, {"cid": cid})
        name = cur.fetchone()
        print (name)
        return name[0]

    def curr_cid(self, cur):
        cur.execute("""
            SELECT MAX(cid)
            FROM Campaigns
            """)
        cid = cur.fetchone()
        self.cid = cid[0]
        return self.cid

    def insert(self, conn, cur):
        cur.execute("""
            INSERT INTO Campaigns(cid, tupleNo, name, start_date, end_date)
            VALUES (DEFAULT, DEFAULT, %(name)s,	%(start_date)s, %(end_date)s);
            """, {"name":self.name, "start_date":self.start_date, "end_date":self.end_date})
        conn.commit()