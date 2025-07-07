*** Settings ***
Documentation    Ações e elementos da página de cadastro
Library          Browser

*** Keywords ***
Submit signup form
    [Arguments]    ${user}
    Wait For Elements State    id=name               visible
    Fill Text      id=name               ${user}[name]
    Fill Text      id=email              ${user}[email]
    Fill Text      id=password           ${user}[password]
    Fill Text      id=confirmPassword    ${user}[confirmPassword]
    Take Screenshot    filename=form_preenchido.png
    Click          css=button[type=submit]

Go to signup page
    Click          text=Cadastrar
    Wait For Elements State    id=name    visible