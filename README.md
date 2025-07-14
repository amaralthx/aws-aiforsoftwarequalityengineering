# Cinema App – Desafio de Automação de Testes com Robot Framework

Este repositório contém os testes do projeto **Cinema App**, desenvolvidos com **Robot Framework** e **Browser Library** para validação end-to-end.

##  O Que Foi Testado

Implementei testes completos para:
-  Fluxo completo de cadastro (signup)
-  Validações de formulário
-  Tratamento de erros
-  Requisitos de segurança para senhas

##  Estrutura do Projeto

```bash
aws-aiforsoftwarequalityengineering/
└── cinema-challenge/
    ├── cinema-challenge-front/    # Aplicação React (porta 3002)
    ├── cinema-challenge-back/     # API Node.js (porta 3001)
    └── robotframeworkchallenge/   # Testes
        ├── resources/
        │   ├── base/              # Configurações globais
        │   ├── pages/             # Page Objects
        │   └── tests/             # Casos de teste
        ├── results/               # Relatórios de execução
        └── requirements.txt       # Dependências
        ├── Planejamento de Teste Challenge Final - Cinema APP.pdf
    ├──Collections Postman         # Testes manuais backend
🚀 Como Executar
Pré-requisitos
Node.js 16+

Python 3.8+

Git

1. Iniciar Ambiente
bash
git clone -b cinema-challenge https://github.com/amaralthx/aws-aiforsoftwarequalityengineering.git
cd aws-aiforsoftwarequalityengineering/cinema-challenge
2. Subir Aplicação
bash
# Backend (terminal 1)
cd cinema-challenge-back && npm install && npm run dev

# Frontend (terminal 2)
cd cinema-challenge-front && npm install && npm run dev
3. Executar Testes
bash
cd robotframeworkchallenge
pip install -r requirements.txt
rfbrowser init  # Configura browsers

# Execução completa
robot -d results resources/tests/
Testes Implementados
Por Tags (Execução Seletiva)
bash
# Testes positivos (fluxo ideal)
robot -d results -i happy_path resources/tests/signup.robot

# Testes negativos (validações)
robot -d results -i validation resources/tests/signup.robot

# Testes de segurança (senhas)
robot -d results -i security resources/tests/signup.robot

# Smoke test (execução rápida)
robot -d results -i smoke resources/tests/
Detalhes dos Casos de Teste
Tag	Descrição	Cenários Implementados
happy_path	Fluxos positivos	Cadastro válido, Login bem-sucedido
validation	Validações de formulário	Email inválido, Campos obrigatórios
security	Requisitos de senha	Senha fraca, Senha curta
smoke	Testes críticos	Cadastro + Login básico
Resultados
Os relatórios serão gerados em:

results/report.html: Visão geral

results/log.html: Detalhes de execução

results/output.xml: Dados para CI/CD

Troubleshooting
Problema comum	Solução
Erro de conexão	Verifique se frontend/backend estão rodando
Playwright não instalado	Execute rfbrowser init
Dependências faltando	pip install -r requirements.txt
Autora (com ajuda de todos do PB)
Thaís do Amaral (@amaralthx)
Desafio completo do programa AWS AI for Software Quality Engineering
