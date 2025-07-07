*** Settings ***
Documentation    Base para todos os testes
Library          Browser
Resource         ./AuthPage.resource
Resource         ../components/Mongo.resource

*** Variables ***
${HEADLESS}      %{ROBOT_BROWSER_HEADLESS}

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=${HEADLESS}    args=["--no-sandbox", "--disable-dev-shm-usage"]
    New Page       http://localhost:3002/
