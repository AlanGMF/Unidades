import unittest
import funciones


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

        self.assertEqual(funciones.sumar_dos_numeros(self.numero_int, self.letra_str), TypeError)
        self.assertEqual(funciones.sumar_dos_numeros(self.numero_int, self.numero_float), self.suma_int_float)
        self.assertEqual(funciones.sumar_dos_numeros(self.numero_str, self.numero_str), TypeError)
        self.assertEqual(funciones.sumar_dos_numeros(self.numero_float, self.numero_float), self.suma_float_float)

    def test_restar_dos_numeros(self):

        self.assertEqual(funciones.restar_dos_numeros(self.numero_int, self.letra_str), TypeError)
        self.assertEqual(funciones.restar_dos_numeros(self.numero_int, self.numero_float), self.resta_int_float)
        self.assertEqual(funciones.restar_dos_numeros(self.numero_str, self.numero_str), TypeError)

    def test_dividir_dos_numeros(self):

        self.assertEqual(funciones.dividir_dos_numeros(self.numero_int, 0), ZeroDivisionError)
        self.assertEqual(funciones.dividir_dos_numeros(self.numero_int, self.numero_float), self.dividir_int_float)
        self.assertEqual(funciones.dividir_dos_numeros(self.letra_str, self.letra_str), TypeError)

    def test_multiplicar_dos_numeros(self):

        self.assertEqual(funciones.multiplicar_dos_numeros(self.numero_int, self.letra_str), TypeError)
        self.assertEqual(funciones.multiplicar_dos_numeros(self.numero_float, self.numero_int), self.multi_float_int)
        self.assertEqual(funciones.multiplicar_dos_numeros(self.numero_str, self.letra_str), TypeError)


if __name__ == '__main__':
    unittest.main()

