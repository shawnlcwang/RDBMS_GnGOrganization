class Supporter:
    def __init__(self, conn, cur):
        self.list(cur)
        self.next_session()
        # exception & add nonmember for operation
        while True:
            try:
                num = input("Enter appropriate supporter sid if supporter already exist, otherwise enter 0: ")
                num = int(num)
                break
            except ValueError:
                print("Error: Invalid integer value. Please try again ...")
        if int(num) != 0:
            self.sid = int(num)
            self.gid = self.search_member(cur, int(num))
            # self.name = self.search(cur, int(num))[2]
            # self.gender = self.search(cur, int(num))[3]
            # self.age = self.search(cur, int(num))[4]
            # self.address = self.search(cur, int(num))[5]
            # self.membership = self.search(cur, int(num))[6]
        elif int(num) == 0:
            self.name = input("Enter supporter name: ")
            self.gender = input("Enter supporter gender: ")
            self.age = input("Enter supporter age: ")
            self.address = input("Enter supporter address: ")
            self.membership = input("Enter supporter membership status: ")
            self.insert(conn, cur)
            self.sid = self.curr_sid(cur)
            self.gid = 0
            self.insert_cascade(conn, cur, self.sid)


    def list(self, cur):
        cur.execute("""
        SELECT *
        FROM Supporters
        """)
        for row in cur.fetchall():
            print("| sid: %s | tupleNo: %s | name: %s | gender: %s | age: %s | address: %s | membership: %s |" % (row[0], row[1], row[2], row[3], row[4], row[5], row[6]))

    def next_session(self):
        print("----------------------------------------------------------------------------------------")

    def search_member(self, cur, sid):
        cur.execute("""
            SELECT gid
            FROM S_Members
            WHERE s_id = %(sid)s;
            """, {"sid": sid})
        gid = cur.fetchone()
        self.gid = gid[0]
        return self.gid

    def insert(self, conn, cur):
        cur.execute("""
            INSERT INTO Supporters(sid, tupleNo, name, gender, age, address, membership)
            VALUES (DEFAULT, DEFAULT, %(name)s, %(gender)s, %(age)s, %(address)s, %(membership)s);
            """, {"name": self.name, "gender": self.gender, "age": self.age, "address": self.address, "membership": self.membership})
        conn.commit()

    def delete(self, cur):
        return

    def update(self, cur):
        return

    def curr_sid(self, cur):
        cur.execute("""
            SELECT MAX(sid)
            FROM Supporters
            """)
        sid = cur.fetchone()
        self.sid = sid[0]
        return self.sid

    def insert_cascade(self, conn, cur, sid):
        if self.membership is 'Y':
            g = Member(conn, cur, sid)
            self.gid = g.gid


# class Benefactor(Supporter):
#     def __init__(self, cur, sid, name, gender, age, address, membership):
#         self.list(cur)
#         num = input("Enter appropriate benefactor sid if benefactor already exist, otherwise enter 0: ")
#         if int(num) != 0:
#             Supporter.__init__(sid, name, gender, age, address, membership)
#             self.s_id = Supporter.sid
#             self.level = self.search(cur, int(num))[1]
#         elif int(num) == 0:
#             Supporter.__init__(sid, name, gender, age, address, membership)
#             self.s_id = Supporter.sid
#             self.level  = input("Enter benefactor class level: ")
#             self.insert(cur)
#
#     def list(self, cur):
#         cur.execute("""
#         SELECT *
#         FROM S_Benefactor
#         """)
#         print("s_id, level")
#         for row in cur.fetchall():
#             print("%s, %s" % (row[0], row[1]))
#
#     def search(self, cur, s_id):
#         cur.execute("""
#             SELECT *
#             FROM Supporters
#             WHERE s_id = %(s_id)s;
#             """, {"s_id": s_id})
#         row = cur.fetchone()
#         return row
#

