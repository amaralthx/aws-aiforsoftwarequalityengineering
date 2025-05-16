import pytest
from calculadora.calculadora import Calculadora

def test_adicao():
    calc = Calculadora()
    assert calc.adicionar(5, 3) == 8
    assert calc.adicionar(-2, 2) == 0
    assert calc.adicionar(2.5, 3.5) == 6.0

def test_subtracao():
    calc = Calculadora()
    assert calc.subtrair(10, 3) == 7
    assert calc.subtrair(5, 10) == -5
    assert calc.subtrair(5.5, 2.5) == 3.0

def test_multiplicacao():
    calc = Calculadora()
    assert calc.multiplicar(3, 4) == 12
    assert calc.multiplicar(-2, 5) == -10
    assert calc.multiplicar(2.5, 4) == 10.0

def test_divisao():
    calc = Calculadora()
    assert calc.dividir(10, 2) == 5.0
    assert calc.dividir(15, 3) == 5.0
    assert calc.dividir(7, 2) == 3.5

def test_divisao_por_zero():
    calc = Calculadora()
    assert calc.dividir(10, 0) == "Erro: Divisão por zero não permitida. O divisor deve ser diferente de zero."
    assert calc.dividir(0, 0) == "Erro: Divisão por zero não permitida. O divisor deve ser diferente de zero."

def test_potencia():
    calc = Calculadora()
    assert calc.potencia(2, 3) == 8
    assert calc.potencia(5, 0) == 1
    assert calc.potencia(3, 2) == 9
    assert calc.potencia(2.5, 2) == 6.25

def test_modulo():
    calc = Calculadora()
    epsilon = 1e-9  # Um valor pequeno para tolerância
    assert calc.modulo(10, 3) == 1
    assert calc.modulo(15, 4) == 3
    assert abs(calc.modulo(15.7, 4) - 3.7) < epsilon

def test_tipos_invalidos():
    calc = Calculadora()
    assert calc.adicionar("2", 3) == "Erro: Valores inválidos. Insira apenas números (int ou float)."
    assert calc.subtrair(5, {}) == "Erro: Valores inválidos. Insira apenas números (int ou float)."
    assert calc.multiplicar(None, 4) == "Erro: Valores inválidos. Insira apenas números (int ou float)."
    assert calc.dividir(10, [2]) == "Erro: Valores inválidos. Insira apenas números (int ou float)."
    assert calc.potencia("3", 2) == "Erro: Valores inválidos. Insira apenas números (int ou float)."
    assert calc.modulo(10, True) == "Erro: Valores inválidos. Insira apenas números (int ou float)."

def test_booleanos_rejeitados():
    calc = Calculadora()
    assert calc.adicionar(True, 5) == "Erro: Valores inválidos. Insira apenas números (int ou float)."
    assert calc.modulo(10, False) == "Erro: Valores inválidos. Insira apenas números (int ou float)."

@pytest.mark.parametrize("a, b, esperado", [
    (2, 3, 5),
    (-5, -3, -8),
    (0, 0, 0),
    (2.5, 3.5, 6.0),
    (-2, 5, 3),
])
def test_adicao_parametrizada(a, b, esperado):
    calc = Calculadora()
    assert calc.adicionar(a, b) == esperado

@pytest.mark.parametrize("dividendo, divisor, esperado", [
    (10, 2, 5.0),
    (15, 3, 5.0),
    (7, 2, 3.5),
    (0, 5, 0.0),
    (5, 0, "Erro: Divisão por zero não permitida. O divisor deve ser diferente de zero."),
])
def test_divisao_parametrizada(dividendo, divisor, esperado):
    calc = Calculadora()
    assert calc.dividir(dividendo, divisor) == esperado