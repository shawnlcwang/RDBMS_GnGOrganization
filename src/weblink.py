class Weblink:
    def __init__(self, conn, cur):
        self.list(cur)
        self.next_session()
        # exception
        while True:
            try:
                num = input("Enter appropriate weblink wid if weblink operation already exist, otherwise enter 0: ")
                num = int(num)
                break
            except ValueError:
                print("Error: Invalid integer value. Please try again ...")
        if int(num) != 0:
            self.wid = int(num)
        elif int(num) == 0:
            self.phase = input("Enter campaign phase: ")
            self.content = input("Enter campaign phase content: ")
            self.insert(conn, cur)
            self.wid = self.curr_wid(cur)


    def list(self, cur):
        cur.execute("""
        SELECT *
        FROM Weblinks
        """)
        for row in cur.fetchall():
            print("| wid: %s | tupleNo: %s | phase: %s | content: %s |" % (row[0], row[1], row[2], row[3]))

    def next_session(self):
        print("----------------------------------------------------------------------------------------")

    def search(self, cur, wid):
        cur.execute("""
            SELECT *
            FROM Weblinks
            WHERE wid = %(wid)s ;
            """, {"wid": wid})
        row = cur.fetchone()
        return row

    def curr_wid(self, cur):
        cur.execute("""
            SELECT MAX(wid)
            FROM Weblinks
            """)
        wid = cur.fetchone()
        self.wid = wid[0]
        return self.wid

    def insert(self, conn, cur):
        cur.execute("""
            INSERT INTO Weblinks(wid, tupleNo, phase, content)
            VALUES (DEFAULT, DEFAULT, %(phase)s, %(content)s);
            """, {"phase":self.phase, "content":self.content})
        conn.commit()
