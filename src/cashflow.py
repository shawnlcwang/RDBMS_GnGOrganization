class Cashflow:
    def __init__(self, cur):
        self.list(cur)
        while True:
            try:
                num = input("Enter appropriate cashflow transaction tid if transaction already exist, otherwise enter 0: ")
                num = int(num)
                break
            except ValueError:
                print("Error: Invalid integer value. Please try again ...")
        if int(num) != 0:
            self.tid = int(num)
            self.flow_type = self.search(cur, int(num))[2]
            self.amount = self.search(cur, int(num))[3]
        elif int(num) == 0:
            self.flow_type = input("Enter cashflow type: ")
            self.amount = input("Enter cashflow amount: ")
            self.association = input("Enter cashflow association: ")
            self.balance = input("Enter cashflow balance: ")
            self.insert(cur)

    def list(self, cur):
        cur.execute("""
        SELECT *
        FROM Cashflows
        """)
        print("tid, tupleNo, flow_type, amount, association, balance")
        for row in cur.fetchall():
            print("%s, %s, %s, %s, %s, %s" % (row[0], row[1], row[2], row[3], row[4], row[5]))

    def search(self, cur, tid):
        cur.execute("""
            SELECT *
            FROM Cashflows
            WHERE tid = %(tid)s;
            """, {"tid": tid})
        row = cur.fetchone()
        return row

    def insert(self, cur):
        cur.execute("""
            INSERT INTO Cashflows(tid, tupleNo, flow_type, amount, association, balance)
            VALUES (DEFAULT, DEFAULT, %(flow_type)s, %(amount)s, %(association)s, %(balance)s);
            """, {"flow_type": self.flow_type, "amount": self.amount, "association": self.association, "balance": self.balance})