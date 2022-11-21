
def get_transport(list: list[str]) -> str:
    """Returns the value found in a given list,
     otherwise the same function is returned.

    :return: the values 
    :rtype: str
    """
    try:
        index = int(input("Ingrese un indice "))
    except ValueError as err:
        print(err)
        print("Intene nuevamente")
        return get_transport(list)

    else:
        try:
            transporte = list[index]
        except IndexError as err:
            print(err)
            print("Intene nuevamente")
            return get_transport(list)
        else:
            return transporte


if __name__ == "__main__":

    MI_TRANSPORTE = ['auto', 'avión', 'barco', 'bicicleta', 'ómnibus']
    print(get_transport(MI_TRANSPORTE))


