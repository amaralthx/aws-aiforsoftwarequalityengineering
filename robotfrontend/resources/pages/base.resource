*** Settings ***
Documentation    Base para todos os testes
Library          Browser
Resource         ../components/SignupPage.resource
Resource         ../components/Mongo.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3002/

Get fixtures
    [Arguments]    ${file_name}    ${scenario}
    ${data}    Load Json From File
    ...        fixtures/${file_name}.json
    ...        encoding=utf-8
    RETURN    ${data}[${scenario}]






