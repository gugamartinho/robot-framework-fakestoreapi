*** Settings ***
Resource    ../common/common_keywords.robot

*** Keywords ***

# Product domain keywords for validating product responses.

Validate Product Data
    [Arguments]    ${product}

    # Validate required fields on a single product object.
    Dictionary Should Contain Key    ${product}    id
    Dictionary Should Contain Key    ${product}    title
    Dictionary Should Contain Key    ${product}    price
    Dictionary Should Contain Key    ${product}    category
    Should Be True    ${product['price']} > 0

Validate Product List
    [Arguments]    ${products}    ${expected_count}

    # Verify the total number of returned products and validate each item.
    Length Should Be    ${products}    ${expected_count}
    FOR    ${product}    IN    @{products}
        Validate Product Data    ${product}
    END
