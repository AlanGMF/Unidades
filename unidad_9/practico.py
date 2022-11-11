

MI_TRANSPORTE = ['auto', 'avión', 'barco', 'bicicleta', 'ómnibus']


def obtener_transporte() -> str:

    try:
        index = int(input("Ingrese un indice "))
    except ValueError as err:
        print(err)
        print("Intene nuevamente")
        return obtener_transporte()

    else:
        try:
            transporte = MI_TRANSPORTE[index]
        except IndexError as err:
            print(err)
            print("Intene nuevamente")
            return obtener_transporte()
        else:
            return transporte


if __name__ == "__main__":
    print(obtener_transporte())


