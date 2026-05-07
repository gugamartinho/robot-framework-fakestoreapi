*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

# Load project variables from Python variable file.
Variables    ../../config/variables.py

*** Keywords ***

# Common keywords that can be used by any test suite.

Create API Session
    # Creates a reusable HTTP session for FakeStoreAPI calls.
    Create Session    fakestore    ${BASE_URL}    verify=True

Validate Status Code
    [Arguments]    ${response}    ${expected_status}

    # Verify the HTTP response status code matches the expected value.
    Status Should Be    ${expected_status}    ${response}

Validate Response Time
    [Arguments]    ${response}    ${max_ms}

    # Validate the API response time in milliseconds.
    ${response_time}=    Evaluate    ${response.elapsed.total_seconds()} * 1000

    Should Be True    ${response_time} < ${max_ms}

Response Should Contain
    [Arguments]    ${response}    ${expected}

    # Confirm the response body contains the expected text.
    Should Contain    ${response.text}    ${expected}
