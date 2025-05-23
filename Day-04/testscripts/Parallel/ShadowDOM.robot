*** Settings ***
Library    Browser


*** Test Cases ***
ShadowDOM
    New Browser    chromium    headless=${False}
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       http://uitestingplayground.com/shadowdom

    ${DOMelem}    Get Element    guid-generator > input#editField
    Type Text    ${DOMelem}    Welcome
    Click    guid-generator > button#buttonGenerate

    ${DOMtext}    Get Text   guid-generator > input#editField
    Log    ${DOMtext}

