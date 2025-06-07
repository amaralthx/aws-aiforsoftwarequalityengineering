*** Settings ***
Documentation    Keywords para autenticação
Library           RequestsLibrary
Library           Collections


*** Keywords ***
Obter Token de Login
    [Arguments]    ${email}    ${password}
    ${response} =    Obter Resposta de Login  ${email}  ${password}
    Should Be Equal As Numbers  ${response.status_code}  200
    ${token} =    Get From Dictionary    ${response.json()}    authorization
    RETURN    ${token}

Obter Resposta de Login
    [Arguments]    ${email}    ${password}
    ${body}        Create Dictionary    email=${email}    password=${password}
    ${headers}     Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    serverest    /login    json=${body}    headers=${headers}    expected_status=200
    RETURN    ${response}
