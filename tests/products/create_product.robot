*** Settings ***
Documentation    Validate product creation endpoint

Resource    ../../resources/keywords/products/product_keywords.robot

Variables    ../../resources/payloads/product_payloads.py

Suite Setup    Create API Session

# This test suite covers product creation operations.

*** Test Cases ***

Create Product
    [Tags]    regression    create

    ${response}=    POST On Session    fakestore    /products    json=${CREATE_PRODUCT_PAYLOAD}    headers=${HEADERS_JSON}

    Validate Status Code    response=${response}    expected_status=201

    Response Should Contain    response=${response}    expected=Professional Robot Product
