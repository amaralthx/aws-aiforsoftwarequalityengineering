*** Settings ***
Library    ../../libs/database.py    WITH NAME    Mongo

*** Keywords ***
Remover usuário por email
    [Arguments]    ${email}
    Log To Console    Tentando remover usuário: ${email}
    ${result}    Mongo.Delete User    ${email}
    Run Keyword If    not ${result}    Log To Console    Usuário não existia: ${email}

Obter usuário por email
    [Arguments]    ${email}
    ${user}    Mongo.Get User    ${email}
    RETURN    ${user}

Limpar todos os usuários
    ${deletados}    Mongo.Delete All Users
    Log To Console    ${deletados} usuários removidos da coleção
