class mysqldb_driver:
    def connect(self):
        import MySQLdb
        from application.config import database
        self.myConn = MySQLdb.Connect(host=database.host,user=database.user,passwd=database.password,db=database.db,port=database.port)
        self.cursor = self.myConn.cursor()
        
    def execute(self,statement):
        self.connect();
        myResults = self.cursor.execute(statement)        
        self.myConn.close()
        return myResults
    