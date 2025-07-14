#  Cinema App - Automação de Testes com Robot Framework

##  Visão Geral
Testes para o sistema Cinema App desenvolvidos com:
- Robot Framework
- Browser Library (Playwright)
- Page Object Pattern

##  Cenários Testados
 **Cadastro de Usuário**  
 **Validações de Formulário**  
 **Tratamento de Erros**  
 **Requisitos de Segurança**  
 **Fluxo de Login**  

##  Pré-requisitos
- Node.js 16+
- Python 3.8+
- Git
- Navegadores Chrome/Firefox

##  Execução Rápida

```bash
# Clone o projeto
git clone -b cinema-challenge https://github.com/amaralthx/aws-aiforsoftwarequalityengineering.git
cd aws-aiforsoftwarequalityengineering/cinema-challenge
```

```bash
# Inicie a aplicação (em terminais separados)
cd cinema-challenge-back && npm install && npm run dev  # Backend (3001)
cd cinema-challenge-front && npm install && npm run dev # Frontend (3002)
```

```bash
# Execute os testes
cd robotframeworkchallenge
pip install -r requirements.txt
rfbrowser init
robot -d results resources/tests/
```

## Estrutura do Projeto
```bash
cinema-challenge/
├── cinema-challenge-back/       # API Node.js (3001)
├── cinema-challenge-front/      # App React (3002)
└── robotframeworkchallenge/     # Automação
    ├── resources/
    │   ├── base/                # Configurações
    │   ├── pages/               # Page Objects
    │   └── tests/               # Casos de teste
    ├── results/                 # Relatórios
    ├── requirements.txt         # Dependências
    └── Planejamento de Teste Challenge Final - Cinema APP.pdf
├── Collections Postman/         # Testes manuais
```

## Tipos de Teste
| Tag          | Descrição                  | Exemplos            |
|--------------|----------------------------|---------------------|
| `happy_path` | Fluxos positivos           | Cadastro válido     |
| `validation` | Validações de formulário   | Email inválido      |
| `security`   | Requisitos de senha        | Senha fraca         | 
| `smoke`      | Testes críticos            | Login básico        |

## Relatórios
**results/report.html: Sumário executivo**
**results/log.html: Detalhes completos**
**results/output.xml: Integração CI/CD**

## Autora
**Thaís do Amaral [@amaralthx]**
**Com contribuições da turma do PB da AWS**
