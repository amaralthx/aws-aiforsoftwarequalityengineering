*** Settings ***
Documentation        Cenários de testes de remoção de tarefas
Resource             ../../resources/base.resource
Test Setup           Start Session
Test Teardown        Take Screenshot


*** Test Cases ***
Deve poder apagar uma tarefa indesejada
    ${data}        Get fixtures    tasks    delete
    Reset user from database    ${data}[user]
    Create a new task from API  ${data}
    Do login                    ${data}[user]
    # POST user session           ${data}[user]
    # POST a new task             ${data}[task]
    # Submit login form           ${data}[user]
    # User should be logged in    ${data}[user][name]
    # Mark task as completed      ${data}[task][name]
    # Task should be complete     ${data}[task][name]
    Request removal             ${data}[task][name]
    Task should not exist       ${data}[task][name]
    Sleep                       2