

def sumar_dos_numeros(
                    numero_1: float,
                    numero_2: float,
                    ) -> float | None:
    try:
        if type(numero_1) != int and type(numero_1) != float or type(numero_2) != int and type(numero_2) != float:
            raise TypeError
        else:
            resultado = numero_1 + numero_2
    except TypeError as err:
        print(err)
    except ValueError as err:
        print(err)
    else:
        return resultado


def restar_dos_numeros(
                        numero_1: int | float,
                        numero_2: int | float
                        ) -> int | float | None:
    try:
        if type(numero_1) != int and type(numero_1) != float or type(numero_2) != int and type(numero_2) != float:
            raise TypeError
        else:
            resultado = numero_1 - numero_2
    except TypeError as err:
        print(err)
    else:
        return resultado


def dividir_dos_numeros(
                        numero_1: int | float,
                        numero_2: int | float
                        ) -> int | float | None:
    try:
        if type(numero_1) != int and type(numero_1) != float or type(numero_2) != int and type(numero_2) != float:
            raise TypeError
        elif numero_2 == 0:
            raise ZeroDivisionError
        else:
            resultado = numero_1 / numero_2
    except TypeError as err:
        print(err)
    except ZeroDivisionError as err:
        print(err)
    else:
        return resultado


def multiplicar_dos_numeros(
                            numero_1: int | float,
                            numero_2: int | float,
                        ) -> int | float | None:
    try:
        if type(numero_1) != int and type(numero_1) != float or type(numero_2) != int and type(numero_2) != float:
            raise TypeError
        else:
            resultado = numero_1 * numero_2
    except TypeError as err:
        print(err)
    else:
        return resultado



d = dividir_dos_numeros(2,0)
print(d)