*** Settings ***
Resource          ${EXECDIR}/resources/config.robot
Library           RequestsLibrary

*** Keywords ***
Adicionar Produto ao Carrinho
    [Arguments]    ${produto_id}    ${quantidade}    ${token}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=${token}
    ${produto_item_json_string}=    Set Variable    {"idProduto": "${produto_id}", "quantidade": ${quantidade}}
    ${body_json_string}=            Set Variable    {"produtos": [${produto_item_json_string}]}
    ${response}=    POST On Session    serverest    /carrinhos    data=${body_json_string}    headers=${headers}    expected_status=201
    RETURN    ${response}

Finalizar Compra
    [Arguments]    ${token}
    ${headers}=    Create Dictionary    Authorization=${token}
    ${response}=   DELETE On Session    serverest    /carrinhos/concluir-compra    headers=${headers}    expected_status=200
    RETURN         ${response}
