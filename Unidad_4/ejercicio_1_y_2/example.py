
import logging
from logging.handlers import RotatingFileHandler
from pathlib import Path


current_path = Path(__file__).parent
path_log = Path.joinpath(current_path, "logs", "my_log.log")
print(path_log)

logger = logging.getLogger("logger_1")
logger2 = logging.getLogger("logger_2")


logger.setLevel(logging.CRITICAL)
logger2.setLevel(logging.CRITICAL)

handler1 = RotatingFileHandler(path_log, maxBytes=1000, backupCount= 15, )
handler1.setLevel(logging.DEBUG)

formater = logging.Formatter('%(name)s - %(levelname)s - %(message)s - %(asctime)s')

handler1.setFormatter(formater)

logger.addHandler(handler1)
logger2.addHandler(handler1)


for i in range(1000):
    logger.debug(f"ejemplo debug  {i}")
    logger.info(f"ejemplo info  {i}")
    logger.warning(f"ejemplo warning  {i}")
    logger.error(f"ejemplo error  {i}")
    logger.critical(f"ejemplo critical  {i}")
    logger2.debug(f"ejemplo debug  {i}")
    logger2.info(f"ejemplo info  {i}")
    logger2.warning(f"ejemplo warning  {i}")
    logger2.error(f"ejemplo error  {i}")
    logger2.critical(f"ejemplo critical  {i}")

