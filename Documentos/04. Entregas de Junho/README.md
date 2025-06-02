# Entregas de Junho

## Conteúdo
- `Planejamento de Teste ServeRest.pdf`: Documento de planejamento de testes para a API Serverest

## Mudanças realizadas
Principais mudanças no plano de testes, com base nas instruções e nos problemas identificados no ciclo anterior:

## Priorização Baseada em Risco Duplo:
#Anteriormente: Priorização P1/P2, com P1s não concluídos.
#Agora: Introdução de uma classificação explícita de Impacto (Crítico/Alto/Médio/Baixo) e Probabilidade (Alta/Média/Baixa) para cada cenário de risco.
#Resultado: Uma prioridade P1 agora significa Crítico + Alta Probabilidade, focando os esforços nos cenários de maior risco e maior chance de ocorrência.

## Regra de Execução Clara para P1:
#Anteriormente: Nenhuma regra explícita para a execução de P1s.
#Agora: Definido que P1 (Impacto Crítico + Probabilidade Alta) deve representar 70% da primeira etapa de execução.
#Resultado: Garante que os testes mais importantes sejam executados prioritariamente.

## Definição Formal de Cobertura de Testes:
#Anteriormente: Cobertura confundida com status de execução.
#Agora: Cobertura definida por uma fórmula explícita.
#Resultado: Foco na cobertura de funcionalidades de risco real, em vez de apenas contar cenários executados.

## Inclusão de Riscos Não Cobertos Justificados:
#Anteriormente: Não havia menção ou justificativa para riscos não testados.
#Agora: A matriz de risco incluirá justificativas para riscos não cobertos, aceitos no escopo ou adiados.
#Resultado: Maior transparência sobre as áreas não testadas e a aceitação de risco.

##Critérios Claros para Automação (Postman):
#Anteriormente: Não havia critérios explícitos para seleção de testes a serem automatizados.
#Agora: Seleção baseada em Repetibilidade, Complexidade Manual e Valor de Negócio.
#Resultado: Automação focada em testes que trarão maior retorno sobre o investimento, como regressão, smoke tests e fluxos de negócio complexos/críticos.
