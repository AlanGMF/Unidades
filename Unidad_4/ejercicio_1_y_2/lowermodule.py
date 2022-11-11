import logging



logging.basicConfig(
    level=logging.DEBUG,
    #filename="file.log",
    #filemode="w",
    format='%(name)s - %(levelname)s - %(message)s - %(asctime)s',
    datefmt= "%Y-%m-%dT%H:%M:%S%z",
    
)

logger = logging.getLogger(__name__)

def word_count(archivo):

    try:
        with open(archivo,"r") as f:
            file_data = f.read()
            words = file_data.split(" ")
            final_words_count =  len(words)
            logger.info(f"the file {archivo.parts[-1]} has {final_words_count} words")
            return final_words_count

    except OSError:
        logger.error(f"error reading this file --> {archivo.parts[-1]}")
    finally:
        f.close()


