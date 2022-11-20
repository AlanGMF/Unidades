

def contador_de_caracteres(palabras: list[str]) -> list:
    """receives a list of words and returns a list with 
    the number of characters in each word

    :param palabras: Words to be processed
    :type palabras: list[str]
    :return: Chars' count per word
    :rtype: list
    """
    
    # Se inicializa la lista que tendra
    # el numero de caracteres    
    palbras_contadas = [] 

    for palabra in palabras:
        caracteres = len(palabra) # Se cuentan los caracteres de cada palabra
        palbras_contadas.append(caracteres)

    return palbras_contadas

if __name__ == '__main__':
    
    lista_inicial = [
        "perro", "elefante", "dragón",
        "perro","elefante", "dragón",
        "perro", "elefante"
        ]
    
    print(lista_inicial)
    print(contador_de_caracteres(lista_inicial))
