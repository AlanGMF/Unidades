
"""_summary_

:return: _description_
:rtype: _type_
"""
import random
characters = "qwertyuiopasdfghjklzxcvbnm"


def words_generator(length_list: int, length_words: int) -> list:
    
    list_ = []

    for i in range(random.randint(1, length_list)):
        number = random.randint(1, length_words)
        list_.append(word_generator(number))
    return list_


def word_generator(length_words: int):

    word= ""
    for i in range(length_words):
        word += characters[random.randint(1, length_words)]
    return word

