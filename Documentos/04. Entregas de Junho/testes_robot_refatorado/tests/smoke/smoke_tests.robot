*** Settings ***
Documentation    Testes de fumaça críticos
Resource          ${EXECDIR}/resources/config.robot
Resource          ../auth/auth_keywords.robot
Suite Setup      Create Session    serverest    ${BASE_URL}
Suite Teardown   Delete All Sessions
Library           Collections

*** Test Cases ***
Verificar saúde da API
    [Tags]    SMOKE
    ${response}=    GET On Session    serverest    /
    Should Be Equal As Strings    ${response.status_code}    200

Login retorna status 200
    [Tags]    SMOKE    LOGIN
    ${response}=    Obter Resposta de Login    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    Should Be Equal As Numbers    ${response.status_code}    200

Login gera token válido
    [Tags]    SMOKE    LOGIN
    ${response}=    Obter Resposta de Login    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    ${token}=    Get From Dictionary    ${response.json()}    authorization
    Should Not Be Empty    ${token}
