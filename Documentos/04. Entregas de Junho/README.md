# Entregas de Junho

Esta pasta contém os artefatos de teste para o mês de junho.

## Conteúdo
- `Planejamento de Teste ServeRest.pdf`: Documento de planejamento de testes para a API Serverest

## Mudanças Realizadas no Plano de Testes

Principais melhorias implementadas com base nas instruções e problemas identificados no ciclo anterior:

### 1. Priorização Baseada em Risco Duplo
- **Anteriormente**: Priorização P1/P2 com itens críticos não concluídos  
- **Agora**: Classificação explícita por:
  - **Impacto** (Crítico/Alto/Médio/Baixo) - consequência da falha
  - **Probabilidade** (Alta/Média/Baixa) - frequência esperada de uso
- **Resultado**: Prioridade P1 = Impacto Crítico + Probabilidade Alta

### 2. Regra de Execução Clara para P1
- **Anteriormente**: Sem regra explícita para execução de P1  
- **Agora**: 70% do esforço inicial alocado para P1  
- **Resultado**: Garantia de execução prioritária dos testes mais críticos

### 3. Definição Formal de Cobertura de Testes
- **Anteriormente**: Cobertura confundida com status de execução  
- **Agora**: Fórmula clara de cobertura:  
  `(Funcionalidades de risco ≥ Médio cobertas / Total de funcionalidades de risco ≥ Médio) × 100`  
- **Resultado**: Métrica focada em proteção de funcionalidades críticas

### 4. Inclusão de Riscos Não Cobertos Justificados
- **Anteriormente**: Riscos não testados não documentados  
- **Agora**: Matriz de risco inclui:  
  - Lista de riscos aceitos/adiados  
  - Justificativa para cada decisão  
- **Resultado**: Transparência sobre lacunas de teste

### 5. Critérios Claros para Automação
- **Anteriormente**: Seleção sem critérios definidos  
- **Agora**: Automação baseada em:  
  - **Repetibilidade**: Testes de regressão/smoke  
  - **Complexidade Manual**: Fluxos com >5 passos  
  - **Valor de Negócio**: Funcionalidades core  
- **Resultado**: Automação estratégica com maior ROI
