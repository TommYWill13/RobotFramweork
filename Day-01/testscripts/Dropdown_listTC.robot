*** Settings ***
Library    Browser
Suite Setup    Open Browser   ${URL}    ${browser}
Suite Teardown    Close Browser


*** Variables ***
${URL}    https://testautomationpractice.blogspot.com/
${browser}    chromium


*** Test Cases ***

Test Case to Select Dropdown Values

    Scroll To Element    \#country
    Select Options By    \#country    label    Japan
    ${countries}    Get Selected Options    \#country
    Log Many    ${countries}

    Select Options By    \#country    index    3
    ${selectedcountry}    Get Selected Options    \#country
    Set Browser Timeout    timeout=10s
    Wait For Elements State    \#country    selected
    Log Many    ${selectedcountry}

    
Test Case to Select values from list

    Scroll To Element    \#animals
    Select Options By    \#animals    Label    Deer    Fox
    @{selectedValues}=    Get Selected Options    \#animals
    Log Many    ${selectedValues}