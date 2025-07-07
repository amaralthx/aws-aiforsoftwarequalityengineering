*** Settings ***
Documentation    Cenários de cadastro de usuários
Resource         ../pages/base.resource
Resource         ../components/SignupPage.resource
Resource         ../components/Mongo.resource
Test Setup       Limpar Dados Antes do Teste
Test Teardown    Limpar Dados Após Teste

*** Keywords ***
Limpar Dados Antes do Teste
    Start Session
    Remover Usuário Existente    thais@yahoo.com
    Take Screenshot    filename=antes_do_teste.png

Limpar Dados Após Teste
    Remover Usuário Existente    thais@yahoo.com
    Take Screenshot    filename=apos_teste.png
    Close Browser

Remover Usuário Existente
    [Arguments]    ${email}
    ${user_existe}    Obter usuário por email    ${email}
    Run Keyword If    $user_existe is not $None    Remover usuário por email    ${email}

*** Test Cases ***
Deve poder cadastrar um novo usuário
    ${user}    Create Dictionary
    ...    name=Thaís Amaral
    ...    email=thais@yahoo.com
    ...    password=pwd123
    ...    confirmPassword=pwd123

    Go to signup page
    Take Screenshot    filename=antes_preencher_form.png
    
    Submit signup form    ${user}
    Take Screenshot    filename=apos_submissao.png
    
    ${db_user}    Obter usuário por email    ${user}[email]
    Should Not Be Equal    ${db_user}    ${None}
    Should Be Equal    ${db_user}[name]    ${user}[name]

    Take Screenshot    filename=apos_cadastro.png

