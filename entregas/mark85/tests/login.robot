*** Settings ***
Documentation        Cenários de autenticação do usuário
Test Setup           Start Session
Test Teardown        Take Screenshot
Resource             ../resources/base.resource
Library              ../resources/libs/database.py
Library              Collections
Library              Process

*** Test Cases ***
Deve poder logar com um usuário pré-cadastrado
    ${user}    Create Dictionary
    ...    name=Thaís do Amaral Cordeiro
    ...    email=thaisamaral@hotmail.com
    ...    password=123456789
    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    Submit login form            ${user}
    User should be logged in     ${user}[name]

Não deve logar com senha inválida
    ${user}    Create Dictionary
    ...    name=Steve Woz
    ...    email=woz@apple.com
    ...    password=123456
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    Set To Dictionary            ${user}        password=abc123
    Submit login form            ${user}
    Notice should be             Ocorreu um erro ao fazer login, verifique suas credenciais.
