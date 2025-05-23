*** Settings ***
Library    Browser
Suite Setup    Open Browser   ${URL}    ${browser}
Suite Teardown    Close Browser


*** Variables ***
${URL}    https://testautomationpractice.blogspot.com/
${browser}    chromium


*** Test Cases ***

Handle Checkbox
    Scroll To Element    \#sunday
    Check Checkbox    \#sunday
    Check Checkbox    \#monday
    Check Checkbox    \#tuesday

    Get Checkbox State    \#sunday    ==    True
    Uncheck Checkbox    \#sunday
    Sleep     5s

Handle RadioButton
    Scroll To Element    \#male
    Check Checkbox    \#male

    ${gender}    Get Text    \#male
    Run Keyword If    '${gender}' == 'male' 
    ...    Log    'selected gender is ' ${gender}

    Get Checkbox State    \#male    ==    True
    Sleep     5s