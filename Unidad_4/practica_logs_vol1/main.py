
import logging
import logging.config
from pathlib import Path

from fuctions import  word_counter_per_line

logging.config.fileConfig(fname="log_config_file.conf" , disable_existing_loggers=True)

logger_main = logging.getLogger(__name__)
logger_functions = logging.getLogger(__name__)

def record_word_count(myfile):

    logger_main.info("...Leyendo archivo...")
    
    try:
        with open(myfile,"r") as f:

            lines = f.readlines()
            logger_functions.info(f"{myfile.parts[-1]} - Cantidad de renglones: {lines} ")
            count=0
            for line in f:
                count +=1
                words = word_counter_per_line(line)
                print(f"linea {count} , words = {words}")
                #file_data = f.readline()
                #words = file_data.split(" ")
                #final_words_count =  len(words)
                #logger_main.info(f"the file {myfile.parts[-1]} has {final_words_count} words")
                #return final_words_count

        lines = word_counter_per_line(myfile)
        word_count = word_counter_per_line(myfile, lines)
        logger_main.info("...Archivo procesado...")
    except:
        logger_main.error("No se pudo leer el archivo")
    finally:
        f.close()
        #logger_main.info(f"the fuction is done for the file -> {myfile.parts[-1]}")

def main():

    current_path = Path(__file__).parent
    file_name = "cuento.txt"
    path_file = Path.joinpath(current_path, file_name)

    record_word_count(path_file)

if __name__ == "__main__":
    main()