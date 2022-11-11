import logging

import lowermodule
from pathlib import Path

logging.basicConfig(
    level=logging.DEBUG,
    #filename="file.log",
    #filemode="w",
    format='%(name)s - %(levelname)s - %(message)s - %(asctime)s',
    datefmt= "%Y-%m-%dT%H:%M:%S%z"
)

logger = logging.getLogger(__name__)

def record_word_count(myfile):
    logger.info("starting the fuction")
    try:
        word_count = lowermodule.word_count(myfile)
        with open('word_count_archive.csv',"a") as file:
            row = str(myfile.parts[-1]) + "," + str(word_count)
            file.write(row + '\n')
    except:
        logger.error(f"could not write this file")
    finally:
        logger.info(f"the fuction is done for the file -> {myfile.parts[-1]}")

def main():

    current_path = Path(__file__).parent
    file_name = "myfile.txt"
    path_file = Path.joinpath(current_path, file_name)

    record_word_count(path_file)

if __name__ == "__main__":
    main()
    
    