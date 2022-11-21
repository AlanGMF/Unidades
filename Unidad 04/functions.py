import logging

# Get logger
logger_functions = logging.getLogger(__name__)

def record_word_count(myfile):
    """count the number of words per line

    :param myfile: file path
    :type myfile: Path
    """
    try:
        with open(myfile,"r") as f:

            lines = f.readlines()
            logger_functions.info(f"{myfile.parts[-1]} - Cantidad de renglones: {len(lines)} ")
            count=-1
            for line in lines:
                count +=1
                words = line.split(" ")
                logger_functions.info(f"Renglon {count}: {len(words)} palabras")
                
    except:
        print("error")
    finally:
        f.close()





