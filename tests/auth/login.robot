*** Settings ***
Documentation    Validate login endpoint

Resource    ../../resources/keywords/auth/auth_keywords.robot

Suite Setup    Create API Session

*** Test Cases ***

# Verify the login endpoint returns a valid authentication token.
Login Successfully
    [Tags]    smoke    auth

    ${token}=    Login And Get Token

    Should Not Be Empty    ${token}
