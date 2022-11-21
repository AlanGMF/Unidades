
import logging
import logging.config
from pathlib import Path
from functions import  record_word_count

# Constant variables are defined
CUENTO = "cuento.txt"
LOG_CONF = "log_config_file.conf"
CURRENT_PATH = Path(__file__).parent

log_file_path = Path.joinpath(CURRENT_PATH, LOG_CONF)
file_path = Path.joinpath(CURRENT_PATH, CUENTO)
print(log_file_path)

# Get logger
logging.config.fileConfig(log_file_path, disable_existing_loggers=False)
logger_main = logging.getLogger("main")

def main():
    """Main function that tries to execute 
    the function "functions.record_word_count"
    and logs the state of the execution
    """
    
    try:
        logger_main.info("...Leyendo archivo...")
        record_word_count(file_path)
    except: 
        logger_main.error("No se pudo leer el archivo")
    else:
        logger_main.info("...Archivo procesado...") 

if __name__ == "__main__":
    main()