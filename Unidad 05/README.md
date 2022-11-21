# Unidad 4

Utilizando los conceptos aprendidos en el módulo 5 - Loguear
Eventos en Airflow, resolver el siguiente ejercicio.

# Consignas

En el siguiente link se encuentra un DAG que realiza una consulta a una URL y descarga un dataset de medallas olímpicas. Luego contabiliza el top ten de países con más medallas y guarda los resultados en un archivo en formato Excel.

Para utilizar este DAG, se deberá descargar y copiar en la carpeta
DAGs de Airflow.

A partir del DAG propuesto, completar las partes comentadas, a fin de
agregar un logger personalizado que realice las siguientes tareas:

1) Indicarnos si la descarga del dataset se y procesamiento se realizó correctamente
2) Indicarnos si la tarea anterior fue fallida.
3) Mostrar el logging por consola y también guardarlo en un archivo.

        22-10-07 1529:13 - INFO -20 - ... Archivo procesado correctamente ...


