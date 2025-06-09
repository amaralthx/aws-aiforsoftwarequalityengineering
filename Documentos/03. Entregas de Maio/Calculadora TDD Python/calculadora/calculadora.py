class Calculadora:
    def _validar_tipos(self, primeiro_numero, segundo_numero):
        if isinstance(primeiro_numero, bool) or isinstance(segundo_numero, bool):
            return False
        return isinstance(primeiro_numero, (int, float)) and isinstance(segundo_numero, (int, float))

    def adicionar(self, primeiro_numero, segundo_numero):
        if not self._validar_tipos(primeiro_numero, segundo_numero):
            return "Erro: Valores inválidos. Insira apenas números (int ou float)."
        return primeiro_numero + segundo_numero

    def subtrair(self, primeiro_numero, segundo_numero):
        if not self._validar_tipos(primeiro_numero, segundo_numero):
            return "Erro: Valores inválidos. Insira apenas números (int ou float)."
        return primeiro_numero - segundo_numero

    def multiplicar(self, primeiro_numero, segundo_numero):
        if not self._validar_tipos(primeiro_numero, segundo_numero):
            return "Erro: Valores inválidos. Insira apenas números (int ou float)."
        return primeiro_numero * segundo_numero

    def dividir(self, primeiro_numero, segundo_numero):
        if not self._validar_tipos(primeiro_numero, segundo_numero):
            return "Erro: Valores inválidos. Insira apenas números (int ou float)."
        if segundo_numero == 0:
            return "Erro: Divisão por zero não permitida. O divisor deve ser diferente de zero."
        return primeiro_numero / segundo_numero

    def potencia(self, base, expoente):
        if not self._validar_tipos(base, expoente):
            return "Erro: Valores inválidos. Insira apenas números (int ou float)."
        return base ** expoente

    def modulo(self, primeiro_numero, segundo_numero):
        if not self._validar_tipos(primeiro_numero, segundo_numero):
            return "Erro: Valores inválidos. Insira apenas números (int ou float)."
        if segundo_numero == 0:
            return "Erro: Divisão por zero não permitida. O divisor deve ser diferente de zero."
        return primeiro_numero % segundo_numero