import mysql.connector
from mysql.cpnnector import Error

class DatabaseConnection:
    def__init__(self):

    def openConnection(self):
        try:
            file = open(r"DatabaseUserCredentials.txt","Acess_Mode")
            file.seek(0)
            file.readline()
            file.readline()
            hostname = file.readline()
            file.readline()
            username = file.readline()
            file.readline()
            password = file.readline()
            dataseConnection = mysql.connector.connect(host = hostname,
                                                       user = username,
            pass = password)
            return databaseConnection
        except IOError:
            print('An error ocurred while reading the file')
        except EOFError:
            print('File Ended unexpectedly')
        except (mysql.connector.Error) as e:
            print('An error occured while accesing the database')
            print(e)
        finally:
            file.close()

    def closeConnection:
        if databaseConnection != null:
            databaseConnection.close()
		