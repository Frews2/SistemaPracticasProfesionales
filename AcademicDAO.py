from abc import ABC, abstractmethod
import Academic

class AcademicDAO(ABC):

    @abstractmethod
    def createAcademic(self, employeeID, username, password,firstName,
                       paternalSurname, maternalSurname):
        pass

    @abstractmethod
    def updateAcademic(self, employeeID, username, password,firstName,
                       paternalSurname, maternalSurname):
        pass

    @abstractmethod
    def deleteAcademic(self, employeeID, username, password,firstName,
                       paternalSurname, maternalSurname):
        pass

    @abstractmethod
    def getAllAcademics(self, employeeID, username, password,firstName,
                             paternalSurname, maternalSurname):
        pass
