*** Settings ***
Resource    ../common/common_keywords.robot

*** Keywords ***

# Authentication keywords for login and token retrieval.

Login And Get Token
    # Send login request and retrieve authentication token.
    ${response}=    POST On Session    fakestore    /auth/login    json=${VALID_USER}    headers=${HEADERS_JSON}

    Validate Status Code    response=${response}    expected_status=201

    ${token}=    Get Value From Json    ${response.json()}    $.token

    RETURN    ${token}[0]
