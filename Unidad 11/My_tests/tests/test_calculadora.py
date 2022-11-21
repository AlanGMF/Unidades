import os, sys
import unittest

sys.path.append('c:\\Users\\Alan\\CarpetaVSC\\tiimiit_alkemy_bootcamp\\unidad_11\\My_tests')

import funciones.funciones as f



from pathlib import Path
from docs_from_tests.instrument_call_hierarchy import (
    instrument_and_import_package,
    initialise_call_hierarchy,
    finalise_call_hierarchy
)
print(os.path.join(Path(__file__).parent.absolute(), '..', 'funciones'))
instrument_and_import_package(os.path.join(Path(__file__).parent.absolute(), '..', 'funciones'), "funciones")

class TestCalculadora(unittest.TestCase):
    numero_str = "5"
    letra_str = "a"
    numero_int = 1
    numero_float = 1.2
    acepta_numeros_str = False

    def setUp(self):

        self.suma_int_float = self.numero_float + self.numero_int
        self.suma_float_float = self.numero_float + self.numero_float

        self.resta_int_float = self.numero_int - self.numero_float
        self.resta_float_float = self.numero_float - self.numero_float

        self.dividir_int_float = self.numero_int / self.numero_float

        self.multi_float_int = self.numero_float * self.numero_int



    def test_sumar_dos_numeros(self):
        # Inicio de la secuencia
        initialise_call_hierarchy('start')


        self.assertEqual(f.sumar_dos_numeros(self.numero_int, self.letra_str), None)
        self.assertEqual(f.sumar_dos_numeros(self.numero_int, self.numero_float), self.suma_int_float)
        self.assertEqual(f.sumar_dos_numeros(self.numero_str, self.numero_str), None)
        self.assertEqual(f.sumar_dos_numeros(self.numero_float, self.numero_float), self.suma_float_float)
        # no hacer el try excepf
        # whit self.asserExce(Type):
          #  self.assertAlmostEqual

        # Finalizamos la secuencia
        root_call = finalise_call_hierarchy()

        # Retornamos el diagrama de secuencia
        sequence_diagram = root_call.sequence_diagram(
            show_private_functions=False,
            excluded_functions=[]
        )

        # Escribimos el archivo de la secuencia en formato markdown
        sequence_diagram_filename = os.path.join(os.path.dirname(__file__), '..', 'docs', 'diagramade_secuencia.md')
        Path(sequence_diagram_filename).write_text(sequence_diagram)


if __name__ == '__main__':
    unittest.main()
