import logging

logging.basicConfig(
    level=logging.DEBUG,
    filename="unidad_3/logs/results.log",
    filemode="a",
    format='%(asctime)s - %(levelname)s -%(message)s',
    datefmt= "%Y-%m-%dT%H:%M:%S%z"
)

def get_lower_words(words: list[str]):
    for word in words:
        try:
            lower_word = word.lower()
        except Exception:
            logging.error(f"convercion fallida: {word}")
        else:
            logging.info(f"convercion exitosa: {word} ---> {lower_word}")

        
if __name__ == "__main__":

    fruits = ['Frutilla','Melón','PERA',99.6,'NaranJA', 'mORa', 'NisPERo',99]
    get_lower_words(fruits)
    
    