class Member(Supporter):
    def __init__(self, conn, cur, sid):
        #super().__init__(conn, cur)
        # self.list(cur)
        # num = input("Enter appropriate member gid if member already exist, otherwise enter 0: ")
        if self.search(cur, sid) != 0:
            #super().__init__(sid, name, gender, age, address, membership)
            self.update(cur)
            # self.s_id = Supporter.sid
            # self.gid
            # self.employment = self.search(cur, int(num))[3]
            # self.cp_count = self.search(cur, int(num))[4]
            # self.op_count = self.search(cur, int(num))[5]
        elif self.search(cur, sid) == 0:
            self.s_id = sid
            self.register_date  = input("Enter member registration date: ")
            self.employment = input("Enter member employment status: ")
            self.cp_count = input("Enter member campaign count: ")
            self.op_count = input("Enter member operation count: ")
            self.insert(conn, cur)
            self.gid = self.curr_gid(cur)


    def list(self, cur):
        cur.execute("""
        SELECT *
        FROM S_Members
        """)
        for row in cur.fetchall():
            print("|s_id: %s | gid: %s | registration_date: %s | employment_status: %s | campaign_count: %s | operation_count: %s |" % (row[0], row[1], row[2], row[3], row[4], row[5]))

    def search(self, cur, sid):
        cur.execute("""
            SELECT gid
            FROM S_Members
            WHERE s_id = %(sid)s;
            """, {"sid": sid})
        gid = cur.fetchone()
        if gid is None:
            return 0
        else:
            return gid[0]

    def insert(self, conn, cur):
        cur.execute("""
            INSERT INTO S_Members(s_id, gid, registration_date, employment, campaign_count, operation_count)
            VALUES (%(sid)s, DEFAULT, %(register_date)s, %(employment)s, %(cp_count)s, %(op_count)s);
            """, {"sid": self.s_id, "register_date": self.register_date, "employment": self.employment, "cp_count": self.cp_count, "op_count": self.op_count})
        conn.commit()

    def update(self, cur):
        return

    def curr_gid(self, cur):
        cur.execute("""
            SELECT MAX(gid)
            FROM S_Members
            """)
        gid = cur.fetchone()
        self.gid = gid[0]
        return self.gid

    # def insert_cascade(self, cur, gid):
    #     if self.employment is 'Y':
    #         Employee(cur, gid)
    #     elif self.employment is 'N':
    #         Volunteer(cur, gid)

# class Employee(Member):
#     def __init__(self, cur, s_id, gid, registration_date, employment, campaign_count, operation_count):
#         # self.list(cur)
#         # num = input("Enter appropriate employee member gid if employee already exist, otherwise enter 0: ")
#         if self.search(cur, gid) != 0:
#             Member.__init__(s_id, gid, registration_date, employment, campaign_count, operation_count)
#             self.update(cur)
#             # self.s_id = Member.s_id
#             # self.g_id = Member.gid
#             # self.salary = self.search(cur, Member.gid)[2]
#         elif self.search(cur, gid) == 0:
#             Member.__init__(s_id, gid, registration_date, employment, campaign_count, operation_count)
#             self.s_id = 0
#             self.g_id = 0
#             self.salary  = input("Enter employee member salary: ")
#             self.insert(cur)
#
#     def list(self, cur):
#         cur.execute("""
#         SELECT *
#         FROM SM_Employees
#         """)
#         print("s_id, g_id, salary")
#         for row in cur.fetchall():
#             print("%s, %s, %s" % (row[0], row[1], row[2]))
#
#     def search(self, cur, gid):
#         cur.execute("""
#             SELECT g_id
#             FROM SM_Employees
#             WHERE g_id = %(gid)s;
#             """, {"gid": gid})
#         gid = cur.fetchone()
#         if gid[0] is None:
#             return 0
#         else:
#             return gid[0]
#
#     def insert(self, cur):
#         cur.execute("""
#             INSERT INTO SM_Employees(s_id, g_id, salary)
#             VALUES ((SELECT sid FROM Supporters WHERE name=%(name1)s)), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name=%(name2)s)), %(salary)s);
#             """, {"name1": Supporter.name, "name2": Supporter.name, "salary": self.salary})
#
#     def update(self, cur):
#         return
#
#     class Volunteer(Member):
#         def __init__(self, cur, s_id, gid, registration_date, employment, campaign_count, operation_count):
#             # self.list(cur)
#             # num = input("Enter appropriate volunteer member gid if volunteer already exist, otherwise enter 0: ")
#             if self.search(cur, gid) != 0:
#                 Member.__init__(s_id, gid, registration_date, employment, campaign_count, operation_count)
#                 self.update(cur)
#                 # self.s_id = Member.s_id
#                 # self.g_id = Member.gid
#                 # self.tier = self.search(cur, Member.gid)[2]
#             if self.search(cur, gid) == 0:
#                 Member.__init__(s_id, gid, registration_date, employment, campaign_count, operation_count)
#                 self.s_id = 0
#                 self.g_id = 0
#                 self.tierS = input("Enter volunteer member tier: ")
#                 self.insert(cur)
#
#         def list(self, cur):
#             cur.execute("""
#             SELECT *
#             FROM SM_Volunteers
#             """)
#             print("s_id, g_id, tier")
#             for row in cur.fetchall():
#                 print("%s, %s, %s" % (row[0], row[1], row[2]))
#
#         def search(self, cur, gid):
#             cur.execute("""
#                 SELECT g_id
#                 FROM SM_Volunteers
#                 WHERE g_id = %(gid)s;
#                 """, {"gid": gid})
#             gid = cur.fetchone()
#             if gid[0] is None:
#                 return 0
#             else:
#                 return gid[0]
#
#         def insert(self, cur):
#             cur.execute("""
#                 INSERT INTO SM_Employees(s_id, g_id, tier)
#                 VALUES ((SELECT sid FROM Supporters WHERE name=%(name1)s)), (SELECT gid FROM S_Members WHERE s_id=(SELECT sid FROM Supporters WHERE name=%(name2)s)), %(tier)s);
#                 """, {"name1": Supporter.name, "name2": Supporter.name, "tier": self.tier})
#
#         def update(self, cur):
#             return