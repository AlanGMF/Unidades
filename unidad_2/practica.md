# Unidad 2

Utilizando los conceptos aprendidos en el módulo 1- Archivos de
Configuración, resolver el siguiente ejercicio:

## Consignas

1- Instalar VSC

2- Crear un proyecto Python

    mkdir unidad_2

3- Crear un nuevo ambiente virtual llamado venv-decouple

    py -m venv venv-decouple
    
    .\venv-decouple\Scripts\activate.bat

4- Instalar Decouple

    pip install python-decouple

5- Generar un archivo con variables de entorno para acceder a
una base de datos MySQL.

    touch .env

6- Generar una aplicación Python para mostrar por pantalla las
variables de entorno, utilizando Decouple y Placeholders

    touch app_decouple.py

7- Instalar Dotenv

    pip install python-dotenv

8- Modificar la aplicación Pyton desarrollada en el punto 6 para
mostrar las variables de entorno por pantalla utilizado dotenv

    touch app_dotenv.py