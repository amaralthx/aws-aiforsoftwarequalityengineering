# Calculadora TDD Python

Esta calculadora oferece as seguintes operações:

* Adição
* Subtração
* Multiplicação
* Divisão
* Potenciação
* Módulo

Testes implementados: Cada operação é validada por testes unitários que cobrem cenários válidos, inválidos e casos extremos.

# Instruções de Teste

## Pré-requisitos
- Python 3 instalado.
- Biblioteca pytest instalada.

## Passo a Passo para Executar os Testes (via Git)
1. Clone o repositório (git clone https://github.com/amaralthx/aws-aiforsoftwarequalityengineering.git
cd aws-aiforsoftwarequalityengineering/Documentos/03.\ Entregas\ de\ Maio/Calculadora\ TDD\ Python)

2. Instale o pytest (se ainda não instalado) e configure o ambiente virtual (recomendado):
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate    # Windows
pip install pytest

3. Execute os testes com o comando:
python -m pytest tests/ -v

Este comando executará todos os testes unitários localizados na pasta tests e mostrará a saída detalhada (-v para verbose).

## Referências: 
- Utilização de DeepSeek e Gemini para aprofundar conhecimento em pytest, correção de código e sugestões de boas práticas.
- Discussões com colegas para resolução de dúvidas e validação da execução dos testes.
