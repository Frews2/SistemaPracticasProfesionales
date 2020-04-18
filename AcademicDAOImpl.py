import AcademicDAO
import Academic
import mysql.connector
from mysql.connector import Error

class AcademicDAOImpl(AcademicDAO):
    def __init__(self):
        databaseAcess = Connection
    def createAcademic(self, employeeID, username, password,firstName,
                       paternalSurname, maternalSurname):
        try:
            datbaseConnection = databaseAcess.openConnection()
            cursor = databaseConnection.cursor(prepared = True)
            sql_insert_query = """ INSERT INTO Academic
					  (employeeID, username, password, 
					   firstName, paternalSurname, maternalSurname)
					  VALUES (%s,%s,%s,%S,%s,%s)"""
            insert_new_tuple = (employeeID, username, password,
                                firstName, paternalSurname, maternalSurname)
            cursor.execute(sql_insert_query, insert_new_tuple)
            connection.commit()
        except mysql.connector.Error as e:
            print('An error has occured while accessing the database')
        finally:
            cursor.close()
            databaseAcess.closeConnection()

    def deleteAcademic(self, employeeID, username, password, firstName,
                       paternalSurname, maternalSurname):
        try:
            datbaseConnection = databaseAcess.openConnection()
            cursor = databaseConnection.cursor(prepared = True)
            sql_delete_query = """ DELETE FROM Academic 
					  WHERE employeeID = %s"""

            tuple_to_eliminate = (employeeID)
            cursor.execute(sql_delete_query, tuple_to_eliminate)
            connection.commit()
        except mysql.connector.Error as e:
            print('An error has occured while accessing the database')
        finally:
            cursor.close()
            databaseAcess.closeConnection()



    def updateAcademic(self, employeeID, username, password,firstName,
                       paternalSurname, maternalSurname):
        try:
            datbaseConnection = databaseAcess.openConnection()
            cursor = databaseConnection.cursor(prepared = True)
            sql_update_query = """ UPDATE Academic SET username = %s,
					  password = %s, firstName = %s,
					  paternalSurname = %s,
					  maternalSurname = %s
					  WHERE employeeID = %s"""

            tuple_to_update = (employeeID, username, password,
                               firstName, paternalSurname, maternalSurname)
            cursor.execute(sql_update_query, tuple_to_update)
            connection.commit()
        except mysql.connector.Error as e:
            print('An error has occured while accessing the database')
        finally:
            cursor.close()
            databaseAcess.closeConnection()


    def getAllAcademics(self):
        try:
            datbaseConnection = databaseAcess.openConnection()
            cursor = databaseConnection.cursor(prepared = True)
            sql_select_query = """ SELECT*FROM Academic """
            cursor.execute(sql_select_query)
            connection.commit()
        except mysql.connector.Error as e:
            print('An error has occured while accessing the database')
        finally:
            cursor.close()
            databaseAcess.closeConnection()

