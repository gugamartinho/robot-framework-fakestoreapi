*** Settings ***
Documentation    Validate product retrieval endpoints

Resource    ../../resources/keywords/products/product_keywords.robot

Suite Setup    Create API Session

*** Test Cases ***

# Verify that the /products endpoint returns a successful response and payload.
Get All Products
    [Tags]    smoke    regression    products

    ${response}=    GET On Session    fakestore    /products

    Validate Status Code    response=${response}    expected_status=200

    Validate Response Time    response=${response}    max_ms=2000

    Should Not Be Empty    ${response.json()}


# Verify that a single product can be retrieved by ID.
Get Single Product
    [Tags]    regression    products

    ${response}=    GET On Session    fakestore    /products/1

    Validate Status Code    response=${response}    expected_status=200

    Response Should Contain    response=${response}    expected=Fjallraven


# Validate the structure and fields of a single returned product.
Validate Product Structure
    [Tags]    regression    products

    ${response}=    GET On Session    fakestore    /products/1

    Validate Status Code    response=${response}    expected_status=200

    ${product}=    Set Variable    ${response.json()}

    Validate Product Data    ${product}


# Validate API behavior when requesting a non-existing product.
Get Product With Invalid ID
    [Tags]    regression    products

    ${response}=    GET On Session    fakestore    /products/99999

    Validate Status Code    response=${response}    expected_status=200

    Should Be Empty    ${response.text}


# Validate the response for the full product list and assert each item properties.
Validate Multiple Products Response
    [Tags]    regression    products

    ${response}=    GET On Session    fakestore    /products

    Validate Status Code    response=${response}    expected_status=200

    ${products}=    Set Variable    ${response.json()}

    Validate Product List    ${products}    expected_count=20
