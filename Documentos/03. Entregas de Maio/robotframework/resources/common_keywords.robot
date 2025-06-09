*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${REQRES_API_KEY}    reqres-free-v1
&{HEADERS_JSON_COMMON}      Content-Type=application/json
&{HEADERS_API_KEY}          x-api-key=${REQRES_API_KEY}
&{HEADERS_JSON_API_KEY}     Content-Type=application/json  x-api-key=${REQRES_API_KEY}
${AUTH_TOKEN}      eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlJvYm90IFVzZXIiLCJpYXQiOjE2NzgwMDY1NzB9.SflKxwRJSMeKKF2QT4fwpMeJf36POkO6yJV_adQssw5c
&{HEADERS_AUTH_COMMON}      Authorization=${AUTH_TOKEN}
&{HEADERS_JSON_AUTH_COMMON}  Content-Type=application/json  Authorization=${AUTH_TOKEN}


*** Keywords ***
Criar Sessao API
    [Arguments]    ${session_name}    ${base_url}
    Create Session    ${session_name}    ${base_url}
    Log To Console    Headers JSON Common (dentro da sessão): ${HEADERS_JSON_COMMON} (Tipo: ${HEADERS_JSON_COMMON._class.name_})
    Log To Console    Headers API Key (dentro da sessão): ${HEADERS_API_KEY} (Tipo: ${HEADERS_API_KEY._class.name_})
    Log To Console    Headers JSON API Key (dentro da sessão): ${HEADERS_JSON_API_KEY} (Tipo: ${HEADERS_JSON_API_KEY._class.name_})
    Log To Console    Headers Auth Common (dentro da sessão): ${HEADERS_AUTH_COMMON} (Tipo: ${HEADERS_AUTH_COMMON._class.name_})
    Log To Console    Headers JSON Auth Common (dentro da sessão): ${HEADERS_JSON_AUTH_COMMON} (Tipo: ${HEADERS_JSON_AUTH_COMMON._class.name_})


Validar Status Code
    [Arguments]    ${response}    ${expected_status}
    Status Should Be    ${expected_status}    ${response}
    Log To Console    Status da Resposta: ${response.status_code}
    Log To Console    Corpo da Resposta: ${response.text}

Validar Resposta Nao Vazia e Chaves
    [Documentation]    Valida se a resposta JSON não é vazia e contém todas as chaves esperadas.
    [Arguments]    ${response}    @{expected_keys}
    ${json_obj}=    Convert String To JSON    ${response.text}
    Should Not Be Empty    ${json_obj}
    FOR    ${key}    IN    @{expected_keys}
        Dictionary Should Contain Key    ${json_obj}    ${key}
    END