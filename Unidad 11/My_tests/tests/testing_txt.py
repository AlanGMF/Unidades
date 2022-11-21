
"""
    Utilizando los conceptos aprendidos en el módulo 11 - Testing II,
resolver el siguiente ejercicio.
Tomando como base el ejercicio práctico de la unidad 10
(Test-Calculadora):
● Implementar la librería docs-from-test para incorporar un diagrama
de la secuencia del test.
● Implementar un registro de los resultados tests en formato txt."""

import sys
import unittest
import datetime
from pathlib import Path

import test_calculadora


def insert_header(f):
    f.write('\n')
    f.write('******************TESTING**************************')
    f.write('\n')
    now = datetime.datetime.now()
    date_time = now.strftime("%m/%d/%Y, %H:%M:%S")
    f.write(date_time)
    f.write('\n')
    f.write('\n')
    return f

def main(out = sys.stderr, verbosity = 2):
    loader = unittest.TestLoader()
  
    suite = loader.loadTestsFromModule(test_calculadora)
    unittest.TextTestRunner(out, verbosity = verbosity).run(suite)


if __name__ == '__main__':
    path = Path.joinpath(Path(__file__).parent,"testing.txt")

    with open(path, 'a') as f:
        f = insert_header(f)
        main(f)
