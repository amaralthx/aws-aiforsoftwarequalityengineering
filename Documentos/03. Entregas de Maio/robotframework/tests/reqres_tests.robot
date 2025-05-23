*** Comments ***
# Testes iniciais robot framework

*** Settings ***
Resource    ../resources/api_keywords.robot
Library     JSONLibrary
Library     Collections
Suite Setup     Iniciar Sessão

*** Test Cases ***
Cenário: GET Listar Usuários Sucesso
    ${res}=    GET Listar Usuários
    Should Be Equal As Integers    ${res.status_code}    200

Cenário: GET Obter Usuário Único Sucesso
    ${res}=    GET Obter Usuário    2
    Should Be Equal As Integers    ${res.status_code}    200
    Dictionary Should Contain Key    ${res.json()}    data

Cenário: GET Obter Usuário Não Encontrado
    ${res}=    GET Obter Usuário    23
    Should Be Equal As Integers    ${res.status_code}    404

Cenário: POST Criar Usuário Sucesso
    ${payload}=    Load JSON From File    payloads/create_user.json
    ${res}=    POST Criar Usuário    ${payload}
    Should Be Equal As Integers    ${res.status_code}    201
    Dictionary Should Contain Key    ${res.json()}    id

Cenário: PUT Atualizar Usuário Sucesso
    ${payload}=    Load JSON From File    payloads/update_user.json
    ${res}=    PUT Atualizar Usuário    2    ${payload}
    Should Be Equal As Integers    ${res.status_code}    200

Cenário: POST Login Usuário Senha Ausente 1
    ${payload}=    Load JSON From File    payloads/login_missing_password.json
    ${res}=    POST Login Usuário    ${payload}
    Should Be Equal As Integers    ${res.status_code}    400
    ${body}=    Set Variable    ${res.json()}
    Dictionary Should Contain Key    ${body}    error
    Should Be Equal    ${body["error"]}    Missing password

Cenário: POST Login Usuário Senha Ausente 2
    ${payload}=    Load JSON From File    payloads/login_missing_password.json
    ${res}=    POST Login Usuário    ${payload}
    Should Be Equal As Integers    ${res.status_code}    400
    ${body}=    Set Variable    ${res.json()}
    Dictionary Should Contain Key    ${body}    error
    Should Be Equal    ${body["error"]}    Missing password

Cenário: PATCH Atualizar Usuário Parcialmente
    ${payload}=    Load JSON From File    payloads/patch_user.json
    ${res}=    PATCH Atualizar Usuário    2    ${payload}
    ${body}=    Get From Dictionary    ${res.json()}    job
    Should Be Equal    ${body}    Senior Developer

    # Linha de comentário para testar Pull Request