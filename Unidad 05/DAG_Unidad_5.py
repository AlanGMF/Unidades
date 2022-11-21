
# import the libraries
import logging
from datetime import timedelta
from airflow import DAG
from airflow.utils.dates import days_ago
import pandas as pd
from pathlib import Path

# path
current_path = Path(__file__).parent
logs_file_name = "log_practica_unidad_5.log"
exel_file_name = "top10_medals_by_country.xls"
logs_path_file = Path.joinpath(current_path, logs_file_name)
exel_path_file = Path.joinpath(current_path, exel_file_name)


# Logging

logger = logging.getLogger("custom_logger")
format = logging.Formatter(
    '%(asctime)s - %(levelname)s -%(levelno)s - %(message)s'
    )
logger.setLevel(logging.getLevelName('INFO'))

# Handler 1 
stream_handler = logging.StreamHandler()
stream_handler.setLevel(logging.INFO)
stream_handler.setFormatter(format)
logger.addHandler(stream_handler)

# Handler 2
file_handler = logging.FileHandler(logs_path_file)
file_handler.setLevel(logging.INFO)
file_handler.setFormatter(format)
logger.addHandler(file_handler)


# defining DAG arguments

default_args = {
 'owner': 'Alkemy_Prisma',
 'start_date': days_ago(0),
 'email': ['some@somemail.com'],
 'email_on_failure': False,
 'email_on_retry': False,
 'retries': 1,
 'retry_delay': timedelta(minutes=5),
}


dag = DAG(
 'DAG_Unidad_5',
 default_args=default_args,
 description='My first DAG',
 schedule_interval=timedelta(days=1),
)

# Tasks


@dag.task(task_id = "read_top10")
def read_top10():
    
    # ----- Completar logging ------
    logger.info("... Procesando archivo ...")
    # -----Fin Completar logging ------




    # Read CSV from web
    url = "http://winterolympicsmedals.com/medals.csv"
    
    try:

        df = pd.read_csv(url)

        # Get top 10 countries with most medals
        top_countries = df.NOC.value_counts().sort_values(ascending=False).head(10)
        
        # Convert pandas series to data frame
        to_countries_df = top_countries.to_frame()

        # Save data frame in Excel format - Completar tu propia ubicación para guardar el archivo de salida
        logger.info(f"se transforma el df a exel en la carpeta exel_path_file.xls")

        to_countries_df.to_excel(exel_path_file)
        
        #Logging message INFO Success --- Completar
        logger.info("... Archivo procesado correctamente ... !")
    except:

        logger.critical("Error al procesar archivo !!!")
        raise Exception("Error Read Top10")
        #Logging message ERROR Fail --- Completar
        
 

# task pipeline
read_top10()