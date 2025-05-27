*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    OperatingSystem
Library    Collections
Library    DateTime

*** Variables ***
${REQRES_API_KEY}    %{REQRES_API_KEY}    # Changed to use environment variable
${AUTH_TOKEN}        %{AUTH_TOKEN}         # Changed to use environment variable

# Simplified headers structure
&{HEADERS_JSON_COMMON}      Content-Type=application/json
&{HEADERS_API_KEY}          x-api-key=${REQRES_API_KEY}
&{HEADERS_AUTH}             Authorization=${AUTH_TOKEN}

# Combined headers using Create Dictionary keyword in Keywords section for better maintainability

*** Keywords ***
Criar Sessao API
    [Arguments]    ${session_name}    ${base_url}
    [Documentation]    Creates an API session with the specified name and base URL
    Create Session    ${session_name}    ${base_url}    verify=True    # Added SSL verification
    Log Session Headers

Log Session Headers
    [Documentation]    Logs all header configurations for debugging purposes
    ${headers}=    Create Dictionary    
    ...    JSON_COMMON=${HEADERS_JSON_COMMON}    
    ...    API_KEY=${HEADERS_API_KEY}    
    ...    AUTH=${HEADERS_AUTH}
    Log Dictionary    ${headers}

Validar Status Code
    [Arguments]    ${response}    ${expected_status}
    [Documentation]    Validates only the status code of the response
    Status Should Be    ${expected_status}    ${response}
    Log To Console    Status da Resposta: ${response.status_code}

Validar Corpo Da Resposta
    [Arguments]    ${response}
    [Documentation]    Validates only that the response body is not empty
    Should Not Be Empty    ${response.text}
    Log To Console    Corpo da Resposta: ${response.text}

Validar Chave Especifica Na Resposta
    [Arguments]    ${response}    ${expected_key}
    [Documentation]    Validates the presence of a single specific key in the response
    ${json_obj}=    Convert String To JSON    ${response.text}
    Dictionary Should Contain Key    ${json_obj}    ${expected_key}

Validar Multiplas Chaves Na Resposta
    [Arguments]    ${response}    @{expected_keys}
    [Documentation]    Validates multiple keys in the response, one at a time
    ${json_obj}=    Convert String To JSON    ${response.text}
    FOR    ${key}    IN    @{expected_keys}
        Run Keyword    Validar Chave Especifica Na Resposta    ${response}    ${key}
    END

Obter Headers JSON Com API Key
    [Documentation]    Returns headers with JSON content type and API key
    ${headers}=    Create Dictionary    
    ...    Content-Type=application/json    
    ...    x-api-key=${REQRES_API_KEY}
    [Return]    ${headers}

Obter Headers JSON Com Auth
    [Documentation]    Returns headers with JSON content type and authentication
    ${headers}=    Create Dictionary    
    ...    Content-Type=application/json    
    ...    Authorization=${AUTH_TOKEN}
    [Return]    ${headers}

Validar Tempo De Resposta
    [Arguments]    ${response}    ${max_time}
    [Documentation]    Validates if the response time is within acceptable limits
    Should Be True    ${response.elapsed.total_seconds()} < ${max_time}
    Log To Console    Tempo de Resposta: ${response.elapsed.total_seconds()} segundos
