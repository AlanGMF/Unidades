import logging



logging.basicConfig(
    level=logging.DEBUG,
    #filename="file.log",
    #filemode="w",
    format='%(name)s - %(levelname)s - %(message)s - %(asctime)s',
    datefmt= "%Y-%m-%dT%H:%M:%S%z",
    
)

logger_functions = logging.getLogger(__name__)

def word_counter_per_line(f):
    file_data = f.readline()
    words = file_data.split(" ")
    final_words_count =  len(words)
    logger_functions.info(f"the file {f.parts[-1]} has {final_words_count} words")
    return final_words_count




