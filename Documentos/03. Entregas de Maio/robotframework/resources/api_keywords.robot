*** Settings ***
Library           RequestsLibrary
Library           OperatingSystem
Library           JSONLibrary

*** Variables ***
${API_BASE_URL}   https://reqres.in/api
${API_KEY}        reqres-free-v1

*** Keywords ***
Iniciar Sessão
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}    Content-Type=application/json
    Create Session    reqres    ${API_BASE_URL}    headers=${headers}

GET Listar Usuários
    [Arguments]    ${page}=2
    Iniciar Sessão
    ${res}=    GET On Session    reqres    url=/users?page=${page}    expected_status=anything
    Log    ${res.json()}
    RETURN    ${res}

GET Obter Usuário
    [Arguments]    ${id}
    Iniciar Sessão
    ${res}=    GET On Session    reqres    url=/users/${id}    expected_status=anything
    Log    ${res.json()}
    RETURN    ${res}

DELETE Usuário
    [Arguments]    ${id}
    Iniciar Sessão
    ${res}=    DELETE On Session    reqres    url=/users/${id}    expected_status=anything
    RETURN    ${res.status_code}

POST Criar Usuário
    [Arguments]    ${payload}
    Iniciar Sessão
    ${res}=    POST On Session    reqres    url=/users    json=${payload}
    Log    ${res.json()}
    RETURN    ${res}

PUT Atualizar Usuário
    [Arguments]    ${id}    ${payload}
    Iniciar Sessão
    ${res}=    PUT On Session    reqres    url=/users/${id}    json=${payload}
    Log    ${res.json()}
    RETURN    ${res}

POST Registrar Usuário
    [Arguments]    ${payload}
    Iniciar Sessão
    ${res}=    POST On Session    reqres    url=/register    json=${payload}
    RETURN    ${res}

POST Login Usuário
    [Arguments]    ${payload}
    ${res}=    POST On Session    reqres    url=/login    json=${payload}    expected_status=anything
    RETURN    ${res}

PATCH Atualizar Usuário
    [Arguments]    ${id}    ${payload}
    Iniciar Sessão
    ${res}=    PATCH On Session    reqres    url=/users/${id}    json=${payload}
    Log    ${res.json()}
    RETURN    ${res}