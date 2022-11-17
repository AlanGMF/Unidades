
from datetime import datetime


class Empleados ():
    def __init__(
                self,nombre: str,
                apellido:str,
                fecha_nacimiento:str,
                nro_dni:int
                ):
        """Instancia un objeto de la clase Empleados

        :param nombre: Nombre del empleado
        :type nombre: str
        :param apellido: Apellido del empleado
        :type apellido: str
        :param fecha_nacimiento: fecha de nacimiento del empleado
        :type fecha_nacimiento: str
        :param nro_dni: Nro DNI del empleado
        :type nro_dni: int
        """
        self.nombre = nombre
        self.nro_dni = nro_dni
        self.apellido = apellido
        self.fecha_nacimiento = fecha_nacimiento
    
    def edad(self):
        """Calcula la edad del empleado

        :return: Años de edad del empleado
        :rtype: int
        """

        fecha_hoy= datetime.today()
        nacimiento= datetime.strptime(self.fecha_nacimiento,'%d/%m/%Y')
               
        return fecha_hoy.year - nacimiento.year - ( (fecha_hoy.month,fecha_hoy.day) < (nacimiento.month,nacimiento.day)  )
 

    def presentacion(self):
        """Devuelve una presentacion sencilla del empleado con sus datos

        :return: presentacion sencilla del empleado
        :rtype: str
        """

        return ("Hola, soy {}. Nací el {} y mi DNI es {}".format(
            self.nombre,self.fecha_nacimiento,self.nro_dni
            )
        )


