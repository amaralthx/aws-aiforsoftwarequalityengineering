*** Settings ***
Resource          ../auth/auth_keywords.robot
Resource          ../carrinhos/cart_keywords.robot
Resource          ${EXECDIR}/resources/config.robo
Suite Setup       Iniciar Sessão
Suite Teardown    Encerrar Sessão
Library           Collections

*** Test Cases ***
Adicionar Produto ao Carrinho com Sucesso
    [Tags]    HIGH    CARRINHOS
    ${token} =    Obter Token de Login    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    ${response} =    Adicionar Produto ao Carrinho  ${PRODUTO_ID}  1  ${token}
    Should Be Equal As Strings  ${response.status_code}  201

Finalizar Compra com Sucesso
    [Tags]    HIGH    CHECKOUT
    ${token} =    Obter Token de Login    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    ${response} =    Finalizar Compra  ${token}
    Should Be Equal As Strings  ${response.status_code}  200

Verificar Atualizacao de Estoque apos Compra
    [Tags]    HIGH    CHECKOUT    PRODUTOS
    ${token} =    Obter Token de Login    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    ${estoque_inicial} =    Obter Estoque Atual  ${PRODUTO_ID}
    Adicionar Produto ao Carrinho  ${PRODUTO_ID}  1  ${token}
    Finalizar Compra  ${token}
    ${estoque_final} =    Obter Estoque Atual  ${PRODUTO_ID}
    Should Be Equal As Numbers  ${estoque_final}  ${estoque_inicial - 1}

*** Keywords ***
Iniciar Sessão
    Create Session    serverest    ${BASE_URL}

Obter Estoque Atual
    [Arguments]    ${produto_id}
    ${response}    GET On Session    serverest    /produtos/${produto_id}    expected_status=200
    ${estoque}     Get From Dictionary    ${response.json()}    quantidade
    RETURN         ${estoque}

Encerrar Sessão
    Delete All Sessions
