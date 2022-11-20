
"""
Utilizando los conceptos aprendidos en el módulo 6 - Comentarios en
Python, resolver el siguiente ejercicio.
Desarrollar una función que reciba una lista con varias palabras y que
retorne otra lista con la cantidad de caracteres de cada una de ellas.

Ejemplo:

● lista_inicial = ["perro", "elefante", "dragón"]
● lista_retorno = [5, 8, 6]

Comentar la función de forma adecuada y utilizar nombres de
variables descriptivas.
"""

import generator

def contador_de_caracteres(palabras: list[str]) -> list:
    """_summary_

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
    
    print(contador_de_caracteres(lista_inicial))
    print(lista_inicial)
