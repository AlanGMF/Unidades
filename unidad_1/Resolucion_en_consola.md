-- 2- Crear un directorio para proyectos python

        mkdir unidad_1

- 3- Instalar el módulo “venv”.

- 4- Crear 2 ambientes virtuales (Ambiente 1 y ambiente 2)

        py -m venve Ambiente_1
    

- 5- Instalar la última versión de pandas y la de matplotlib en el ambiente 1

        .\Ambiente_1\Scripts\activate.bat
    
        pip install matplotlib pandas

        .\Ambiente_1\Scripts\deactivate.bat
    

- 6 - Instalar la versión inmediata anterior a la última versión de pandas y la de matplotlib en el ambiente 2

        .\Ambiente_2\Scripts\activate.bat

        pip install matplotlib==3.5.2 pandas==1.4.4

        .\Ambiente_2\Scripts\deactivate.bat

- 7- Generar el archivo requeriments.txt en cada uno de los ambientes

        .\Ambiente_1\Scripts\activate.bat

        pip freeze > Ambiente_2/requirements.txt

        .\Ambiente_1\Scripts\deactivate.bat


        .\Ambiente_2\Scripts\activate.bat

        pip freeze > Ambiente_2/requirements.txt 
    
        .\Ambiente_2\Scripts\deactivate.bat

- 8- Verificar el contenido del archivo generado en cada uno de los
ambientes.

        .\Ambiente_2\Scripts\activate.bat

        pip freeze

        .\Ambiente_2\Scripts\deactivate.bat


        .\Ambiente_1\Scripts\activate.bat

        pip freeze
    
        .\Ambiente_1\Scripts\deactivate.bat


