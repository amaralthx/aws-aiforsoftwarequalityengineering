*** Settings ***
Documentation        Cenários de cadastro de tarefas
Resource             ../../resources/base.resource
Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    [Tags]    critical
    ${data}    Get fixtures    tasks    create
    Reset user from database     ${data}[user]
    Do login    ${data}[user]
    Go to task form        
    Submit task form             ${data}[task]
    Task should be registered    ${data}[task][name]
    Sleep                        1
    
Não deve cadastrar tarefa com nome duplicado
    [Tags]    dup
    ${data}    Get fixtures    tasks    duplicate
    Reset user from database    ${data}[user]
    Create a new task from API  ${data}
    Do login                    ${data}[user]
    Go to task form
    Submit task form            ${data}[task]

    # Dado que eu tenho um novo usuário
    # Clean user from database     ${data}[user][email]
    # Insert user from database    ${data}[user]

    # E que esse usuário já cadastrou uma tarefa
    # POST user session            ${data}[user]
    # POST a new task              ${data}[task]

    # # E que estou logado na aplicação web
    # Submit login form            ${data}[user]
    # User should be logged in     ${data}[user][name]

    # # Quando tento cadastrar essa tarefa que já foi cadastrada
    # Go to task form
    # Submit task form             ${data}[task]

    # Então devo ver uma notificação de duplicidade
    Notice should be             Oops! Tarefa duplicada.
    Sleep                        1

Não deve cadastrar uma nova tarefa quando atinge limite de tags
    [Tags]    tags_limit
    ${data}    Get fixtures    tasks    tags_limit
    # Dado que eu tenho um novo usuário
    # Clean user from database     ${data}[user][email]
    # Insert user from database    ${data}[user]
    Reset user from database     ${data}[user]
    Create a new task from API   ${data}

    # E que estou logado na aplicação web
    # Submit login form            ${data}[user]
    # User should be logged in     ${data}[user][name]

    Do login    ${data}[user]

    # Quando tento cadastrar essa tarefa que já foi cadastrada
    Go to task form
    Submit task form             ${data}[task]

    # Então devo ver uma notificação de duplicidade
    Notice should be             Oops! Limite de tags atingido.
    Sleep                        1



