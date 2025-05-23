# Testes Automatizados com Robot Framework

Este projeto contém testes automatizados utilizando o **Robot Framework** aplicados à API [Reqres.in](https://reqres.in/) como parte da trilha **AWS & AI for Software Quality Engineering** do estágio na Compass UOL.

## Estrutura do Projeto

- `payloads/`: arquivos `.json` com os dados para requisições da API (ex: criação de usuário, login, atualização).
- `resources/`: arquivos `.robot` com palavras-chave personalizadas (keywords reutilizáveis).
- `tests/`: arquivos `.robot` com os cenários de teste.
- `venv/`: ambiente virtual Python (não incluído no controle de versão).
- `requirements.txt`: dependências do projeto.
- `output.xml`, `report.html`, `log.html`: arquivos gerados automaticamente com os resultados da execução dos testes.

## Como Executar os Testes

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/amaralthx/aws-aiforsoftwarequalityengineering.git
   cd aws-aiforsoftwarequalityengineering
   git checkout projeto-completo
