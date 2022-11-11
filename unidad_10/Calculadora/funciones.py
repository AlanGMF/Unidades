

def sumar_dos_numeros(
                    numero_1: float,
                    numero_2: float,
                    ) -> float | None:
    """Devuelve la suma de dos numeros

    :param numero_1: primer numero a sumar
    :type numero_1: float
    :param numero_2: segundo numero a sumar
    :type numero_2: float
    :raises TypeError: Si ambos numeros no son enteros o flotantes imprime un error
    :return: _description_
    :rtype: float | None
    """
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
                        numero_1: float,
                        numero_2: float
                        ) -> float | TypeError:
    """Devuelve la resta de dos numeros

    :param numero_1: primer numero a restar
    :type numero_1: float
    :param numero_2: segundo numero a restar
    :type numero_2: float
    :raises TypeError: Si ambos numeros no son enteros o flotantes imprime un error
    :return: _description_
    :rtype: float | TypeError
    """
    try:
        if type(numero_1) != int and type(numero_1) != float or type(numero_2) != int and type(numero_2) != float:
            raise TypeError
        else:
            resultado = numero_1 - numero_2
    except TypeError as err:
        return err
    else:
        return resultado


def dividir_dos_numeros(
                        numero_1: float,
                        numero_2: float
                        ) -> float | ZeroDivisionError | TypeError :
    """Devuelve la divicion de dos numeros

    :param numero_1: primer numero a dividir
    :type numero_1: float
    :param numero_2: segundo numero a dividir
    :type numero_2: float
    :raises TypeError: Si ambos numeros no son enteros o flotantes imprime un error
    :return: float | TypeError | ZeroDivisionError
    :rtype: float | TypeError | ZeroDivisionError
    """
    try:
        if type(numero_1) != int and type(numero_1) != float or type(numero_2) != int and type(numero_2) != float:
            raise TypeError
        elif numero_2 == 0:
            raise ZeroDivisionError
        else:
            resultado = numero_1 / numero_2
    except TypeError as err:
        return err
    except ZeroDivisionError as err:
        return err
    else:
        return resultado


def multiplicar_dos_numeros(
                            numero_1: float,
                            numero_2: float,
                        ) -> float | TypeError:
    try:
        if type(numero_1) != int and type(numero_1) != float or type(numero_2) != int and type(numero_2) != float:
            raise TypeError
        else:
            resultado = numero_1 * numero_2
    except TypeError as err:
        return err
    else:
        return resultado
