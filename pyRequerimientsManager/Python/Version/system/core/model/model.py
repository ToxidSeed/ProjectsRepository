class model:
    def query(self,statement):
        from application.config import database
        if database.driver == "MySQLdb":
            import system.mysql.drivers.mysqldb_driver as mysqldb_driver
            myDriver = mysqldb_driver.mysqldb_driver()
            myResults = myDriver.execute(statement)
            return myResults
            
            
            
        
        
        
        
            
        